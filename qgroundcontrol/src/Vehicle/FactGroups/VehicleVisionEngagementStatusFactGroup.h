#pragma once

#include "FactGroup.h"

#include <QtCore/QTimer>

// STRATUM: live vehicle facts decoded from the custom VISION_ENGAGEMENT_STATUS (42002)
// message streamed by PX4 at ~5 Hz while the vehicle is in Vision Engagement
// (custom_main_mode == 4 && custom_sub_mode == 23). Drives the vision guidance panel
// in the FlyView overlay. This is a SEPARATE mode from coordinate Engagement (42001);
// it carries no target coordinate — the vehicle regulates line-of-sight to whatever a
// companion-computer camera tracker has locked.
//
// Staleness: the FactGroup base only throttles UI updates; it has no link-drop
// timeout. We add one here so that when the 42002 stream stops (link or stream
// drop) the UI can show the readouts as stale/unknown instead of freezing a
// number as if it were live (contract edge case). This mirrors the 42001
// VehicleEngagementStatusFactGroup exactly.
class VehicleVisionEngagementStatusFactGroup : public FactGroup
{
    Q_OBJECT

    Q_PROPERTY(Fact *state         READ state         CONSTANT)
    Q_PROPERTY(Fact *epsAz         READ epsAz         CONSTANT)
    Q_PROPERTY(Fact *epsEl         READ epsEl         CONSTANT)
    Q_PROPERTY(Fact *range         READ range         CONSTANT)
    Q_PROPERTY(Fact *closingSpeed  READ closingSpeed  CONSTANT)
    Q_PROPERTY(Fact *timeToImpact  READ timeToImpact  CONSTANT)
    Q_PROPERTY(Fact *ttiValid      READ ttiValid      CONSTANT)
    Q_PROPERTY(Fact *trackQuality  READ trackQuality  CONSTANT)

public:
    explicit VehicleVisionEngagementStatusFactGroup(QObject *parent = nullptr);

    Fact *state()        { return &_stateFact; }
    Fact *epsAz()        { return &_epsAzFact; }
    Fact *epsEl()        { return &_epsElFact; }
    Fact *range()        { return &_rangeFact; }
    Fact *closingSpeed() { return &_closingSpeedFact; }
    Fact *timeToImpact() { return &_timeToImpactFact; }
    Fact *ttiValid()     { return &_ttiValidFact; }
    Fact *trackQuality() { return &_trackQualityFact; }

    // Guidance state enum, mirroring the message field.
    enum GuidanceState {
        StateSearch   = 0,
        StateTrack    = 1,
        StateCoast    = 2,
        StateTerminal = 3,
        StateAbort    = 4,
    };

    // Overrides from FactGroup
    void handleMessage(Vehicle *vehicle, const mavlink_message_t &message) final;

private slots:
    void _checkStale();

private:
    Fact _stateFact        = Fact(0, QStringLiteral("state"),        FactMetaData::valueTypeUint8);
    Fact _epsAzFact        = Fact(0, QStringLiteral("epsAz"),        FactMetaData::valueTypeFloat);
    Fact _epsElFact        = Fact(0, QStringLiteral("epsEl"),        FactMetaData::valueTypeFloat);
    Fact _rangeFact        = Fact(0, QStringLiteral("range"),        FactMetaData::valueTypeFloat);
    Fact _closingSpeedFact = Fact(0, QStringLiteral("closingSpeed"), FactMetaData::valueTypeFloat);
    Fact _timeToImpactFact = Fact(0, QStringLiteral("timeToImpact"), FactMetaData::valueTypeFloat);
    Fact _ttiValidFact     = Fact(0, QStringLiteral("ttiValid"),     FactMetaData::valueTypeUint8);
    Fact _trackQualityFact = Fact(0, QStringLiteral("trackQuality"), FactMetaData::valueTypeUint8);

    QTimer _staleTimer;

    // ~5 Hz nominal stream => 200 ms cadence. Treat the data as stale after ~4 missed
    // frames so a brief hiccup does not flicker the panel, but a real drop does.
    static constexpr int _staleTimeoutMSecs = 1000;
};
