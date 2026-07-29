#include "VehiclePnEngagementStatusFactGroup.h"
#include "Vehicle.h"

VehiclePnEngagementStatusFactGroup::VehiclePnEngagementStatusFactGroup(QObject *parent)
    : FactGroup(100, QStringLiteral(":/json/Vehicle/PnEngagementStatusFact.json"), parent)
{
    _addFact(&_stateFact);
    _addFact(&_rangeFact);
    _addFact(&_horizRangeFact);
    _addFact(&_closingSpeedFact);
    _addFact(&_losBearingFact);
    _addFact(&_losElevationFact);
    _addFact(&_timeToImpactFact);
    _addFact(&_uMagFact);
    _addFact(&_uMinFact);
    _addFact(&_collectivePredFact);
    _addFact(&_tiltFact);
    _addFact(&_vHorizFact);
    _addFact(&_vDesEffFact);
    _addFact(&_validFact);
    _addFact(&_gatePassFact);
    _addFact(&_committedFact);
    _addFact(&_authorityExceededFact);
    _addFact(&_vrsGuardActiveFact);
    _addFact(&_clampLatFact);
    _addFact(&_clampTiltFact);
    _addFact(&_clampUmagFact);

    // Start "unknown": inactive, no solution, nothing asserted. Note that gatePass
    // initialises to 0, i.e. NOT passed. That direction is deliberate -- an unknown gate
    // must never read as a satisfied gate.
    _stateFact.setRawValue(StateInactive);
    _rangeFact.setRawValue(qQNaN());
    _horizRangeFact.setRawValue(qQNaN());
    _closingSpeedFact.setRawValue(qQNaN());
    _losBearingFact.setRawValue(qQNaN());
    _losElevationFact.setRawValue(qQNaN());
    _timeToImpactFact.setRawValue(qQNaN());
    _uMagFact.setRawValue(qQNaN());
    _uMinFact.setRawValue(qQNaN());
    _collectivePredFact.setRawValue(qQNaN());
    _tiltFact.setRawValue(qQNaN());
    _vHorizFact.setRawValue(qQNaN());
    _vDesEffFact.setRawValue(qQNaN());
    _validFact.setRawValue(0);
    _gatePassFact.setRawValue(0);
    _committedFact.setRawValue(0);
    _authorityExceededFact.setRawValue(0);
    _vrsGuardActiveFact.setRawValue(0);
    _clampLatFact.setRawValue(0);
    _clampTiltFact.setRawValue(0);
    _clampUmagFact.setRawValue(0);

    // Link-staleness watchdog: each frame restarts it; on timeout we drop
    // telemetryAvailable so the UI shows the readouts as stale rather than live.
    _staleTimer.setSingleShot(true);
    _staleTimer.setInterval(_staleTimeoutMSecs);
    (void) connect(&_staleTimer, &QTimer::timeout, this, &VehiclePnEngagementStatusFactGroup::_checkStale);
}

void VehiclePnEngagementStatusFactGroup::handleMessage(Vehicle *vehicle, const mavlink_message_t &message)
{
    Q_UNUSED(vehicle);

    if (message.msgid != MAVLINK_MSG_ID_PN_ENGAGEMENT_STATUS) {
        return;
    }

    mavlink_pn_engagement_status_t pnStatus{};
    mavlink_msg_pn_engagement_status_decode(&message, &pnStatus);

    state()->setRawValue(pnStatus.state);
    range()->setRawValue(pnStatus.range);
    horizRange()->setRawValue(pnStatus.horiz_range);
    closingSpeed()->setRawValue(pnStatus.closing_speed);
    losBearing()->setRawValue(pnStatus.los_bearing);
    losElevation()->setRawValue(pnStatus.los_elevation);
    timeToImpact()->setRawValue(pnStatus.time_to_impact);
    uMag()->setRawValue(pnStatus.u_mag);
    uMin()->setRawValue(pnStatus.u_min);
    collectivePred()->setRawValue(pnStatus.collective_pred);
    tilt()->setRawValue(pnStatus.tilt);
    vHoriz()->setRawValue(pnStatus.v_horiz);
    vDesEff()->setRawValue(pnStatus.v_des_eff);

    // Unpack the bitmask into named facts. Bit assignment mirrors the firmware stream.
    const quint16 flags = pnStatus.flags;
    valid()->setRawValue((flags & FlagValid)             ? 1 : 0);
    gatePass()->setRawValue((flags & FlagGatePass)       ? 1 : 0);
    committed()->setRawValue((flags & FlagCommitted)     ? 1 : 0);
    authorityExceeded()->setRawValue((flags & FlagAuthorityExceeded) ? 1 : 0);
    vrsGuardActive()->setRawValue((flags & FlagVrsGuardActive)       ? 1 : 0);
    clampLat()->setRawValue((flags & FlagClampLat)       ? 1 : 0);
    clampTilt()->setRawValue((flags & FlagClampTilt)     ? 1 : 0);
    clampUmag()->setRawValue((flags & FlagClampUmag)     ? 1 : 0);

    _setTelemetryAvailable(true);
    _staleTimer.start();
}

void VehiclePnEngagementStatusFactGroup::_checkStale()
{
    // Stream stopped. Invalidate the derived assertions rather than the raw numbers: the
    // UI keys off telemetryAvailable and these flags, and a frozen "gate passed" or a
    // frozen time-to-impact on a dead link is worse than no reading at all.
    //
    // gatePass is cleared for the same reason it initialises to 0. On a lost link the
    // ground station does not know whether the gate still holds, and the safe reading of
    // an unknown gate is "not passed".
    _validFact.setRawValue(0);
    _gatePassFact.setRawValue(0);
    _timeToImpactFact.setRawValue(qQNaN());
    _setTelemetryAvailable(false);
}
