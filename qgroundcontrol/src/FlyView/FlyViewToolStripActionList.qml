import QtQml.Models

import QGroundControl
import QGroundControl.Controls
import QGroundControl.Viewer3D

ToolStripActionList {
    id: _root

    signal displayPreFlightChecklist
    signal defineAOP

    // STRATUM: focused command strip - AOP, the in-scope flight commands, and the two
    // surfaced guided adjustments (Altitude, Max Speed). The full flight-mode set remains
    // available via the toolbar dropdown for development. The legacy additional-actions
    // panel, gripper, 3D and checklist tool buttons were removed.
    model: [
        FlyViewAOPAction { onTriggered: defineAOP() },
        GuidedActionTakeoff { },
        GuidedActionRTL { },                // Return (RTB)
        GuidedActionHold { },
        GuidedActionLand { },
        GuidedActionChangeAltitude { },
        GuidedActionChangeSpeed { }         // Max Speed
    ]
}
