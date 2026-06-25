import QtQml.Models

import QGroundControl
import QGroundControl.Controls
import QGroundControl.FlyView

ToolStrip {
    id: _root

    // STRATUM: the fly-view command strip uses accent-filled buttons so AOP /
    // Takeoff / Return / Land present as discrete command buttons.
    accentButtons: true

    // STRATUM: a little wider than the default strip so two-word command labels
    // ("Define AOP", "Max Speed") read comfortably.
    width: ScreenTools.defaultFontPixelWidth * 9

    signal displayPreFlightChecklist
    signal defineAOP
    signal engage

    FlyViewToolStripActionList {
        id: flyViewToolStripActionList

        onDisplayPreFlightChecklist: _root.displayPreFlightChecklist()
        onDefineAOP:                 _root.defineAOP()
        onEngage:                    _root.engage()
    }

    model: flyViewToolStripActionList.model
}
