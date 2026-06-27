import QtQuick
import QtPositioning

import QGroundControl
import QGroundControl.Controls
import QGroundControl.FactControls

// STRATUM: Engagement / Abort safety-loop controller.
//
// Centralises the operator safety loop around a terminal engagement so the Engage
// trigger (tool strip) and the Abort control + countdown (FlyView overlay) share one
// piece of state:
//
//   * arm-on-engage  -- pushes the abort-destination params (ABRT_*) at least once
//                       this session BEFORE entering Engagement, so an abort issued
//                       immediately after engage always resolves to a destination
//                       (Task 7);
//   * engage()       -- commands the PX4 custom Engagement mode (DO_SET_MODE sub=21);
//   * abort()        -- commands the PX4 custom Abort mode (DO_SET_MODE sub=22).
//
// Abort rides existing plumbing only. The mode switch reuses the same setFlightMode
// path already used for Standoff/Engagement; the destination is a standard PARAM_SET
// driven through the parameter manager (FactPanelController), which owns the ack /
// retry / readback. No custom MAVLink dialect is required for abort -- the 42001
// ENGAGEMENT_STATUS countdown is a separate, additive concern wired elsewhere.
Item {
    id: root

    property var _activeVehicle: QGroundControl.multiVehicleManager.activeVehicle

    // Mode display names MUST match the PX4FirmwarePlugin registration strings
    // (PX4FirmwarePlugin.cc constructor + updateAvailableFlightModes re-injection).
    readonly property string engagementModeName: qsTr("Engagement")
    readonly property string abortModeName:      qsTr("Abort")

    // Abort-destination selection, mirroring the PX4 ABRT_* parameters.
    //   abortDest 0 = recover to the last standoff point (no lat/lon needed)
    //   abortDest 1 = recover to an explicit abort station (lat/lon, optional alt)
    property int    abortDest:        0
    property var    abortStation:     QtPositioning.coordinate()
    property real   abortRecoveryAlt: -1            // < 0  => keep current altitude

    // Session arming state. Held against a specific vehicle so a freshly connected
    // airframe is never assumed armed from a previous session.
    property bool   abortArmed:       false
    property var    _armedVehicle:    null

    // Non-fatal status surfaced to the operator (e.g. a missing ABRT_* param). The
    // overlay may bind to this; it never blocks the abort path.
    property string statusText:       ""

    // UI gate: true while the vehicle is in the engagement mode. The countdown panel
    // and the live ABORT control key off this (and, once available, the
    // ENGAGEMENT_STATUS dive state) per the contract.
    readonly property bool engaged:
        !!_activeVehicle && _activeVehicle.flightMode === engagementModeName

    // Parameter access. A bare FactPanelController targets the active vehicle and
    // routes value writes through ParameterManager (confirmed PARAM_SET).
    FactPanelController { id: _params }

    // Any change to the selection invalidates the current arming so the next engage
    // re-pushes the params.
    onAbortDestChanged:        abortArmed = false
    onAbortStationChanged:     abortArmed = false
    onAbortRecoveryAltChanged: abortArmed = false

    // Push one ABRT_* param via the manager. Returns false (and records a status
    // message) if the vehicle does not expose the parameter, so a firmware without
    // the abort params degrades to "abort still switches mode, recovery uses the
    // firmware default" rather than asserting.
    function _pushParam(name, value) {
        if (!_params.parameterExists(-1, name)) {
            statusText = qsTr("Abort parameter %1 not found on vehicle; using firmware default.").arg(name)
            console.warn("EngagementController:", statusText)
            return false
        }
        _params.getParameterFact(-1, name).value = value
        return true
    }

    // Push the current abort-destination selection. Idempotent; safe to call often.
    function armAbort() {
        if (!_activeVehicle) {
            return false
        }
        statusText = ""
        var ok = _pushParam("ABRT_DEST", abortDest)
        if (abortDest === 1 && abortStation.isValid) {
            // Full float precision -- do not pre-round (contract A3 note).
            _pushParam("ABRT_LAT", abortStation.latitude)
            _pushParam("ABRT_LON", abortStation.longitude)
        }
        // Recovery altitude above home; < 0 keeps current altitude (firmware semantics).
        _pushParam("ABRT_ALT", abortRecoveryAlt)
        abortArmed     = true
        _armedVehicle  = _activeVehicle
        return ok
    }

    function _ensureArmed() {
        if (!abortArmed || _armedVehicle !== _activeVehicle) {
            armAbort()
        }
    }

    // Task 7: guarantee an abort destination has been pushed before committing.
    function engage() {
        if (!_activeVehicle) {
            return
        }
        _ensureArmed()
        _activeVehicle.flightMode = engagementModeName
    }

    // Operator-initiated break-off. Deliberately independent of any valid
    // time-to-impact estimate: abort must work even when the countdown is "computing".
    function abort() {
        if (!_activeVehicle) {
            return
        }
        _activeVehicle.flightMode = abortModeName
    }
}
