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
    // True from the moment a standoff is committed until it is cancelled. Drives the
    // on-map surveillance circle (centre = target, radius = standoff distance).
    property bool   _standoffActive:    false

    // Engage (terminal dive) state.
    property bool   _engaging:          false   // armed/diving — drives the ENGAGING! indicator
    property bool   _awaitingDiveEntry: false   // repositioning to the dive-entry point
    property var    _diveEntryPoint:    QtPositioning.coordinate()
    property real   _engageAngleDeg:    45

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

    QGCPopupDialogFactory {
        id:              engageDialogFactory
        dialogComponent: engageDialogComponent
    }
    Component {
        id: engageDialogComponent
        EngageDialog { standoffController: root }
    }

    // Open the Engage parameter dialog (validation lives in the dialog).
    function showEngageDialog() {
        engageDialogFactory.open()
    }

    // Reposition to the distance that yields the chosen dive angle for the current
    // standoff height (D = height / tan(angle)), keeping the standoff bearing, then dive.
    function beginEngage(angleDeg) {
        if (!_activeVehicle || !_standoffActive || _standoffHeight <= 0) {
            return
        }
        _engageAngleDeg = angleDeg
        var requiredDistance = _standoffHeight / Math.tan(angleDeg * Math.PI / 180)
        // Dive-entry point: on the same bearing from the target as the standoff, at the
        // distance that makes the straight line to the target descend at angleDeg.
        _diveEntryPoint = _targetCoordinate.atDistanceAndAzimuth(requiredDistance, _standoffAngle)

        // Phase 1: reposition to the dive-entry point at standoff height, facing target.
        var entryHeadingDeg = _diveEntryPoint.azimuthTo(_targetCoordinate)
        _activeVehicle.guidedModeStandoff(_diveEntryPoint, _standoffAmslAltitude(), entryHeadingDeg)

        _awaitingArrival   = false   // supersede any standoff-arrival wait
        _awaitingDiveEntry = true
        _engaging          = true    // ENGAGING! shown from the moment it is armed
    }

    // Phase 2: terminal dive onto the target at ground level (0 relative altitude).
    function _executeDive() {
        if (!_activeVehicle) {
            return
        }
        var groundAmsl = _activeVehicle.homePosition.altitude   // 0 relative altitude
        var diveHeadingDeg = _activeVehicle.coordinate.azimuthTo(_targetCoordinate)
        _activeVehicle.guidedModeStandoff(_targetCoordinate, groundAmsl, diveHeadingDeg)
        _awaitingDiveEntry = false
        // _engaging stays true through the dive.
    }

    // Clear engagement state (e.g. when a fresh standoff is set up).
    function cancelEngage() {
        _engaging          = false
        _awaitingDiveEntry = false
    }

    // Open the parameter dialog for a freshly clicked target.
    function showStandoffDialog(targetCoordinate) {
        _awaitingArrival  = false
        cancelEngage()                 // a new standoff clears any prior engagement
        _targetCoordinate = targetCoordinate
        standoffDialogFactory.open()
    }

    // Current AMSL altitude for the standoff/orbit (NaN if home altitude unknown).
    function _standoffAmslAltitude() {
        // NOTE: on a QML QGeoCoordinate, isValid is a PROPERTY (no parens); calling it
        // as a function throws and aborts the whole standoff command.
        if (!_activeVehicle || !_activeVehicle.homePosition.isValid || isNaN(_activeVehicle.homePosition.altitude)) {
            return NaN
        }
        return _activeVehicle.homePosition.altitude + _standoffHeight
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

        // STRATUM: APPROACH facing the target (bearing from the vehicle's CURRENT
        // position to the target), not the final standoff direction, so an onboard
        // camera keeps the target in view during transit. The final standoff heading is
        // applied only once the vehicle reaches the point (see the arrival handler).
        var approachHeadingDeg = _activeVehicle.coordinate.azimuthTo(_targetCoordinate)

        // Single combined reposition: position + altitude + approach heading.
        _activeVehicle.guidedModeStandoff(_standoffPoint, _standoffAmslAltitude(), approachHeadingDeg)

        _standoffActive  = true
        _awaitingArrival = true
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
        _awaitingArrival = false
    }

    function cancelStandoff() {
        _awaitingArrival = false
        _standoffActive  = false
    }

    // Arrival detection. Two phases share this: reaching the standoff point (apply final
    // heading) and reaching the dive-entry point (commit the terminal dive). Read the
    // live coordinate directly rather than relying on the notify signal argument.
    Connections {
        target:  _activeVehicle
        enabled: (root._awaitingArrival || root._awaitingDiveEntry) && _activeVehicle

        function onCoordinateChanged() {
            if (!_activeVehicle) {
                return
            }
            if (root._awaitingArrival) {
                if (_activeVehicle.coordinate.distanceTo(root._standoffPoint) <= root._arrivalThresholdMeters) {
                    root._awaitingArrival = false
                    // STRATUM: only now, at the standoff point, rotate to the final heading
                    // (face the target). No orbit prompt — the operator switches to Orbit
                    // from the flight-mode menu if desired; the circle stays visible.
                    root._activeVehicle.guidedModeChangeHeading(root._targetCoordinate)
                }
            } else if (root._awaitingDiveEntry) {
                if (_activeVehicle.coordinate.distanceTo(root._diveEntryPoint) <= root._arrivalThresholdMeters) {
                    // Reached the dive-entry point — commit the terminal dive.
                    root._executeDive()
                }
            }
        }
    }
}
