import QGroundControl
import QGroundControl.Controls

// STRATUM: Engage (terminal dive) command. The onTriggered handler is supplied where
// this action is added to the strip model (FlyViewToolStripActionList) so it can reach
// the standoff/engage controller.
ToolStripAction {
    text:       qsTr("Engage")
    iconSource: "/res/chevron-double-right.svg"
    enabled:    true
    visible:    true
}
