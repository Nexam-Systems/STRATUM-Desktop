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

    property var _activeVehicle: QGroundControl.multiVehicleManager.activeVehicle
    property var engagementController    // STRATUM: forwarded to the Engage trigger

    QGCPalette { id: qgcPal }

    // STRATUM: state-accent mapping. SINGLE SOURCE OF TRUTH - kept in lock-step with
    // the identical mapping in FlightMap/MapItems/VehicleMapItem.qml (vehicle icon
    // tint). Engagement -> red, flying -> green, on the ground -> blue, no vehicle ->
    // olive branding. White content on the saturated state colours, dark on olive.
    accentColor:     !_activeVehicle ? qgcPal.brandingPurple :
                         _activeVehicle.flightMode === qsTr("Engagement") ? "#D32F2F" :
                             _activeVehicle.flying ? "#43A047" : "#1E88E5"
    accentTextColor: _activeVehicle ? "#FFFFFF" : "#1A1A1A"

    signal displayPreFlightChecklist
    signal defineAOP

    FlyViewToolStripActionList {
        id: flyViewToolStripActionList

        engagementController:        _root.engagementController
        onDisplayPreFlightChecklist: _root.displayPreFlightChecklist()
        onDefineAOP:                 _root.defineAOP()
    }

    model: flyViewToolStripActionList.model
}
