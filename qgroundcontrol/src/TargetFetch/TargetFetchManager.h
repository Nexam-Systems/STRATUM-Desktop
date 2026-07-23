#pragma once

#include <QtCore/QByteArray>
#include <QtCore/QObject>
#include <QtCore/QString>
#include <QtNetwork/QHostAddress>
#include <QtPositioning/QGeoCoordinate>

class QUdpSocket;
class QTimer;

/// STRATUM: TargetFetch
///
/// Plots the XC25 pod's designated TARGET on the map.
///
/// The pod is a SINGLE-CLIENT streamer: whoever holds a continuous heartbeat owns
/// control. But a short one-time "ping" from a machine registers that machine as a
/// status recipient - the pod then keeps streaming its status there for a long time,
/// even while a different GCS controls the camera. So:
///
///   * pingPod()   - sends a brief M heartbeat burst to the pod (like running
///                   CameraControl for a moment), registering THIS machine, then
///                   stops. It never holds control, so the main GCS is undisturbed.
///                   Do this once, before connecting the main GCS.
///   * fetchTarget() - strictly passive: reads the pod status now streaming here and
///                   decodes the TS 0x40 / T1 target. Runs 30 s, re-reading every 2 s
///                   and replacing the marker.
class TargetFetchManager : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QGeoCoordinate targetCoordinate READ targetCoordinate NOTIFY targetChanged)
    Q_PROPERTY(bool           targetValid      READ targetValid      NOTIFY targetChanged)
    Q_PROPERTY(bool           linked           READ linked           NOTIFY linkedChanged)
    Q_PROPERTY(QString        statusText       READ statusText       NOTIFY statusTextChanged)

public:
    explicit TargetFetchManager(QObject *parent = nullptr);
    ~TargetFetchManager() override;

    static TargetFetchManager *instance();

    QGeoCoordinate targetCoordinate() const { return _targetCoordinate; }
    bool           targetValid() const      { return _targetValid; }
    bool           linked() const           { return _datagrams > 0; }
    QString        statusText() const       { return _statusText; }

    /// One-time ping: register this machine with the pod (do before connecting the GCS).
    Q_INVOKABLE void pingPod();
    /// Start a 30 s fetch session (passive; re-reads every 2 s, replaces the marker).
    Q_INVOKABLE void fetchTarget();
    /// Remove the plotted target marker and stop the fetch session.
    Q_INVOKABLE void clearTarget();

signals:
    void targetChanged();
    void linkedChanged();
    void statusTextChanged();

private slots:
    void _readPendingDatagrams();
    void _onFetchTick();
    void _sendPing();

private:
    void _scan(const QByteArray &datagram);
    void _decodeT1(const quint8 *body);
    void _doFetch();
    void _setStatus(const QString &text);

    QUdpSocket    *_socket     = nullptr;
    QTimer        *_fetchTimer = nullptr;        // drives the 2 s re-read
    QTimer        *_pingTimer  = nullptr;        // drives the one-time registration ping
    QByteArray     _pingFrame;                   // pre-built M heartbeat
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
    int            _pingTicks    = 0;
    bool           _pinging      = false;
};
