import QGroundControl
import QGroundControl.Controls

// STRATUM: Tracking on/off toggle for the left command strip. Enables/disables the
// already-running companion tracker node (Path A -- operator-facing designation over
// the NEXAM dialect). It does NOT spawn any ROS2 process; it only flips the tracker's
// `enable` flag by packing a full NEXAM_TRACKER_CONFIG (42005) on the Vehicle side.
//
// The C++ backend contract (implemented on Vehicle by Agent B) is:
//   Q_INVOKABLE void setTrackerEnabled(bool on)
// which packs and sends 42005 from current combined tracker state.
//
// The button reflects the current on/off intent via the ToolStripAction `checked`
// state (highlight) and an alternate icon. State is held locally because there is no
// distinct "tracker enabled" telemetry fact -- the "TRACKING Active" ribbon indicator
// (bound to targetTrack.status) is the authoritative live-lock cue.
ToolStripAction {
    property var _vehicle: QGroundControl.multiVehicleManager.activeVehicle

    // Local intent state (on/off). Reset to off whenever the active vehicle changes.
    property bool _trackerEnabled: false

    text:                qsTr("Tracking")
    // Reuse an existing bundled marker asset so no new resource is required.
    iconSource:          "/qmlimages/StandoffMarker.svg"
    alternateIconSource: "/qmlimages/StandoffMarker.svg"
    visible:             true
    enabled:             !!_vehicle
    checkable:           true
    checked:             _trackerEnabled
    showAlternateIcon:   _trackerEnabled

    on_VehicleChanged: _trackerEnabled = false

    onTriggered: {
        if (!_vehicle) {
            return
        }
        _trackerEnabled = !_trackerEnabled
        // Matches Vehicle's Q_INVOKABLE void setTrackerEnabled(bool on) (Agent B).
        _vehicle.setTrackerEnabled(_trackerEnabled)
    }
}
