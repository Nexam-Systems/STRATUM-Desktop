import QGroundControl
import QGroundControl.FlyView

// STRATUM: Hold. Commands the vehicle's Hold/loiter FLIGHT MODE directly (the same
// path the toolbar mode menu used), routed through the hold-to-confirm bar. The legacy
// guided "Pause" action did not reliably affect the vehicle, so the in-scope flight
// commands now switch modes outright.
GuidedToolStripAction {
    property var _vehicle: QGroundControl.multiVehicleManager.activeVehicle

    text:       qsTr("Hold")
    iconSource: "/res/pause-mission.svg"
    visible:    true
    enabled:    !!_vehicle
    actionID:   _guidedController.actionSetFlightMode
    actionData: _vehicle ? _vehicle.pauseFlightMode : qsTr("Hold")
}
