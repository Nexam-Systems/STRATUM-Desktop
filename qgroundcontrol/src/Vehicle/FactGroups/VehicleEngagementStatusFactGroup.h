#pragma once

#include "FactGroup.h"

#include <QtCore/QTimer>

// STRATUM: live vehicle facts decoded from the custom ENGAGEMENT_STATUS (42001)
// message streamed by PX4 at ~5 Hz during a terminal engagement. Drives the
// abort countdown in the FlyView overlay.
//
// Staleness: the FactGroup base only throttles UI updates; it has no link-drop
// timeout. We add one here so that when the 42001 stream stops (link or stream
// drop) the UI can show the countdown as stale/unknown instead of freezing a
// number as if it were live (contract edge case).
class VehicleEngagementStatusFactGroup : public FactGroup
{
    Q_OBJECT

    Q_PROPERTY(Fact *state         READ state         CONSTANT)
    Q_PROPERTY(Fact *timeToImpact  READ timeToImpact  CONSTANT)
    Q_PROPERTY(Fact *range         READ range         CONSTANT)
    Q_PROPERTY(Fact *closingSpeed  READ closingSpeed  CONSTANT)
    Q_PROPERTY(Fact *valid         READ valid         CONSTANT)

public:
    explicit VehicleEngagementStatusFactGroup(QObject *parent = nullptr);

    Fact *state()        { return &_stateFact; }
    Fact *timeToImpact() { return &_timeToImpactFact; }
    Fact *range()        { return &_rangeFact; }
    Fact *closingSpeed() { return &_closingSpeedFact; }
    Fact *valid()        { return &_validFact; }

    // Engagement state enum, mirroring the message field.
    enum EngagementState {
        StateInactive = 0,
        StateDive     = 1,
        StateRecover  = 2,
    };

    // Overrides from FactGroup
    void handleMessage(Vehicle *vehicle, const mavlink_message_t &message) final;

private slots:
    void _checkStale();

private:
    Fact _stateFact        = Fact(0, QStringLiteral("state"),        FactMetaData::valueTypeUint8);
    Fact _timeToImpactFact = Fact(0, QStringLiteral("timeToImpact"), FactMetaData::valueTypeFloat);
    Fact _rangeFact        = Fact(0, QStringLiteral("range"),        FactMetaData::valueTypeFloat);
    Fact _closingSpeedFact = Fact(0, QStringLiteral("closingSpeed"), FactMetaData::valueTypeFloat);
    Fact _validFact        = Fact(0, QStringLiteral("valid"),        FactMetaData::valueTypeUint8);

    QTimer _staleTimer;

    // ~5 Hz nominal stream => 200 ms cadence. Treat the data as stale after ~4 missed
    // frames so a brief hiccup does not flicker the countdown, but a real drop does.
    static constexpr int _staleTimeoutMSecs = 1000;
};
