import QtQml.Models

import QGroundControl
import QGroundControl.Controls
import QGroundControl.Viewer3D

ToolStripActionList {
    id: _root

    property var engagementController    // STRATUM: engagement/abort safety-loop controller

    signal displayPreFlightChecklist
    signal defineAOP      // retained: emitters relocated to the ribbon (FlyViewToolBar)
    signal setStandoff    // retained: emitters relocated to the ribbon (FlyViewToolBar)

    // STRATUM: the command strip carries the flight-mode commands pulled from the mode
    // menu -- Standoff / Land / Hold / Abort / Engagement / Vision Engagement -- each a
    // hold-to-confirm button that switches FLIGHT MODE directly (the mode menu's working
    // path). Define AOP and Set Standoff were relocated to the centre of the top ribbon.
    //
    // STRATUM: Takeoff is restored here as a guided ACTION (not a flight-mode select):
    // it opens the altitude dialog and issues MAV_CMD_NAV_TAKEOFF via guidedModeTakeoff()
    // (see GuidedActionTakeoff.qml -> showTakeoffDialog(), executed in
    // GuidedActionsController.executeAction). It is grouped with Land, matching QGC's
    // takeoff/land grouping convention. A Tracking on/off toggle is appended at the end.
    model: [
        GuidedActionTakeoff { },            // STRATUM: MAV_CMD_NAV_TAKEOFF guided action (altitude dialog)
        GuidedActionStandoffMode { },       // Standoff flight mode (hold-to-confirm)
        GuidedActionLand { },               // Land flight mode
        GuidedActionHold { },               // Hold flight mode
        GuidedActionAbort { },              // PX4 custom "Abort" flight mode (sub=22)
        // STRATUM: PX4 custom "Engagement" flight mode (sub=21). Routed through the
        // engagement controller so the abort destination is armed (PARAM_SET) before commit.
        EngageAction {
            onTriggered: {
                if (_root.engagementController) {
                    _root.engagementController.engage()
                } else if (QGroundControl.multiVehicleManager.activeVehicle) {
                    QGroundControl.multiVehicleManager.activeVehicle.flightMode = qsTr("Engagement")
                }
            }
        },
        // STRATUM: PX4 custom "Vision Engagement" flight mode (sub=23) -- camera-guided,
        // no map target. Reuses the SAME engagement controller (arm-on-engage).
        VisionEngageAction {
            onTriggered: {
                if (_root.engagementController) {
                    _root.engagementController.visionEngage()
                } else if (QGroundControl.multiVehicleManager.activeVehicle) {
                    QGroundControl.multiVehicleManager.activeVehicle.flightMode = qsTr("Vision Engagement")
                }
            }
        },
        // STRATUM: Tracking on/off toggle -- enables/disables the already-running
        // companion tracker via Vehicle.setTrackerEnabled(bool) (NEXAM_TRACKER_CONFIG 42005).
        TrackingToggleAction { },
        // STRATUM: Fetch the XC25 pod's designated target (relayed from the camera GCS)
        // and plot it on the map. One-shot: each press plots the latest coordinate.
        FetchTargetAction {
            onTriggered: QGroundControl.targetFetch.fetchTarget()
        }
    ]
}
