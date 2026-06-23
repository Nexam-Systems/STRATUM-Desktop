import QGroundControl
import QGroundControl.Controls

// STRATUM: Tool-strip action that enters in-view Area-Of-Operations (AOP) edit
// mode. The AOP is the section's operating boundary and is committed to the
// vehicle as an inclusion geofence. This is not a guided action; it toggles an
// editing state on the Fly map via the FlyViewToolStripActionList.defineAOP signal.
ToolStripAction {
    id: root

    property var _activeVehicle: QGroundControl.multiVehicleManager.activeVehicle

    text:       qsTr("Define AOP")
    iconSource: "/qmlimages/Plan.svg"
    // Editing the boundary while disarmed is the intended workflow, but we do
    // not hard-block it in-flight; the geofence upload is rejected by the
    // vehicle if unsupported. The on-map Apply/Cancel bar indicates edit mode.
    enabled:    _activeVehicle !== null
    visible:    true
}
