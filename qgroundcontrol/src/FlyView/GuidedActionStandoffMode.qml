import QGroundControl
import QGroundControl.FlyView

// STRATUM: Standoff flight mode command, pulled from the flight-mode menu into the
// command strip. Commands the vehicle's "Standoff" FLIGHT MODE directly by its literal
// advertised name through the hold-to-confirm bar, mirroring GuidedActionHold/Land.
// (Distinct from the ribbon's "Set Standoff" button, which opens the target-entry panel.)
GuidedToolStripAction {
    property var _vehicle: QGroundControl.multiVehicleManager.activeVehicle

    text:       qsTr("Standoff")
    iconSource: "/qmlimages/StandoffMarker.svg"
    visible:    true
    enabled:    !!_vehicle
    actionID:   _guidedController.actionSetFlightMode
    actionData: qsTr("Standoff")
}
