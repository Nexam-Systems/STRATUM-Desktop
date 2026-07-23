#pragma once

#include <QtCore/QObject>
#include <QtCore/QString>
#include <QtPositioning/QGeoCoordinate>

class QUdpSocket;

/// STRATUM: TargetFetch
///
/// Receives the XC25 electro-optical pod's status stream (the TS-protocol 0x40 /
/// T1 packet, which carries the laser-designated TARGET coordinate). The pod
/// unicasts its status only to the camera-control GCS; a small relay on that
/// machine forwards a copy here over UDP. This class is READ-ONLY - it never
/// transmits to the pod or the vehicle. On demand (fetchTarget()) it publishes
/// the most-recent target coordinate so the Fly view map can plot a marker.
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

    /// Plot the most-recent target coordinate received from the relay (one-shot).
    Q_INVOKABLE void fetchTarget();
    /// Remove the plotted target marker.
    Q_INVOKABLE void clearTarget();

signals:
    void targetChanged();
    void statusTextChanged();

private slots:
    void _readPendingDatagrams();

private:
    void _scan(const QByteArray &datagram);
    void _decodeT1(const quint8 *body);
    void _setStatus(const QString &text);

    QUdpSocket    *_socket = nullptr;

    QGeoCoordinate _targetCoordinate;              // plotted marker (updated on fetch)
    bool           _targetValid = false;

    QGeoCoordinate _liveTarget;                    // latest target seen on the stream
    bool           _liveValid   = false;
    qint64         _liveRxMs    = 0;               // arrival time of the latest live target
    quint64        _datagrams    = 0;              // UDP datagrams received from the relay
    quint64        _statusFrames = 0;              // valid 0x40 status frames decoded

    QString        _statusText;

    static constexpr quint16 kListenPort  = 45400; // must match the relay's forward_port
    static constexpr qint64  kFreshnessMs = 5000;  // a live target older than this is stale
};
