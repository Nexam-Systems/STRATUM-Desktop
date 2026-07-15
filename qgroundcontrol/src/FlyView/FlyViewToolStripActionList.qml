import QtQml.Models
import QtQuick.Controls
import QtQuick.Dialogs

import QGroundControl
import QGroundControl.Controls
import QGroundControl.Viewer3D

ToolStripActionList {
    id: _root

    property var engagementController    // STRATUM: engagement/abort safety-loop controller
    property bool cameraMaximized: false // STRATUM: true when the video is the maximized window
    property var standoffController      // STRATUM: supplies the standoff target for the drop safety check

    signal displayPreFlightChecklist
    signal defineAOP      // retained: emitters relocated to the ribbon (FlyViewToolBar)
    signal setStandoff    // retained: emitters relocated to the ribbon (FlyViewToolBar)

    // STRATUM: Land / Hold command a flight-mode change the same way the flight-mode
    // dropdown does (a direct, reliable write to Vehicle.flightMode by its advertised
    // name), behind a simple confirm dialog. The old slide-to-confirm bar path was
    // fragile in this fork, so these commands no longer depend on it.
    function _commandFlightMode(modeName) {
        if (!QGroundControl.multiVehicleManager.activeVehicle) {
            return
        }
        QGroundControl.showMessageDialog(
            mainWindow,
            modeName,
            qsTr("Switch the vehicle to %1 flight mode?").arg(modeName),
            Dialog.Ok | Dialog.Cancel,
            function() {
                const vehicle = QGroundControl.multiVehicleManager.activeVehicle
                if (vehicle) {
                    vehicle.flightMode = modeName
                }
            })
    }

    // STRATUM: the command strip carries Standoff / Land / Hold / Abort / Engage / Vision
    // Engage. Standoff opens the target-entry panel; Land and Hold switch flight mode
    // directly (confirm dialog); Abort / Engage / Vision Engage drive their PX4 custom
    // modes. Define AOP and Set Standoff live on the top ribbon.
    model: [
        // STRATUM: Standoff opens the Set Standoff target-entry panel, which commits via
        // the web-UI contract (cmd 31010 params + 31011 activate to the bridge). It does
        // NOT switch to a hard-coded PX4 flight mode — the bridge enters "Standoff Mode"
        // itself and QGC picks that mode up dynamically from AVAILABLE_MODES.
        ToolStripAction {
            text:        qsTr("Standoff")
            iconSource:  "/qmlimages/StandoffMarker.svg"
            visible:     true
            enabled:     !!QGroundControl.multiVehicleManager.activeVehicle
            onTriggered: _root.setStandoff()
        },
        ToolStripAction {                   // Land flight mode (direct, confirm dialog)
            text:        qsTr("Land")
            iconSource:  "/res/land.svg"
            visible:     true
            enabled:     !!QGroundControl.multiVehicleManager.activeVehicle
            onTriggered: _root._commandFlightMode(qsTr("Land"))
        },
        ToolStripAction {                   // Hold flight mode (direct, confirm dialog)
            text:        qsTr("Hold")
            iconSource:  "/res/pause-mission.svg"
            visible:     true
            enabled:     !!QGroundControl.multiVehicleManager.activeVehicle
            onTriggered: _root._commandFlightMode(qsTr("Hold"))
        },
        GuidedActionAbort { },              // PX4 custom "Abort" flight mode (sub=22)
        FlyViewDropperAction {
            cameraMaximized:    _root.cameraMaximized
            standoffController: _root.standoffController
        },
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
        }
    ]
}
