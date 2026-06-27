#include "VehicleEngagementStatusFactGroup.h"
#include "Vehicle.h"

VehicleEngagementStatusFactGroup::VehicleEngagementStatusFactGroup(QObject *parent)
    : FactGroup(200, QStringLiteral(":/json/Vehicle/EngagementStatusFact.json"), parent)
{
    _addFact(&_stateFact);
    _addFact(&_timeToImpactFact);
    _addFact(&_rangeFact);
    _addFact(&_closingSpeedFact);
    _addFact(&_validFact);

    // Start "unknown": no estimate, not diving.
    _stateFact.setRawValue(StateInactive);
    _timeToImpactFact.setRawValue(qQNaN());
    _rangeFact.setRawValue(qQNaN());
    _closingSpeedFact.setRawValue(qQNaN());
    _validFact.setRawValue(0);

    // Link-staleness watchdog: each frame restarts it; on timeout we drop
    // telemetryAvailable so the UI shows the countdown as stale rather than live.
    _staleTimer.setSingleShot(true);
    _staleTimer.setInterval(_staleTimeoutMSecs);
    (void) connect(&_staleTimer, &QTimer::timeout, this, &VehicleEngagementStatusFactGroup::_checkStale);
}

void VehicleEngagementStatusFactGroup::handleMessage(Vehicle *vehicle, const mavlink_message_t &message)
{
    Q_UNUSED(vehicle);

    if (message.msgid != MAVLINK_MSG_ID_ENGAGEMENT_STATUS) {
        return;
    }

    mavlink_engagement_status_t engagementStatus{};
    mavlink_msg_engagement_status_decode(&message, &engagementStatus);

    state()->setRawValue(engagementStatus.state);
    timeToImpact()->setRawValue(engagementStatus.time_to_impact);
    range()->setRawValue(engagementStatus.range);
    closingSpeed()->setRawValue(engagementStatus.closing_speed);
    valid()->setRawValue(engagementStatus.valid);

    _setTelemetryAvailable(true);
    _staleTimer.start();
}

void VehicleEngagementStatusFactGroup::_checkStale()
{
    // Stream stopped. Mark telemetry unavailable and invalidate the estimate so the
    // overlay never freezes a stale time-to-impact as if it were live. Keep the last
    // raw numbers (the UI keys off telemetryAvailable / valid, not on clearing them).
    _validFact.setRawValue(0);
    _setTelemetryAvailable(false);
}
