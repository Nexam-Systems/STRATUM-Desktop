#include "TargetFetchManager.h"
#include "AppMessages.h"
#include "QGCLoggingCategory.h"

#include <QtCore/QApplicationStatic>
#include <QtCore/QDateTime>
#include <QtNetwork/QHostAddress>
#include <QtNetwork/QUdpSocket>

QGC_LOGGING_CATEGORY(TargetFetchLog, "TargetFetch.TargetFetchManager")

Q_APPLICATION_STATIC(TargetFetchManager, _targetFetchManager);

namespace {
constexpr quint8 kHdr0 = 0x55;
constexpr quint8 kHdr1 = 0xAA;
constexpr quint8 kHdr2 = 0xDC;
constexpr quint8 kFrameStatus = 0x40;   // TS common-status frame id (carries T1)

quint8 xorSum(const quint8 *p, int n)
{
    quint8 c = 0;
    for (int i = 0; i < n; ++i) {
        c ^= p[i];
    }
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
} // namespace

TargetFetchManager::TargetFetchManager(QObject *parent)
    : QObject(parent)
    , _socket(new QUdpSocket(this))
{
    if (_socket->bind(QHostAddress::AnyIPv4, kListenPort, QUdpSocket::ShareAddress)) {
        (void) connect(_socket, &QUdpSocket::readyRead, this, &TargetFetchManager::_readPendingDatagrams);
        qCDebug(TargetFetchLog) << "Listening for relayed pod status on UDP" << kListenPort;
    } else {
        qCWarning(TargetFetchLog) << "Failed to bind UDP" << kListenPort << ":" << _socket->errorString();
        _setStatus(tr("Cannot open UDP %1: %2").arg(kListenPort).arg(_socket->errorString()));
    }
}

TargetFetchManager::~TargetFetchManager() = default;

TargetFetchManager *TargetFetchManager::instance()
{
    return _targetFetchManager();
}

void TargetFetchManager::_readPendingDatagrams()
{
    while (_socket->hasPendingDatagrams()) {
        QByteArray datagram;
        datagram.resize(static_cast<int>(_socket->pendingDatagramSize()));
        const qint64 read = _socket->readDatagram(datagram.data(), datagram.size());
        if (read > 0) {
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
                const int csPos = i + 2 + ln;                    // checksum byte
                if (b[i + 4] == kFrameStatus &&
                    xorSum(&b[i + 3], csPos - (i + 3)) == b[csPos]) {
                    const int bodyStart = i + 5;                 // T1 = first 22 body bytes
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
    // T1: target latitude  = bytes 12..15 (int32, LSB 1e-7 deg, WGS-84)
    //     target longitude = bytes 16..19 (int32, LSB 1e-7 deg)
    //     target altitude  = bytes 20..21 (int16, LSB 1 m)
    const double lat = be32(body + 12) * 1e-7;
    const double lon = be32(body + 16) * 1e-7;
    const double alt = be16(body + 20);

    const bool valid = (lat != 0.0 || lon != 0.0) &&
                       (lat >= -90.0) && (lat <= 90.0) &&
                       (lon >= -180.0) && (lon <= 180.0);
    if (!valid) {
        // 0,0 = no laser designation / no GPS fix this frame. Leave the last good
        // target in place; freshness (_liveRxMs) alone decides if it has gone stale.
        return;
    }

    _liveTarget = QGeoCoordinate(lat, lon, alt);
    _liveValid  = true;
    _liveRxMs   = QDateTime::currentMSecsSinceEpoch();
}

void TargetFetchManager::fetchTarget()
{
    const qint64 age = QDateTime::currentMSecsSinceEpoch() - _liveRxMs;
    if (!_liveValid || (age > kFreshnessMs)) {
        _setStatus(tr("No current XC25 target - check the relay is running and the pod has a target/GPS fix."));
        qCDebug(TargetFetchLog) << "fetchTarget: no fresh target (liveValid" << _liveValid << "age" << age << "ms)";
        QGC::showAppMessage(_statusText);
        return;
    }

    _targetCoordinate = _liveTarget;
    _targetValid = true;
    emit targetChanged();

    _setStatus(tr("Target plotted: %1, %2")
                   .arg(_targetCoordinate.latitude(), 0, 'f', 6)
                   .arg(_targetCoordinate.longitude(), 0, 'f', 6));
    qCDebug(TargetFetchLog) << "Plotted target" << _targetCoordinate;
}

void TargetFetchManager::clearTarget()
{
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
