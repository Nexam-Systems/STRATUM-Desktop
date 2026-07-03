import QGroundControl
import QGroundControl.Controls

// STRATUM: Vision Engage command. Commands the vehicle directly into the PX4 custom
// "Vision Engagement" flight mode (AUTO main / sub_mode 23), a camera-guided terminal
// run that takes its target from the companion camera tracker -- NO map coordinate is
// sent. This is a SEPARATE mode from coordinate Engage (sub_mode 21); the operator
// chooses it explicitly. The onTriggered handler is supplied where this action is added
// to the strip model (FlyViewToolStripActionList) so it can reach the engagement
// controller (arm-on-engage) or the active vehicle. Enabled only when a vehicle is
// connected.
ToolStripAction {
    id: root

    property var _activeVehicle: QGroundControl.multiVehicleManager.activeVehicle

    text:       qsTr("Vision")
    iconSource: "/res/chevron-double-right.svg"
    enabled:    !!_activeVehicle
    visible:    true
}
