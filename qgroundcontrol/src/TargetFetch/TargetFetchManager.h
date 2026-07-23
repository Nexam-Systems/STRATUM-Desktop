#pragma once

#include <QtCore/QObject>
#include <QtCore/QByteArray>
#include <QtCore/QString>
#include <QtNetwork/QHostAddress>
#include <QtPositioning/QGeoCoordinate>

class QUdpSocket;
class QTimer;

/// STRATUM: TargetFetch
///
/// Fetches the XC25 pod's designated TARGET coordinate and plots it on the map.
///
/// It talks to the pod DIRECTLY (no external relay): during a fetch session it
/// streams a minimal AHRS/M heartbeat to the pod (combo = 0, so it does NOT
/// overwrite the attitude/GPS the real controller is feeding) which makes the pod
/// stream its status back to this machine, then it decodes the TS 0x40 / T1 packet
/// for the target. On "Fetch Target" it runs for 30 s, re-fetching every 2 s and
/// replacing the marker each time.
class TargetFetchManager : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QGeoCoordinate targetCoordinate READ targetCoordinate NOTIFY targetChanged)
    Q_PROPERTY(bool           targetValid      READ targetValid      NOTIFY targetChanged)
    Q_PROPERTY(QString        statusText       READ statusText       NOTIFY statusTextChanged)

public:
    explicit TargetFetchManager(QObject *parent = nullptr);
    ~TargetFetchManager() override;

    static TargetFetchManager *instance();

    QGeoCoordinate targetCoordinate() const { return _targetCoordinate; }
    bool           targetValid() const      { return _targetValid; }
    QString        statusText() const       { return _statusText; }

    /// Start a 30 s fetch session (re-fetches every 2 s, replaces the marker).
    Q_INVOKABLE void fetchTarget();
    /// Remove the plotted target marker and stop the session.
    Q_INVOKABLE void clearTarget();

signals:
    void targetChanged();
    void statusTextChanged();

private slots:
    void _readPendingDatagrams();
    void _onFetchTick();
    void _sendHeartbeat();

private:
    void _scan(const QByteArray &datagram);
    void _decodeT1(const quint8 *body);
    void _doFetch();
    void _setStatus(const QString &text);

    QUdpSocket    *_socket          = nullptr;
    QTimer        *_fetchTimer      = nullptr;   // drives the 2 s re-fetch
    QTimer        *_heartbeatTimer  = nullptr;   // pokes the pod so it streams to us
    QByteArray     _heartbeat;                   // pre-built M/AHRS heartbeat (combo=0)
    QHostAddress   _podAddr;

    QGeoCoordinate _targetCoordinate;            // plotted marker (updated on fetch)
    bool           _targetValid  = false;

    QGeoCoordinate _liveTarget;                  // latest target seen on the stream
    bool           _liveValid    = false;
    qint64         _liveRxMs     = 0;
    quint64        _datagrams    = 0;            // datagrams received from the pod
    quint64        _statusFrames = 0;            // valid 0x40 status frames decoded

    int            _fetchTicks   = 0;
    bool           _sessionFailShown = false;
};
