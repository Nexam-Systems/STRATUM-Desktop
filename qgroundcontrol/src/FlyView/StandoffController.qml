import QtQuick
import QtPositioning

import QGroundControl
import QGroundControl.Controls
import QGroundControl.FlyView

// STRATUM: Standoff command controller.
//
// A standoff is a static hold relative to a target: the vehicle flies to a point
// offset from the target by the standoff distance, on the standoff bearing, at the
// standoff height, and faces the target. Geometrically this is one point on an orbit
// of radius = distance, centred on the target, at altitude = height. Once the vehicle
// arrives, the operator may promote the static hold into a live orbit using exactly
// those parameters.
Item {
    id: root

    property var    guidedController
    property var    _activeVehicle:     QGroundControl.multiVehicleManager.activeVehicle
    property var    _unitsConversion:   QGroundControl.unitsConversion

    // Pending / active standoff state (all distances in METERS, angle in DEGREES)
    property var    _targetCoordinate:  QtPositioning.coordinate()
    property var    _standoffPoint:     QtPositioning.coordinate()
    property real   _standoffDistance:  0
    property real   _standoffHeight:    0
    property real   _standoffAngle:     0
    // True from the moment a standoff is committed until it is cancelled. Drives the
    // on-map surveillance circle (centre = target, radius = standoff distance).
    property bool   _standoffActive:    false

    // Emitted whenever a new standoff point is computed; consumers (e.g. the map)
    // may use this to render a target / standoff indicator.
    signal standoffPointChanged(var targetCoordinate, var standoffCoordinate)

    QGCPopupDialogFactory {
        id:              orbitPromptFactory
        dialogComponent: orbitPromptComponent
    }
    Component {
        id: orbitPromptComponent
        StandoffOrbitDialog { standoffController: root }
    }

    // distanceUnits / heightUnits are in the user's configured units; angleDeg is a
    // compass bearing (0 = North, clockwise). targetCoordinate carries the target
    // designated in the Set Standoff panel (manual lat/lon entry or crosshair map
    // pick); the legacy map-click dialog path has been retired.
    function beginStandoff(distanceUnits, heightUnits, angleDeg, targetCoordinate) {
        if (!_activeVehicle) {
            return
        }
        if (targetCoordinate !== undefined && targetCoordinate.isValid) {
            _targetCoordinate = targetCoordinate
        }
        _standoffDistance = _unitsConversion.appSettingsHorizontalDistanceUnitsToMeters(distanceUnits)
        _standoffHeight   = _unitsConversion.appSettingsVerticalDistanceUnitsToMeters(heightUnits)
        _standoffAngle    = angleDeg
        // Client-side offset point is used ONLY to draw the on-map surveillance circle.
        // PX4 recomputes the real hold point from the target + geometry we send below.
        _standoffPoint    = _targetCoordinate.atDistanceAndAzimuth(_standoffDistance, _standoffAngle)
        standoffPointChanged(_targetCoordinate, _standoffPoint)

        // STRATUM: drive the in-firmware PX4 Standoff flight mode. We hand PX4 the TARGET
        // point plus the standoff geometry (distance, bearing, RELATIVE height); PX4 owns
        // the offset math and yaws to face the target itself. Send the geometry BEFORE the
        // mode switch so the standoff_setpoint exists when the mode activates.
        _activeVehicle.guidedModeStandoff(_targetCoordinate, _standoffDistance, _standoffAngle, _standoffHeight)
        _activeVehicle.flightMode = "Standoff"

        _standoffActive = true
    }

    // Promote the static standoff into an orbit using the same geometry.
    function confirmOrbit() {
        if (!_activeVehicle) {
            return
        }
        // Mirrors the stock orbit path (home altitude + relative height). Positive radius
        // => clockwise orbit around the target. The surveillance circle stays visible and
        // now depicts the active orbit area.
        var amslAltitude = _activeVehicle.homePosition.altitude + _standoffHeight
        _activeVehicle.guidedModeOrbit(_targetCoordinate, _standoffDistance, amslAltitude)
    }

    function cancelStandoff() {
        _standoffActive = false
    }

    // STRATUM: no client-side arrival/heading handling. The PX4 Standoff flight mode flies
    // to the hold point and yaws to face the target on its own; an extra DO_REPOSITION or
    // change-heading command would fight the mode.
}
