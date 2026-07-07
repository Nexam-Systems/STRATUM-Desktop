import QtQuick
import QtPositioning

import QGroundControl
import QGroundControl.Controls
import QGroundControl.FlyView

// STRATUM: Standoff command controller.
//
// A standoff is an orbit around a target: the vehicle circles the target at a fixed
// distance and height. The command contract mirrors the UAV-VAS web UI EXACTLY — two
// COMMAND_LONG messages addressed to the bridge companion computer (component 191, the
// same component the servo/dropper commands target):
//
//   31010 (params):   p1 = target latitude   [deg]
//                     p2 = target longitude  [deg]
//                     p3 = distance          [m]
//                     p4 = height AGL        [m]
//                     p5 = speed             [km/h]
//                     p6 = direction         (0 = N, 1 = E, 2 = S, 3 = W)
//   31011 (activate): p1 = 1  -> begin orbit   (p1 = 0 -> abort)
//
// The bridge owns the orbit math and flight-mode handling; QGC's PX4 Standoff
// flight-mode path is intentionally NOT used here so the wire contract stays identical
// to the web UI the drone was validated against.
Item {
    id: root

    property var    guidedController
    property var    _activeVehicle:     QGroundControl.multiVehicleManager.activeVehicle

    // Committed standoff state. _standoffDistance drives the on-map surveillance circle.
    property var    _targetCoordinate:  QtPositioning.coordinate()
    property real   _standoffDistance:  0    // orbit distance / radius [m]
    property real   _standoffHeight:    0    // height AGL [m]
    property real   _standoffSpeed:     0    // [km/h]
    property int    _standoffDirection: 0    // 0 = N, 1 = E, 2 = S, 3 = W
    // True from the moment a standoff is committed until it is cancelled. Drives the
    // on-map surveillance circle (centre = target, radius = standoff distance).
    property bool   _standoffActive:    false

    // STRATUM: bridge companion computer + standoff command ids (web UI contract).
    readonly property int _bridgeComponentId:   191
    readonly property int _cmdStandoffParams:   31010
    readonly property int _cmdStandoffActivate: 31011

    // distanceMeters / heightMeters are in METERS, speed in KM/H, direction is a
    // cardinal index (0=N,1=E,2=S,3=W). targetCoordinate carries the target designated
    // in the Set Standoff panel (manual lat/lon entry or crosshair map pick).
    function beginStandoff(distanceMeters, heightMeters, speed, direction, targetCoordinate) {
        if (!_activeVehicle) {
            return
        }
        if (targetCoordinate !== undefined && targetCoordinate.isValid) {
            _targetCoordinate = targetCoordinate
        }
        if (!_targetCoordinate.isValid) {
            return
        }
        _standoffDistance  = distanceMeters
        _standoffHeight    = heightMeters
        _standoffSpeed     = speed
        _standoffDirection = direction

        // Step 1: send orbit parameters (31010). Step 2: activate (31011). QGC queues
        // the two commands and sends the activate after the params are acknowledged,
        // matching the web UI's SEND PARAMS -> EXECUTE sequence in a single action.
        _activeVehicle.sendCommand(_bridgeComponentId, _cmdStandoffParams, true,
                                   _targetCoordinate.latitude,
                                   _targetCoordinate.longitude,
                                   distanceMeters,
                                   heightMeters,
                                   speed,
                                   direction,
                                   0)
        _activeVehicle.sendCommand(_bridgeComponentId, _cmdStandoffActivate, true,
                                   1, 0, 0, 0, 0, 0, 0)

        _standoffActive = true
    }

    // Abort the standoff/orbit on the bridge (31011 activate=0), matching the web UI
    // ABORT / standoff-cancel path, and hide the surveillance circle.
    function cancelStandoff() {
        if (_activeVehicle) {
            _activeVehicle.sendCommand(_bridgeComponentId, _cmdStandoffActivate, true,
                                       0, 0, 0, 0, 0, 0, 0)
        }
        _standoffActive = false
    }
}
