import QGroundControl
import QGroundControl.FlyView

// STRATUM: PN Engage. Commands the PX4 custom "PN Engagement" FLIGHT MODE
// (DO_SET_MODE, custom sub_mode 24 -> NAVIGATION_STATE_PN_ENGAGEMENT = 30).
//
// WHY GuidedToolStripAction AND NOT THE PATTERN USED BY Engage / Vision. Those two are
// bare ToolStripActions with an inline onTriggered, so a single tap commits. PN-ENG runs
// proportional navigation plus a closing-speed regulator and publishes an acceleration
// setpoint directly; it is the most consequential action on the strip and is given the
// hold-to-confirm bar so it cannot fire on a stray tap. If Engage and Vision are ever
// migrated to this pattern, this file is the reference.
//
// WHY actionPnEngage AND NOT actionSetFlightMode. actionSetFlightMode assigns
// Vehicle.flightMode directly in GuidedActionsController.executeAction, which would
// bypass EngagementController._ensureArmed() and commit a terminal run with no abort
// destination pushed. actionPnEngage routes through EngagementController.pnEngage().
// The cost of the extra action code is one switch case; the cost of reusing
// actionSetFlightMode is an unarmed abort, and it fails silently.
//
// The target is NOT designated here. PN-ENG reads the latched standoff_setpoint placed
// by Set Standoff (MAV_CMD_DO_STANDOFF, 31010). Designation and commitment are separate
// operator acts, so this button carries no coordinate payload.
GuidedToolStripAction {
    property var _vehicle: QGroundControl.multiVehicleManager.activeVehicle

    text:       qsTr("PN")
    iconSource: "/res/chevron-double-right.svg"
    visible:    true
    enabled:    !!_vehicle
    actionID:   _guidedController.actionPnEngage
    // No actionData: the action code fully determines the mode. Passing a mode-name
    // string here would create a second, unchecked copy of the "PN Engagement"
    // literal that must agree with PX4FirmwarePlugin.cc.
}
