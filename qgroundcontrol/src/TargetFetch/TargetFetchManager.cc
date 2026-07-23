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
// --- Pod wiring (matches XC25_CameraControl / XC25_CoordFetch). Edit here if the
//     deployment differs. ---
const char *POD_IP        = "192.168.1.253";   // the pod
constexpr quint16 CMD_PORT     = 1030;         // pod receives control/heartbeat here
constexpr quint16 STATUS_PORT  = 4000;         // we bind & the pod replies here

constexpr int    HEARTBEAT_MS     = 40;        // 25 Hz M heartbeat while fetching
constexpr qint64 FRESHNESS_MS     = 5000;      // a live target older than this is stale
constexpr int    FETCH_INTERVAL_MS = 2000;     // re-fetch every 2 s
constexpr int    FETCH_MAX_TICKS   = 15;       // 15 x 2 s = 30 s session

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

// Minimal AHRS/M heartbeat: 42-byte body, combo byte 0 => NO attitude/GPS carried,
// so it will not overwrite what the real controller feeds; it just keeps the pod
// streaming its status to whoever sends it.
QByteArray buildHeartbeat()
{
    QByteArray body(42, '\0');
    const quint8 lc = 45 & 0x3F;               // n = len(body) + 3 = 45
    QByteArray f;
    f.append(char(kHdr0)); f.append(char(kHdr1)); f.append(char(kHdr2));
    f.append(char(lc));    f.append(char(0xB1));
    f.append(body);
    f.append(char(lc ^ 0xB1));                  // xor over [lc, fid, body(zeros)]
    return f;
}
} // namespace

TargetFetchManager::TargetFetchManager(QObject *parent)
    : QObject(parent)
    , _socket(new QUdpSocket(this))
    , _podAddr(QString::fromLatin1(POD_IP))
{
    _heartbeat = buildHeartbeat();

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

    _heartbeatTimer = new QTimer(this);
    _heartbeatTimer->setInterval(HEARTBEAT_MS);
    _heartbeatTimer->setSingleShot(false);
    (void) connect(_heartbeatTimer, &QTimer::timeout, this, &TargetFetchManager::_sendHeartbeat);
}

TargetFetchManager::~TargetFetchManager() = default;

TargetFetchManager *TargetFetchManager::instance()
{
    return _targetFetchManager();
}

void TargetFetchManager::_sendHeartbeat()
{
    // Poke the pod so it streams its status back to this machine (source port =
    // STATUS_PORT, so the pod replies to STATUS_PORT).
    _socket->writeDatagram(_heartbeat, _podAddr, CMD_PORT);
}

void TargetFetchManager::_readPendingDatagrams()
{
    while (_socket->hasPendingDatagrams()) {
        QByteArray datagram;
        datagram.resize(static_cast<int>(_socket->pendingDatagramSize()));
        const qint64 read = _socket->readDatagram(datagram.data(), datagram.size());
        if (read > 0) {
            if (_datagrams == 0) {
                qCDebug(TargetFetchLog) << "first pod datagram received (" << read << "bytes)";
            }
            ++_datagrams;
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
    _heartbeatTimer->start();                    // start poking the pod
    _sendHeartbeat();                            // one immediately
    _doFetch();                                  // try now (usually empty on first click)
    _fetchTimer->start();
    _setStatus(tr("Fetching target for %1 s...").arg((FETCH_MAX_TICKS * FETCH_INTERVAL_MS) / 1000));
}

void TargetFetchManager::_onFetchTick()
{
    ++_fetchTicks;
    _doFetch();
    if (_fetchTicks >= FETCH_MAX_TICKS) {
        _fetchTimer->stop();
        _heartbeatTimer->stop();                 // stop poking the pod
        qCDebug(TargetFetchLog) << "fetch session complete";
    }
}

void TargetFetchManager::_doFetch()
{
    const qint64 age = QDateTime::currentMSecsSinceEpoch() - _liveRxMs;
    if (!_liveValid || (age > FRESHNESS_MS)) {
        QString why;
        if (_datagrams == 0) {
            why = tr("No status from the pod on UDP %1. Check this PC is on the pod network "
                     "(pod %2 reachable) and the firewall allows inbound UDP %1.")
                      .arg(STATUS_PORT).arg(QString::fromLatin1(POD_IP));
        } else if (_statusFrames == 0) {
            why = tr("Receiving %1 packets on UDP %2 but no valid pod status frames.")
                      .arg(_datagrams).arg(STATUS_PORT);
        } else if (!_liveValid) {
            why = tr("Pod status received, but no target is designated yet "
                     "(the pod's target reads 0,0 - needs a laser/GPS target).");
        } else {
            why = tr("Last target is stale (%1 s old).").arg(age / 1000);
        }
        _setStatus(why);
        // Give the pod a few seconds to start streaming before complaining.
        if (!_sessionFailShown && _fetchTicks >= 3) {
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
    if (_fetchTimer)     _fetchTimer->stop();
    if (_heartbeatTimer) _heartbeatTimer->stop();
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
