import QGroundControl
import QGroundControl.FlyView

// STRATUM: Land. Commands the vehicle's Land FLIGHT MODE directly via its literal
// advertised name (see GuidedActionHold for why we avoid landFlightMode()).
GuidedToolStripAction {
    property var _vehicle: QGroundControl.multiVehicleManager.activeVehicle

    text:       qsTr("Land")
    iconSource: "/res/land.svg"
    visible:    true
    enabled:    !!_vehicle
    actionID:   _guidedController.actionSetFlightMode
    actionData: qsTr("Land")
}
