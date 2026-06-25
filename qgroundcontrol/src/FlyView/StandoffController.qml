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
    property bool   _awaitingArrival:   false

    // Arrival tolerance scales gently with distance, floored for short standoffs.
    readonly property real _arrivalThresholdMeters: Math.max(5, _standoffDistance * 0.08)

    // Emitted whenever a new standoff point is computed; consumers (e.g. the map)
    // may use this to render a target / standoff indicator.
    signal standoffPointChanged(var targetCoordinate, var standoffCoordinate)

    QGCPopupDialogFactory {
        id:              standoffDialogFactory
        dialogComponent: standoffDialogComponent
    }
    Component {
        id: standoffDialogComponent
        StandoffDialog { standoffController: root }
    }

    QGCPopupDialogFactory {
        id:              orbitPromptFactory
        dialogComponent: orbitPromptComponent
    }
    Component {
        id: orbitPromptComponent
        StandoffOrbitDialog { standoffController: root }
    }

    // Open the parameter dialog for a freshly clicked target.
    function showStandoffDialog(targetCoordinate) {
        _awaitingArrival  = false
        _targetCoordinate = targetCoordinate
        standoffDialogFactory.open()
    }

    // distanceUnits / heightUnits are in the user's configured units; angleDeg is a
    // compass bearing (0 = North, clockwise).
    function beginStandoff(distanceUnits, heightUnits, angleDeg) {
        if (!_activeVehicle) {
            return
        }
        _standoffDistance = _unitsConversion.appSettingsHorizontalDistanceUnitsToMeters(distanceUnits)
        _standoffHeight   = _unitsConversion.appSettingsVerticalDistanceUnitsToMeters(heightUnits)
        _standoffAngle    = angleDeg
        _standoffPoint    = _targetCoordinate.atDistanceAndAzimuth(_standoffDistance, _standoffAngle)
        standoffPointChanged(_targetCoordinate, _standoffPoint)

        // Fly to the standoff point, command the standoff altitude, and face the target.
        _activeVehicle.guidedModeGotoLocation(_standoffPoint)
        var altitudeChange = _standoffHeight - _activeVehicle.altitudeRelative.rawValue
        _activeVehicle.guidedModeChangeAltitude(altitudeChange, false /* pauseVehicle */)
        _activeVehicle.guidedModeChangeHeading(_targetCoordinate)

        _awaitingArrival = true
    }

    // Promote the static standoff into an orbit using the same geometry.
    function confirmOrbit() {
        if (!_activeVehicle) {
            return
        }
        var amslAltitude = _activeVehicle.homePosition.altitude + _standoffHeight
        // Positive radius => clockwise orbit around the standoff target.
        _activeVehicle.guidedModeOrbit(_targetCoordinate, _standoffDistance, amslAltitude)
        _awaitingArrival = false
    }

    function cancelStandoff() {
        _awaitingArrival = false
    }

    // Arrival detection: when the vehicle gets within tolerance of the standoff point,
    // offer to convert the hold into an orbit. Read the live coordinate directly rather
    // than relying on the notify signal argument.
    Connections {
        target:  _activeVehicle
        enabled: root._awaitingArrival && _activeVehicle

        function onCoordinateChanged() {
            if (!root._awaitingArrival || !_activeVehicle) {
                return
            }
            var horizontalDistance = _activeVehicle.coordinate.distanceTo(root._standoffPoint)
            if (horizontalDistance <= root._arrivalThresholdMeters) {
                root._awaitingArrival = false
                orbitPromptFactory.open()
            }
        }
    }
}
