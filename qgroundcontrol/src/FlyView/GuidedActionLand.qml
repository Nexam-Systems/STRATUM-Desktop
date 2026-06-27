import QGroundControl
import QGroundControl.FlyView

// STRATUM: Land. Commands the vehicle's Land FLIGHT MODE directly (the same path the
// toolbar mode menu used), routed through the hold-to-confirm bar.
GuidedToolStripAction {
    property var _vehicle: QGroundControl.multiVehicleManager.activeVehicle

    text:       qsTr("Land")
    iconSource: "/res/land.svg"
    visible:    true
    enabled:    !!_vehicle
    actionID:   _guidedController.actionSetFlightMode
    actionData: _vehicle ? _vehicle.landFlightMode : qsTr("Land")
}
