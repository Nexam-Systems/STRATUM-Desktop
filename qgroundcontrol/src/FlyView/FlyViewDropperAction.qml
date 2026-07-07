import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

import QGroundControl
import QGroundControl.Controls

// STRATUM Dropper tool-strip action. Mirrors the payload-drop and payload-load
// behaviour of the UAV-VAS web UI exactly:
//   * DROP  — select a single payload (PLD 1-4) or BURST, then commit with DROP.
//   * LOAD  — open all gates, then close/load payloads sequentially (1 -> 4).
//   * CAMERA — gimbal / feed controls (see FlyViewCameraControls).
// Servo commands use MAV_CMD 31012 on the bridge companion component (191), the
// same contract the web UI drives through /api/command (servo-drop / servo-burst
// / servo-load).
ToolStripAction {
    id: action

    text: qsTr("Dropper")
    iconSource: "qrc:/res/DropArrow.svg"
    enabled: !!QGroundControl.multiVehicleManager.activeVehicle
    visible: true

    // STRATUM: driven down from FlyView -> WidgetLayer -> ToolStrip so the panel
    // knows whether the camera is the maximized window (controls move to the video
    // overlay) or the map is maximized (controls stay inside this dropper panel).
    property bool cameraMaximized: false

    property var _activeVehicle: QGroundControl.multiVehicleManager.activeVehicle
    property string _dropperSection: "drop"
    property var _dropperState: ({ selectedMode: null, selectedPayloadIdx: null, dropped: [false, false, false, false], loaded: [false, false, false, false] })
    property string _dropperStatusText: qsTr("Dropper ready")

    // STRATUM: minimum distance from the takeoff/home point before a payload may be
    // dropped, matching the web UI safety check (drop is blocked within 100 m of takeoff).
    readonly property real _minDropDistanceM: 100

    // Returns { ok, reason }. Blocks the drop unless we can confirm the UAV is at least
    // _minDropDistanceM from the takeoff (home) point — same gate as the web UI.
    function _dropSafetyCheck() {
        if (!_activeVehicle) {
            return ({ ok: false, reason: qsTr("No vehicle connected.") })
        }
        const here = _activeVehicle.coordinate
        const home = _activeVehicle.homePosition
        if (!here.isValid) {
            return ({ ok: false, reason: qsTr("No UAV position — cannot verify distance from takeoff.") })
        }
        if (!home.isValid) {
            return ({ ok: false, reason: qsTr("No takeoff point yet — arm/takeoff first to set it.") })
        }
        const dist = here.distanceTo(home)
        if (dist < _minDropDistanceM) {
            return ({ ok: false, reason: qsTr("UAV is %1 m from takeoff — must be ≥ %2 m away to drop.").arg(Math.round(dist)).arg(_minDropDistanceM) })
        }
        return ({ ok: true, reason: "" })
    }

    function _showDropperSection(section) {
        _dropperSection = section
    }

    function _setStatus(text) {
        _dropperStatusText = text
    }

    // ---- DROP: select-then-commit (matches web UI selectDrop / onDropClick) ----
    function _selectDrop(mode, index) {
        if (mode === "burst") {
            _dropperState.selectedMode = "burst"
            _dropperState.selectedPayloadIdx = null
        } else if (_dropperState.selectedMode === "single" && _dropperState.selectedPayloadIdx === index) {
            // Toggle off if the same payload is tapped again.
            _dropperState.selectedMode = null
            _dropperState.selectedPayloadIdx = null
        } else {
            _dropperState.selectedMode = "single"
            _dropperState.selectedPayloadIdx = index
        }
        // Reassign so the change is observable by QML bindings.
        _dropperState = Object.assign({}, _dropperState)
    }

    function _executeDrop() {
        if (!_activeVehicle || !_dropperState.selectedMode) {
            return
        }
        const safety = _dropSafetyCheck()
        if (!safety.ok) {
            _dropperStatusText = safety.reason
            return
        }
        if (_dropperState.selectedMode === "burst") {
            _activeVehicle.sendCommand(191, 31012, true, 10, 0, 0, 0, 0, 0, 0, 0)
            _dropperState.dropped = [true, true, true, true]
            // A dropped bay is now empty (gate open) -> no longer loaded.
            _dropperState.loaded = [false, false, false, false]
            _dropperStatusText = qsTr("⚡ BURST — all payloads deployed")
        } else {
            const index = _dropperState.selectedPayloadIdx
            const bits = [0, 0, 0, 0]
            bits[index] = 1
            _activeVehicle.sendCommand(191, 31012, true, 5, bits[0], bits[1], bits[2], bits[3], 0, 0, 0)
            _dropperState.dropped[index] = true
            _dropperState.loaded[index] = false
            _dropperStatusText = qsTr("⚡ PLD %1 deployed").arg(index + 1)
        }
        _dropperState.selectedMode = null
        _dropperState.selectedPayloadIdx = null
        _dropperState = Object.assign({}, _dropperState)
    }

    // ---- LOAD: each bay loads / unloads INDEPENDENTLY ----------------------------
    // Servo command 31012 mode 5 carries the full 4-servo state, so every load/unload
    // sends the complete desired pattern: a loaded bay is closed (bit 0), an empty bay
    // is open (bit 1). Tracking loaded[] and sending the whole pattern each time lets us
    // re-seat a single bay (e.g. PLD 3) without disturbing the others.
    function _dropperApplyServos() {
        const bits = [0, 0, 0, 0]
        for (let i = 0; i < 4; i++) {
            bits[i] = _dropperState.loaded[i] ? 0 : 1
        }
        _activeVehicle.sendCommand(191, 31012, true, 5, bits[0], bits[1], bits[2], bits[3], 0, 0, 0)
    }

    function _dropperToggleLoad(index) {
        if (!_activeVehicle) {
            return
        }
        const willLoad = !_dropperState.loaded[index]
        _dropperState.loaded[index] = willLoad
        if (willLoad) {
            _dropperState.dropped[index] = false
        }
        _dropperApplyServos()
        _dropperState = Object.assign({}, _dropperState)
        _dropperStatusText = willLoad ? qsTr("✓ PLD %1 loaded").arg(index + 1)
                                      : qsTr("PLD %1 unloaded — gate open").arg(index + 1)
    }

    function _dropperUnloadAll() {
        if (!_activeVehicle) {
            return
        }
        _activeVehicle.sendCommand(191, 31012, true, 10, 0, 0, 0, 0, 0, 0, 0)
        _dropperState.loaded = [false, false, false, false]
        _dropperState.dropped = [false, false, false, false]
        _dropperState.selectedMode = null
        _dropperState.selectedPayloadIdx = null
        _dropperState = Object.assign({}, _dropperState)
        _dropperStatusText = qsTr("✓ All gates opened")
    }

    dropPanelComponent: Component {
        FlyViewDropperPanel {
            dropperAction: action
        }
    }
}
