import QtQml.Models

import QGroundControl
import QGroundControl.Controls
import QGroundControl.FlyView

ToolStrip {
    id: _root

    signal displayPreFlightChecklist
    signal defineAOP

    FlyViewToolStripActionList {
        id: flyViewToolStripActionList

        onDisplayPreFlightChecklist: _root.displayPreFlightChecklist()
        onDefineAOP:                 _root.defineAOP()
    }

    model: flyViewToolStripActionList.model
}
