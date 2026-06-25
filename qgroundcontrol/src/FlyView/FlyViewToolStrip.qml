import QtQml.Models

import QGroundControl
import QGroundControl.Controls
import QGroundControl.FlyView

ToolStrip {
    id: _root

    // STRATUM: the fly-view command strip uses accent-filled buttons so AOP /
    // Takeoff / Return / Land present as discrete command buttons.
    accentButtons: true

    signal displayPreFlightChecklist
    signal defineAOP

    FlyViewToolStripActionList {
        id: flyViewToolStripActionList

        onDisplayPreFlightChecklist: _root.displayPreFlightChecklist()
        onDefineAOP:                 _root.defineAOP()
    }

    model: flyViewToolStripActionList.model
}
