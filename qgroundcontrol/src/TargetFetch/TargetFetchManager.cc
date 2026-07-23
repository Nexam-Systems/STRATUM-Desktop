#include "TargetFetchManager.h"
#include "AppMessages.h"
#include "QGCLoggingCategory.h"

#include <QtCore/QApplicationStatic>
#include <QtCore/QDateTime>
#include <QtCore/QTimer>
#include <QtNetwork/QUdpSocket>

QGC_LOGGING_CATEGORY(TargetFetchLog, "TargetFetch.TargetFetchManager")

Q_APPLICATION_STATIC(TargetFetchManager, _targetFetchManager);

namespace {
// --- Pod wiring (matches XC25_CameraControl / XC25_CoordFetch). Edit if it differs. ---
const char       *POD_IP       = "192.168.1.253";  // the pod
constexpr quint16 CMD_PORT     = 1030;             // pod receives the ping here
constexpr quint16 STATUS_PORT  = 4000;             // we bind here; the pod replies here

constexpr int    PING_INTERVAL_MS  = 40;           // 25 Hz during the registration ping
constexpr int    PING_MAX_TICKS    = 125;          // give up the ping after ~5 s
constexpr qint64 FRESHNESS_MS      = 5000;         // a live target older than this is stale
constexpr int    FETCH_INTERVAL_MS = 2000;         // re-read every 2 s
constexpr int    FETCH_MAX_TICKS   = 15;           // 15 x 2 s = 30 s session

constexpr quint8 kHdr0 = 0x55, kHdr1 = 0xAA, kHdr2 = 0xDC;
constexpr quint8 kFrameStatus = 0x40;

quint8 xorSum(const quint8 *p, int n)
{
    quint8 c = 0;
    for (int i = 0; i < n; ++i) c ^= p[i];
    return c;
}

qint32 be32(const quint8 *p)
{
    const quint32 u = (quint32(p[0]) << 24) | (quint32(p[1]) << 16) |
                      (quint32(p[2]) << 8)  |  quint32(p[3]);
    return static_cast<qint32>(u);
}

qint16 be16(const quint8 *p)
{
    return static_cast<qint16>((quint16(p[0]) << 8) | quint16(p[1]));
}

// AHRS/M heartbeat, matching XC25_CameraControl's poke: combo 0x01 (attitude present,
// all zeros), no GPS. Sent only briefly to register this machine with the pod.
QByteArray buildPing()
{
    QByteArray body(42, '\0');
    body[0] = 0x01;
    const quint8 lc = 45 & 0x3F;                    // n = len(body) + 3 = 45
    QByteArray f;
    f.append(char(kHdr0)); f.append(char(kHdr1)); f.append(char(kHdr2));
    f.append(char(lc));    f.append(char(0xB1));
    f.append(body);
    quint8 cs = lc ^ 0xB1;
    for (char c : body) cs ^= static_cast<quint8>(c);
    f.append(char(cs));
    return f;
}
} // namespace

TargetFetchManager::TargetFetchManager(QObject *parent)
    : QObject(parent)
    , _socket(new QUdpSocket(this))
    , _podAddr(QString::fromLatin1(POD_IP))
{
    _pingFrame = buildPing();

    if (_socket->bind(QHostAddress::AnyIPv4, STATUS_PORT, QUdpSocket::ShareAddress)) {
        (void) connect(_socket, &QUdpSocket::readyRead, this, &TargetFetchManager::_readPendingDatagrams);
        qCDebug(TargetFetchLog) << "listening for pod status on UDP" << STATUS_PORT;
    } else {
        qCWarning(TargetFetchLog) << "failed to bind UDP" << STATUS_PORT << ":" << _socket->errorString();
        _setStatus(tr("Cannot open UDP %1: %2").arg(STATUS_PORT).arg(_socket->errorString()));
    }

    _fetchTimer = new QTimer(this);
    _fetchTimer->setInterval(FETCH_INTERVAL_MS);
    _fetchTimer->setSingleShot(false);
    (void) connect(_fetchTimer, &QTimer::timeout, this, &TargetFetchManager::_onFetchTick);

    _pingTimer = new QTimer(this);
    _pingTimer->setInterval(PING_INTERVAL_MS);
    _pingTimer->setSingleShot(false);
    (void) connect(_pingTimer, &QTimer::timeout, this, &TargetFetchManager::_sendPing);
}

TargetFetchManager::~TargetFetchManager() = default;

TargetFetchManager *TargetFetchManager::instance()
{
    return _targetFetchManager();
}

void TargetFetchManager::pingPod()
{
    // Brief heartbeat burst to register this machine with the pod, then stop. It stops
    // as soon as the pod starts replying, so it holds "control" for the minimum time.
    _pingTicks = 0;
    _pinging = true;
    _sendPing();
    _pingTimer->start();
    _setStatus(tr("Pinging pod %1 to register this machine...").arg(QString::fromLatin1(POD_IP)));
    qCDebug(TargetFetchLog) << "pingPod: registering with" << POD_IP << ":" << CMD_PORT;
}

void TargetFetchManager::_sendPing()
{
    _socket->writeDatagram(_pingFrame, _podAddr, CMD_PORT);
    if (++_pingTicks >= PING_MAX_TICKS) {
        _pingTimer->stop();
        _pinging = false;
        if (_datagrams == 0) {
            _setStatus(tr("Ping finished but no reply from the pod yet. Check the pod is on "
                          "%1 and reachable, then try Fetch Target.").arg(QString::fromLatin1(POD_IP)));
        }
    }
}

void TargetFetchManager::_readPendingDatagrams()
{
    while (_socket->hasPendingDatagrams()) {
        QByteArray datagram;
        datagram.resize(static_cast<int>(_socket->pendingDatagramSize()));
        const qint64 read = _socket->readDatagram(datagram.data(), datagram.size());
        if (read > 0) {
            const bool wasLinked = _datagrams > 0;
            ++_datagrams;
            if (!wasLinked) {
                qCDebug(TargetFetchLog) << "first pod datagram received (" << read << "bytes)";
                emit linkedChanged();
                if (_pinging) {                      // registered - stop the ping
                    _pingTimer->stop();
                    _pinging = false;
                    _setStatus(tr("Pod connected. Now connect the main GCS, then Fetch Target."));
                }
            }
            datagram.truncate(static_cast<int>(read));
            _scan(datagram);
        }
    }
}

void TargetFetchManager::_scan(const QByteArray &datagram)
{
    const int n = datagram.size();
    const quint8 *b = reinterpret_cast<const quint8 *>(datagram.constData());
    int i = 0;
    while (i + 6 <= n) {
        if (b[i] == kHdr0 && b[i + 1] == kHdr1 && b[i + 2] == kHdr2) {
            const int ln  = b[i + 3] & 0x3F;
            const int tot = ln + 3;
            if (i + tot <= n) {
                const int csPos = i + 2 + ln;
                if (b[i + 4] == kFrameStatus &&
                    xorSum(&b[i + 3], csPos - (i + 3)) == b[csPos]) {
                    ++_statusFrames;
                    const int bodyStart = i + 5;             // T1 = first 22 body bytes
                    if (bodyStart + 22 <= n) {
                        _decodeT1(&b[bodyStart]);
                    }
                }
                i += tot;
                continue;
            }
        }
        ++i;
    }
}

void TargetFetchManager::_decodeT1(const quint8 *body)
{
    // T1: target lat = bytes 12..15 (int32, 1e-7 deg), lon = 16..19, alt = 20..21 (m)
    const double lat = be32(body + 12) * 1e-7;
    const double lon = be32(body + 16) * 1e-7;
    const double alt = be16(body + 20);

    const bool valid = (lat != 0.0 || lon != 0.0) &&
                       (lat >= -90.0) && (lat <= 90.0) &&
                       (lon >= -180.0) && (lon <= 180.0);
    if (!valid) {
        return;                                  // 0,0 = no laser/GPS target this frame
    }
    _liveTarget = QGeoCoordinate(lat, lon, alt);
    _liveValid  = true;
    _liveRxMs   = QDateTime::currentMSecsSinceEpoch();
}

void TargetFetchManager::fetchTarget()
{
    _fetchTicks = 0;
    _sessionFailShown = false;
    _doFetch();
    _fetchTimer->start();
    _setStatus(tr("Fetching target for %1 s...").arg((FETCH_MAX_TICKS * FETCH_INTERVAL_MS) / 1000));
}

void TargetFetchManager::_onFetchTick()
{
    ++_fetchTicks;
    _doFetch();
    if (_fetchTicks >= FETCH_MAX_TICKS) {
        _fetchTimer->stop();
        qCDebug(TargetFetchLog) << "fetch session complete";
    }
}

void TargetFetchManager::_doFetch()
{
    const qint64 age = QDateTime::currentMSecsSinceEpoch() - _liveRxMs;
    if (!_liveValid || (age > FRESHNESS_MS)) {
        QString why;
        if (_datagrams == 0) {
            why = tr("No pod status yet. Press \"Connect Pod\" first (while the main GCS is "
                     "not yet connected), and check the pod (%1) is reachable and the firewall "
                     "allows inbound UDP %2.").arg(QString::fromLatin1(POD_IP)).arg(STATUS_PORT);
        } else if (_statusFrames == 0) {
            why = tr("Receiving %1 packets on UDP %2 but no valid pod status frames.")
                      .arg(_datagrams).arg(STATUS_PORT);
        } else if (!_liveValid) {
            why = tr("Pod status received, but no target is designated yet "
                     "(the pod's target reads 0,0 - needs a laser/GPS target).");
        } else {
            why = tr("Last target is stale (%1 s old) - is the pod still streaming?")
                      .arg(age / 1000);
        }
        _setStatus(why);
        if (!_sessionFailShown) {
            QGC::showAppMessage(why);
            _sessionFailShown = true;
        }
        qCDebug(TargetFetchLog) << "fetch:" << why << "| datagrams" << _datagrams
                                << "statusFrames" << _statusFrames << "liveValid" << _liveValid;
        return;
    }

    // Remove the previous marker, then plot the new one.
    _targetValid = false;
    emit targetChanged();
    _targetCoordinate = _liveTarget;
    _targetValid = true;
    emit targetChanged();

    _setStatus(tr("Target plotted: %1, %2")
                   .arg(_targetCoordinate.latitude(), 0, 'f', 6)
                   .arg(_targetCoordinate.longitude(), 0, 'f', 6));
    qCDebug(TargetFetchLog) << "plotted target" << _targetCoordinate;
}

void TargetFetchManager::clearTarget()
{
    if (_fetchTimer) _fetchTimer->stop();
    if (_targetValid) {
        _targetValid = false;
        emit targetChanged();
    }
}

void TargetFetchManager::_setStatus(const QString &text)
{
    if (_statusText != text) {
        _statusText = text;
        emit statusTextChanged();
    }
}
