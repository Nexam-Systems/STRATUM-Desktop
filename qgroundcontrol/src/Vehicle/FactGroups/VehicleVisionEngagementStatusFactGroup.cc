#include "VehicleVisionEngagementStatusFactGroup.h"
#include "Vehicle.h"

VehicleVisionEngagementStatusFactGroup::VehicleVisionEngagementStatusFactGroup(QObject *parent)
    : FactGroup(200, QStringLiteral(":/json/Vehicle/VisionEngagementStatusFact.json"), parent)
{
    _addFact(&_stateFact);
    _addFact(&_epsAzFact);
    _addFact(&_epsElFact);
    _addFact(&_rangeFact);
    _addFact(&_closingSpeedFact);
    _addFact(&_timeToImpactFact);
    _addFact(&_ttiValidFact);
    _addFact(&_trackQualityFact);

    // Start "unknown": searching, no estimate, no lock.
    _stateFact.setRawValue(StateSearch);
    _epsAzFact.setRawValue(qQNaN());
    _epsElFact.setRawValue(qQNaN());
    _rangeFact.setRawValue(qQNaN());
    _closingSpeedFact.setRawValue(qQNaN());
    _timeToImpactFact.setRawValue(qQNaN());
    _ttiValidFact.setRawValue(0);
    _trackQualityFact.setRawValue(0);

    // Link-staleness watchdog: each frame restarts it; on timeout we drop
    // telemetryAvailable so the UI shows the readouts as stale rather than live.
    _staleTimer.setSingleShot(true);
    _staleTimer.setInterval(_staleTimeoutMSecs);
    (void) connect(&_staleTimer, &QTimer::timeout, this, &VehicleVisionEngagementStatusFactGroup::_checkStale);
}

void VehicleVisionEngagementStatusFactGroup::handleMessage(Vehicle *vehicle, const mavlink_message_t &message)
{
    Q_UNUSED(vehicle);

    if (message.msgid != MAVLINK_MSG_ID_VISION_ENGAGEMENT_STATUS) {
        return;
    }

    mavlink_vision_engagement_status_t visionStatus{};
    mavlink_msg_vision_engagement_status_decode(&message, &visionStatus);

    state()->setRawValue(visionStatus.state);
    epsAz()->setRawValue(visionStatus.eps_az);
    epsEl()->setRawValue(visionStatus.eps_el);
    range()->setRawValue(visionStatus.range);
    closingSpeed()->setRawValue(visionStatus.closing_speed);
    timeToImpact()->setRawValue(visionStatus.time_to_impact);
    ttiValid()->setRawValue(visionStatus.tti_valid);
    trackQuality()->setRawValue(visionStatus.track_quality);

    _setTelemetryAvailable(true);
    _staleTimer.start();
}

void VehicleVisionEngagementStatusFactGroup::_checkStale()
{
    // Stream stopped. Mark telemetry unavailable and invalidate the estimate so the
    // panel never freezes a stale time-to-impact as if it were live. Keep the last raw
    // numbers (the UI keys off telemetryAvailable / ttiValid, not on clearing them).
    _ttiValidFact.setRawValue(0);
    _setTelemetryAvailable(false);
}
