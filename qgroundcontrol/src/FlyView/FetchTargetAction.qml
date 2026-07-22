import QGroundControl
import QGroundControl.Controls

// STRATUM: Tool-strip command that fetches the XC25 pod's designated TARGET
// coordinate (relayed from the camera-control GCS) and plots it on the map as a
// one-shot marker. Read-only - it does not command the vehicle. Blue accent to
// distinguish it from the crimson "Set Standoff" command.
ToolStripAction {
    text:       qsTr("Fetch Target")
    iconSource: "/qmlimages/StandoffMarker.svg"
    enabled:    true
    visible:    true

    property color accentColorOverride:     "#1E88E5"
    property color accentTextColorOverride: "#FFFFFF"
}
