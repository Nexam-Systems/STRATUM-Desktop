import QtQml.Models

import QGroundControl
import QGroundControl.Controls
import QGroundControl.Viewer3D

ToolStripActionList {
    id: _root

    property var engagementController    // STRATUM: engagement/abort safety-loop controller

    signal displayPreFlightChecklist
    signal defineAOP

    // STRATUM: focused command strip. Every in-scope flight command lives here as a
    // hold-to-confirm button; the toolbar mode dropdown has been retired (the out-of-scope
    // PX4 modes are never used operationally). Hold / Land / Safe Recovery / Abort switch
    // FLIGHT MODES directly (the menu's working path) rather than the legacy guided
    // actions, which did not reliably affect the vehicle. Takeoff keeps its altitude
    // dialog and Engage keeps the abort-arming engagement controller.
    model: [
        FlyViewAOPAction { onTriggered: defineAOP() },
        GuidedActionTakeoff { },
        GuidedActionHold { },
        GuidedActionLand { },
        GuidedActionRTL { },                // Safe Recovery (Return / RTL mode)
        // STRATUM: dedicated trigger for the PX4 custom "Engagement" flight mode.
        // One tap commits the vehicle to the mode (no dialog); the blinking ENGAGING!
        // overlay (FlyView) confirms the active state. Routed through the engagement
        // controller so the abort destination is armed (PARAM_SET) before the dive
        // commits -- an abort issued immediately after engage always has a destination.
        EngageAction {
            onTriggered: {
                if (_root.engagementController) {
                    _root.engagementController.engage()
                } else if (QGroundControl.multiVehicleManager.activeVehicle) {
                    QGroundControl.multiVehicleManager.activeVehicle.flightMode = qsTr("Engagement")
                }
            }
        },
        GuidedActionAbort { }               // PX4 custom "Abort" flight mode (sub=22)
    ]
}
