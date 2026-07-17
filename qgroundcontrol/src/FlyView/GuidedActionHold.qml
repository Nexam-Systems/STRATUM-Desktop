import QGroundControl
import QGroundControl.FlyView

// STRATUM: Hold. Commands the vehicle's Hold FLIGHT MODE directly (the same path the
// toolbar mode menu used), routed through the hold-to-confirm bar.
//
// NOTE: we use the LITERAL advertised mode name, NOT vehicle.pauseFlightMode(). Under PX4's
// dynamic AVAILABLE_MODES (StandardModes) protocol the legacy enum getters resolve against
// PX4CustomMode keys that the vehicle no longer advertises, so they return empty/!= the
// real name and setFlightMode() silently no-ops. The advertised name (what the menu shows)
// is matched case-insensitively by PX4FirmwarePlugin::setFlightMode.
GuidedToolStripAction {
    property var _vehicle: QGroundControl.multiVehicleManager.activeVehicle

    text:       qsTr("Hold")
    iconSource: "/res/pause-mission.svg"
    visible:    true
    enabled:    !!_vehicle
    actionID:   _guidedController.actionSetFlightMode
    actionData: qsTr("Hold")
}
