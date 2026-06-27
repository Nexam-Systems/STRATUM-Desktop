import QGroundControl
import QGroundControl.FlyView

// STRATUM: Safe Recovery. Operator-facing label for the vehicle's Return (RTL) FLIGHT
// MODE; commands it directly (the same path the toolbar mode menu used), routed through
// the hold-to-confirm bar.
GuidedToolStripAction {
    property var _vehicle: QGroundControl.multiVehicleManager.activeVehicle

    text:       qsTr("Safe Recovery")
    iconSource: "/res/rtl.svg"
    visible:    true
    enabled:    !!_vehicle
    actionID:   _guidedController.actionSetFlightMode
    actionData: _vehicle ? _vehicle.rtlFlightMode : qsTr("Return")
}
