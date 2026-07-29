#pragma once

#include "FactGroup.h"

#include <QtCore/QTimer>

// STRATUM: live vehicle facts decoded from the custom PN_ENGAGEMENT_STATUS (42006)
// message streamed by PX4 at ~10 Hz while the vehicle is in PN Engagement
// (custom_main_mode == 4 && custom_sub_mode == 24 -> NAVIGATION_STATE_PN_ENGAGEMENT = 30).
//
// PN-ENG is the THIRD engagement mode and differs from the other two in a way that
// drives this whole class. Coordinate Engagement (42001) and Vision Engagement (42002)
// either guide or fail visibly. PN-ENG can be entered successfully and then decline to
// guide: its relational entry gate (PNE_GATE_LOS / _RMIN / _RMAX / _VMAX) rejects into a
// commanded hover that, from the ground station, is indistinguishable from a hold. So
// `gatePass` and `state == StateGateReject` are not diagnostics here -- they are the
// primary operator-facing readouts, and the reason this FactGroup exists at all.
//
// The second reason is authority. Logs 390 and 391 ended in an allocator departure: the
// collective decayed and the motors clipped at zero. The pair (uMag, uMin) is the margin
// whose collapse produced that. `authorityExceeded` fires when the airframe cannot make
// the floor at all, which is a design verdict rather than a transient.
//
// FLAG UNPACKING. The wire message packs eight booleans into a single uint16 so new flags
// can claim a reserved bit without changing the wire format. They are unpacked here into
// named facts because QML should bind to `pnEngagementStatus.gatePass.value`, not
// re-derive bit arithmetic at every call site. The bit assignment below MUST match
// src/modules/mavlink/streams/PN_ENGAGEMENT_STATUS.hpp in the firmware. Bits are
// append-only.
//
// Staleness: the FactGroup base only throttles UI updates; it has no link-drop timeout.
// One is added here so a stopped stream shows as stale rather than freezing a number as
// if it were live. This mirrors the 42001 / 42002 FactGroups.
class VehiclePnEngagementStatusFactGroup : public FactGroup
{
    Q_OBJECT

    Q_PROPERTY(Fact *state             READ state             CONSTANT)
    Q_PROPERTY(Fact *range             READ range             CONSTANT)
    Q_PROPERTY(Fact *horizRange        READ horizRange        CONSTANT)
    Q_PROPERTY(Fact *closingSpeed      READ closingSpeed      CONSTANT)
    Q_PROPERTY(Fact *losBearing        READ losBearing        CONSTANT)
    Q_PROPERTY(Fact *losElevation      READ losElevation      CONSTANT)
    Q_PROPERTY(Fact *timeToImpact      READ timeToImpact      CONSTANT)
    Q_PROPERTY(Fact *uMag              READ uMag              CONSTANT)
    Q_PROPERTY(Fact *uMin              READ uMin              CONSTANT)
    Q_PROPERTY(Fact *collectivePred    READ collectivePred    CONSTANT)
    Q_PROPERTY(Fact *tilt              READ tilt              CONSTANT)
    Q_PROPERTY(Fact *vHoriz            READ vHoriz            CONSTANT)
    Q_PROPERTY(Fact *vDesEff           READ vDesEff           CONSTANT)
    Q_PROPERTY(Fact *valid             READ valid             CONSTANT)
    Q_PROPERTY(Fact *gatePass          READ gatePass          CONSTANT)
    Q_PROPERTY(Fact *committed         READ committed         CONSTANT)
    Q_PROPERTY(Fact *authorityExceeded READ authorityExceeded CONSTANT)
    Q_PROPERTY(Fact *vrsGuardActive    READ vrsGuardActive    CONSTANT)
    Q_PROPERTY(Fact *clampLat          READ clampLat          CONSTANT)
    Q_PROPERTY(Fact *clampTilt         READ clampTilt         CONSTANT)
    Q_PROPERTY(Fact *clampUmag         READ clampUmag         CONSTANT)

public:
    explicit VehiclePnEngagementStatusFactGroup(QObject *parent = nullptr);

    Fact *state()             { return &_stateFact; }
    Fact *range()             { return &_rangeFact; }
    Fact *horizRange()        { return &_horizRangeFact; }
    Fact *closingSpeed()      { return &_closingSpeedFact; }
    Fact *losBearing()        { return &_losBearingFact; }
    Fact *losElevation()      { return &_losElevationFact; }
    Fact *timeToImpact()      { return &_timeToImpactFact; }
    Fact *uMag()              { return &_uMagFact; }
    Fact *uMin()              { return &_uMinFact; }
    Fact *collectivePred()    { return &_collectivePredFact; }
    Fact *tilt()              { return &_tiltFact; }
    Fact *vHoriz()            { return &_vHorizFact; }
    Fact *vDesEff()           { return &_vDesEffFact; }
    Fact *valid()             { return &_validFact; }
    Fact *gatePass()          { return &_gatePassFact; }
    Fact *committed()         { return &_committedFact; }
    Fact *authorityExceeded() { return &_authorityExceededFact; }
    Fact *vrsGuardActive()    { return &_vrsGuardActiveFact; }
    Fact *clampLat()          { return &_clampLatFact; }
    Fact *clampTilt()         { return &_clampTiltFact; }
    Fact *clampUmag()         { return &_clampUmagFact; }

    // PN-ENG state enum, mirroring the message field. StateGateReject is the one the
    // operator must be able to see: the mode is active but deliberately not guiding.
    enum PnState {
        StateInactive   = 0,
        StateGateReject = 1,
        StateGuiding    = 2,
        StateTerminal   = 3,
        StateRecover    = 4,
    };

    // Bit assignment for the wire `flags` field. Mirrored from
    // PX4-Autopilot/src/modules/mavlink/streams/PN_ENGAGEMENT_STATUS.hpp. Append only.
    enum PnFlag : quint16 {
        FlagValid             = (1u << 0),
        FlagGatePass          = (1u << 1),
        FlagCommitted         = (1u << 2),
        FlagAuthorityExceeded = (1u << 3),
        FlagVrsGuardActive    = (1u << 4),
        FlagClampLat          = (1u << 5),
        FlagClampTilt         = (1u << 6),
        FlagClampUmag         = (1u << 7),
    };

    // Overrides from FactGroup
    void handleMessage(Vehicle *vehicle, const mavlink_message_t &message) final;

private slots:
    void _checkStale();

private:
    Fact _stateFact             = Fact(0, QStringLiteral("state"),             FactMetaData::valueTypeUint8);
    Fact _rangeFact             = Fact(0, QStringLiteral("range"),             FactMetaData::valueTypeFloat);
    Fact _horizRangeFact        = Fact(0, QStringLiteral("horizRange"),        FactMetaData::valueTypeFloat);
    Fact _closingSpeedFact      = Fact(0, QStringLiteral("closingSpeed"),      FactMetaData::valueTypeFloat);
    Fact _losBearingFact        = Fact(0, QStringLiteral("losBearing"),        FactMetaData::valueTypeFloat);
    Fact _losElevationFact      = Fact(0, QStringLiteral("losElevation"),      FactMetaData::valueTypeFloat);
    Fact _timeToImpactFact      = Fact(0, QStringLiteral("timeToImpact"),      FactMetaData::valueTypeFloat);
    Fact _uMagFact              = Fact(0, QStringLiteral("uMag"),              FactMetaData::valueTypeFloat);
    Fact _uMinFact              = Fact(0, QStringLiteral("uMin"),              FactMetaData::valueTypeFloat);
    Fact _collectivePredFact    = Fact(0, QStringLiteral("collectivePred"),    FactMetaData::valueTypeFloat);
    Fact _tiltFact              = Fact(0, QStringLiteral("tilt"),              FactMetaData::valueTypeFloat);
    Fact _vHorizFact            = Fact(0, QStringLiteral("vHoriz"),            FactMetaData::valueTypeFloat);
    Fact _vDesEffFact           = Fact(0, QStringLiteral("vDesEff"),           FactMetaData::valueTypeFloat);
    Fact _validFact             = Fact(0, QStringLiteral("valid"),             FactMetaData::valueTypeUint8);
    Fact _gatePassFact          = Fact(0, QStringLiteral("gatePass"),          FactMetaData::valueTypeUint8);
    Fact _committedFact         = Fact(0, QStringLiteral("committed"),         FactMetaData::valueTypeUint8);
    Fact _authorityExceededFact = Fact(0, QStringLiteral("authorityExceeded"), FactMetaData::valueTypeUint8);
    Fact _vrsGuardActiveFact    = Fact(0, QStringLiteral("vrsGuardActive"),    FactMetaData::valueTypeUint8);
    Fact _clampLatFact          = Fact(0, QStringLiteral("clampLat"),          FactMetaData::valueTypeUint8);
    Fact _clampTiltFact         = Fact(0, QStringLiteral("clampTilt"),         FactMetaData::valueTypeUint8);
    Fact _clampUmagFact         = Fact(0, QStringLiteral("clampUmag"),         FactMetaData::valueTypeUint8);

    QTimer _staleTimer;

    // ~10 Hz nominal stream => 100 ms cadence. Treat the data as stale after ~6 missed
    // frames: long enough that a brief hiccup does not flicker the panel, short enough
    // that a real drop is visible well inside a terminal run.
    static constexpr int _staleTimeoutMSecs = 600;
};
