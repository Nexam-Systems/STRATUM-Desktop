import QGroundControl
import QGroundControl.FlyView

// STRATUM: Abort. Commands the PX4 custom "Abort" FLIGHT MODE (DO_SET_MODE sub=22)
// directly, routed through the hold-to-confirm bar so it cannot fire by accident. This
// mirrors the HOLD-TO-ABORT control on the engagement overlay but keeps Abort reachable
// from the command strip at any time. On completing recovery PX4 auto-switches the
// vehicle to Hold (see EngagementAbortOverlay).
GuidedToolStripAction {
    property var _vehicle: QGroundControl.multiVehicleManager.activeVehicle

    text:       qsTr("Abort")
    iconSource: "/res/Stop.svg"
    visible:    true
    enabled:    !!_vehicle
    actionID:   _guidedController.actionSetFlightMode
    actionData: qsTr("Abort")
}
