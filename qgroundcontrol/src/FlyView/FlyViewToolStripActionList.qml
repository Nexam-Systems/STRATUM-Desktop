import QtQml.Models

import QGroundControl
import QGroundControl.Controls
import QGroundControl.Viewer3D

ToolStripActionList {
    id: _root

    signal displayPreFlightChecklist
    signal defineAOP

    model: [
        Viewer3DShowAction { },
        PreFlightCheckListShowAction { onTriggered: displayPreFlightChecklist() },
        FlyViewAOPAction { onTriggered: defineAOP() },
        GuidedActionTakeoff { },
        GuidedActionLand { },
        GuidedActionRTL { },
        GuidedActionPause { },
        FlyViewAdditionalActionsButton { },
        FlyViewGripperButton { }
    ]
}
