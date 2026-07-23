import QGroundControl
import QGroundControl.Controls

// STRATUM: one-time "ping" to register this machine with the XC25 pod so it streams
// its status here. Press this once BEFORE connecting the main GCS; it does not hold
// control, so the main GCS's camera feed is undisturbed. Then use "Fetch Target".
ToolStripAction {
    text:       qsTr("Connect Pod")
    iconSource: "/qmlimages/StandoffMarker.svg"
    enabled:    true
    visible:    true

    property color accentColorOverride:     "#3AA76D"
    property color accentTextColorOverride: "#FFFFFF"
}
