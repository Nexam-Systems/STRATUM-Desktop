import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

import QGroundControl
import QGroundControl.Controls

ToolStripAction {
    id: action

    text: qsTr("Dropper")
    iconSource: "qrc:/res/DropArrow.svg"
    enabled: !!QGroundControl.multiVehicleManager.activeVehicle
    visible: true

    property var _activeVehicle: QGroundControl.multiVehicleManager.activeVehicle
    property string _dropperSection: "load"
    property var _dropperState: ({ selectedMode: null, selectedPayloadIdx: null, dropped: [false, false, false, false], loaded: [false, false, false, false] })
    property string _dropperStatusText: qsTr("Dropper ready")
    property bool _dropperLoadUnlocked: false
    property bool _dropperIrFeedActive: false

    function _showDropperSection(section) {
        _dropperSection = section
    }

    function _dropperCanLoad(index) {
        if (index === 0) {
            return true
        }
        return _dropperState.loaded[index - 1]
    }

    function _dropperUnlockLoad() {
        _dropperLoadUnlocked = true
        _dropperStatusText = qsTr("Loading unlocked")
    }

    function _dropperSendSingle(index) {
        if (!_activeVehicle) {
            return
        }
        const bits = [0, 0, 0, 0]
        bits[index] = 1
        _activeVehicle.sendCommand(191, 31012, true, 5, bits[0], bits[1], bits[2], bits[3], 0, 0, 0)
        _dropperState.dropped[index] = true
        _dropperState.selectedMode = null
        _dropperState.selectedPayloadIdx = null
        _dropperStatusText = qsTr("Payload %1 dropped").arg(index + 1)
    }

    function _dropperSendBurst() {
        if (!_activeVehicle) {
            return
        }
        _activeVehicle.sendCommand(191, 31012, true, 10, 0, 0, 0, 0, 0, 0, 0)
        _dropperState.dropped = [true, true, true, true]
        _dropperState.selectedMode = "burst"
        _dropperState.selectedPayloadIdx = null
        _dropperStatusText = qsTr("Burst release sent")
    }

    function _dropperLoadPayload(index) {
        if (!_activeVehicle) {
            return
        }
        const bits = [0, 0, 0, 0]
        for (let i = index + 1; i < 4; i++) {
            bits[i] = 1
        }
        _activeVehicle.sendCommand(191, 31012, true, 5, bits[0], bits[1], bits[2], bits[3], 0, 0, 0)
        for (let i = 0; i <= index; i++) {
            _dropperState.loaded[i] = true
            _dropperState.dropped[i] = false
        }
        _dropperStatusText = qsTr("Payload %1 loaded").arg(index + 1)
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
        _dropperLoadUnlocked = false
        _dropperStatusText = qsTr("All payload gates opened")
    }

    function _dropperSendCameraAction(action) {
        if (!_activeVehicle) {
            return
        }
        const sent = QGroundControl.videoManager.sendCameraAction(action)
        if (!sent) {
            _dropperStatusText = qsTr("Camera command failed")
            return
        }
        if (action === "track-center") {
            _dropperStatusText = qsTr("Tracking center")
        } else if (action === "capture") {
            _dropperStatusText = qsTr("Capture command sent")
        } else {
            _dropperStatusText = qsTr("Camera %1 sent").arg(action)
        }
    }

    function _dropperSelectFeed(feed) {
        _dropperIrFeedActive = (feed === "IR")
        _dropperStatusText = feed === "IR" ? qsTr("IR feed selected") : qsTr("TV feed selected")
    }

    dropPanelComponent: Component {
        FlyViewDropperPanel {
            dropperAction: action
        }
    }
}
