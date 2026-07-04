import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Layouts

import QtLocation
import QtPositioning
import QtQuick.Window
import QtQml.Models

import QGroundControl
import QGroundControl.Controls
import QGroundControl.FlyView
import QGroundControl.FlightMap
import QGroundControl.Toolbar
import QGroundControl.Viewer3D

Item {
    id: _root

    readonly property bool _is3DMode:       QGCViewer3DManager.displayMode === QGCViewer3DManager.View3D
    readonly property bool _keepSceneAlive: QGroundControl.settingsManager.viewer3DSettings.keepSceneAlive.rawValue

    // These should only be used by MainRootWindow
    property var planController:    _planController
    property var guidedController:  _guidedController

    PlanMasterController {
        id:                     _planController
        flyView:                true
        Component.onCompleted:  start()
    }

    // STRATUM: shared engagement/abort safety-loop controller. Reached by the Engage
    // trigger (down the tool-strip chain) and the Abort control + countdown overlay
    // below, so both act on one piece of arming/destination state.
    EngagementController {
        id: engagementController
    }

    property bool   _mainWindowIsMap:       mapControl.pipState.state === mapControl.pipState.fullState
    property bool   _isFullWindowItemDark:  _mainWindowIsMap ? mapControl.isSatelliteMap : true
    property var    _activeVehicle:         QGroundControl.multiVehicleManager.activeVehicle
    property var    _missionController:     _planController.missionController
    property var    _geoFenceController:    _planController.geoFenceController
    property var    _rallyPointController:  _planController.rallyPointController
    property real   _margins:               ScreenTools.defaultFontPixelWidth / 2
    property var    _guidedController:      guidedActionsController
    property var    _guidedValueSlider:     guidedValueSlider
    property var    _widgetLayer:           widgetLayer
    property real   _toolsMargin:           ScreenTools.defaultFontPixelWidth * 0.75
    property rect   _centerViewport:        Qt.rect(0, 0, width, height)
    property real   _rightPanelWidth:       ScreenTools.defaultFontPixelWidth * 30
    property var    _mapControl:            mapControl
    property real   _widgetMargin:          ScreenTools.defaultFontPixelWidth * 0.75
    property var    _dropperState:          ({ selectedMode: null, selectedPayloadIdx: null, dropped: [false, false, false, false], loaded: [false, false, false, false] })
    property string _dropperStatusText:     qsTr("Dropper ready")
    property bool   _dropperToolsOpen:      false
    property bool   _dropperLoadUnlocked:   false
    property bool   _dropperLoadVisible:    false
    property bool   _dropperDropVisible:    false
    property bool   _dropperCameraVisible:  false

    property real   _fullItemZorder:    0
    property real   _pipItemZorder:     QGroundControl.zOrderWidgets

    function _dropperCanLoad(index) {
        if (index === 0) {
            return true
        }
        return _dropperState.loaded[index - 1]
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

    function _openDropperTools() {
        _dropperToolsOpen = !_dropperToolsOpen
        if (!_dropperToolsOpen) {
            _dropperLoadVisible = false
            _dropperDropVisible = false
            _dropperCameraVisible = false
        }
    }

    function _showDropperSection(section) {
        _dropperLoadVisible = (section === "load")
        _dropperDropVisible = (section === "drop")
        _dropperCameraVisible = (section === "camera")
    }

    function _unlockDropperLoad() {
        _dropperLoadUnlocked = true
        _dropperStatusText = qsTr("Loading unlocked")
    }

    function _confirmUnloadAll() {
        unloadConfirmDialog.open()
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

    function _calcCenterViewPort() {
        var newToolInset = Qt.rect(0, 0, width, height)
        toolstrip.adjustToolInset(newToolInset)
    }

    function dropMainStatusIndicatorTool() {
        toolbar.dropMainStatusIndicatorTool();
    }

    QGCToolInsets {
        id:                     _toolInsets
        topEdgeLeftInset:       toolbar.height
        topEdgeCenterInset:     topEdgeLeftInset
        topEdgeRightInset:      topEdgeLeftInset
        leftEdgeBottomInset:    _pipView.leftEdgeBottomInset
        bottomEdgeLeftInset:    _pipView.bottomEdgeLeftInset
    }

    Item {
        id:                 mapHolder
        anchors.fill:       parent

        FlyViewMap {
            id:                     mapControl
            planMasterController:   _planController
            rightPanelWidth:        ScreenTools.defaultFontPixelHeight * 9
            pipView:                _pipView
            pipMode:                !_mainWindowIsMap
            toolInsets:             customOverlay.totalToolInsets
            mapName:                "FlightDisplayView"
            enabled:                !_is3DMode
            visible:                !_is3DMode
        }

        FlyViewVideo {
            id:         videoControl
            pipView:    _pipView
        }

        PipView {
            id:                     _pipView
            anchors.left:           parent.left
            anchors.bottom:         parent.bottom
            anchors.margins:        _toolsMargin
            item1IsFullSettingsKey: "MainFlyWindowIsMap"
            item1:                  mapControl
            item2:                  QGroundControl.videoManager.hasVideo ? videoControl : null
            show:                   QGroundControl.videoManager.hasVideo && !QGroundControl.videoManager.fullScreen &&
                                        (videoControl.pipState.state === videoControl.pipState.pipState || mapControl.pipState.state === mapControl.pipState.pipState)
            z:                      QGroundControl.zOrderWidgets

            property real leftEdgeBottomInset: visible ? width + anchors.margins : 0
            property real bottomEdgeLeftInset: visible ? height + anchors.margins : 0
        }

        FlyViewWidgetLayer {
            id:                     widgetLayer
            anchors.top:            parent.top
            anchors.bottom:         parent.bottom
            anchors.left:           parent.left
            anchors.right:          guidedValueSlider.visible ? guidedValueSlider.left : parent.right
            anchors.margins:        _widgetMargin
            anchors.topMargin:      toolbar.height + _widgetMargin
            z:                      _fullItemZorder + 2
            parentToolInsets:       _toolInsets
            mapControl:             _mapControl
            engagementController:   engagementController
            visible:                !QGroundControl.videoManager.fullScreen
        }

        FlyViewCustomLayer {
            id:                 customOverlay
            anchors.fill:       widgetLayer
            z:                  _fullItemZorder + 2
            parentToolInsets:   widgetLayer.totalToolInsets
            mapControl:         _mapControl
            visible:            !QGroundControl.videoManager.fullScreen
        }

        // Development tool for visualizing the insets for a paticular layer, show if needed
        FlyViewInsetViewer {
            id:                     widgetLayerInsetViewer
            anchors.top:            parent.top
            anchors.bottom:         parent.bottom
            anchors.left:           parent.left
            anchors.right:          guidedValueSlider.visible ? guidedValueSlider.left : parent.right
            z:                      widgetLayer.z + 1
            insetsToView:           widgetLayer.totalToolInsets
            visible:                false
        }

        GuidedActionsController {
            id:                 guidedActionsController
            missionController:  _missionController
            guidedValueSlider:     _guidedValueSlider
        }

        //-- Guided value slider (e.g. altitude)
        GuidedValueSlider {
            id:                 guidedValueSlider
            anchors.right:      parent.right
            anchors.top:        parent.top
            anchors.bottom:     parent.bottom
            anchors.topMargin:  toolbar.height
            z:                  QGroundControl.zOrderTopMost
            visible:            false
        }

        QGCPalette { id: qgcPal }

        MessageDialog {
            id: unloadConfirmDialog
            title: qsTr("Unload all payload gates?")
            text: qsTr("This will open all gates and clear the current dropper state. Continue?")
            buttons: MessageDialog.Yes | MessageDialog.No
            onAccepted: _dropperUnloadAll()
        }

        Item {
            id: dropperToolButtonHost
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: toolbar.height + _toolsMargin
            anchors.leftMargin: _toolsMargin
            width: dropperToolButton.width + _toolsMargin * 2
            height: dropperToolButton.height + _toolsMargin * 2
            visible: _activeVehicle && !QGroundControl.videoManager.fullScreen && !_is3DMode
            z: QGroundControl.zOrderTopMost

            QGCButton {
                id: dropperToolButton
                anchors.centerIn: parent
                text: _dropperToolsOpen ? qsTr("Hide Dropper") : qsTr("Dropper")
                onClicked: _openDropperTools()
            }
        }

        Item {
            id: dropperControlPanel
            anchors.left: dropperToolButtonHost.right
            anchors.top: dropperToolButtonHost.top
            width: ScreenTools.defaultFontPixelWidth * 24
            height: ScreenTools.defaultFontPixelWidth * 24
            visible: _activeVehicle && _dropperToolsOpen && !QGroundControl.videoManager.fullScreen && !_is3DMode
            z: QGroundControl.zOrderTopMost

            Rectangle {
                anchors.fill: parent
                color: Qt.rgba(0, 0, 0, 0.78)
                radius: ScreenTools.defaultBorderRadius
                border.color: "#4ADE80"
                border.width: 1
            }

            Column {
                anchors.fill: parent
                anchors.margins: ScreenTools.defaultFontPixelWidth * 0.75
                spacing: ScreenTools.defaultFontPixelWidth * 0.4

                QGCLabel {
                    text: qsTr("Dropper Tools")
                    font.bold: true
                    color: "white"
                }

                QGCLabel {
                    text: _dropperStatusText
                    color: "#BFDBFE"
                    width: parent.width
                    wrapMode: Text.WordWrap
                }

                Row {
                    spacing: ScreenTools.defaultFontPixelWidth * 0.4

                    QGCButton {
                        text: qsTr("Load")
                        onClicked: {
                            _showDropperSection("load")
                        }
                    }

                    QGCButton {
                        text: qsTr("Drop")
                        onClicked: {
                            _showDropperSection("drop")
                        }
                    }

                    QGCButton {
                        text: qsTr("Camera")
                        onClicked: {
                            _showDropperSection("camera")
                        }
                    }
                }

                Item {
                    width: parent.width
                    height: ScreenTools.defaultFontPixelWidth * 8
                    visible: _dropperLoadVisible

                    Column {
                        spacing: ScreenTools.defaultFontPixelWidth * 0.35

                        QGCButton {
                            text: _dropperLoadUnlocked ? qsTr("Loading unlocked") : qsTr("Unlock load")
                            enabled: !_dropperLoadUnlocked
                            onClicked: _unlockDropperLoad()
                        }

                        QGCButton {
                            text: qsTr("Unload All")
                            enabled: _activeVehicle
                            onClicked: _confirmUnloadAll()
                        }

                        Row {
                            spacing: ScreenTools.defaultFontPixelWidth * 0.4

                            Repeater {
                                model: 4
                                delegate: QGCButton {
                                    text: _dropperState.loaded[index] ? qsTr("Loaded %1").arg(index + 1) : qsTr("Load %1").arg(index + 1)
                                    onClicked: _dropperLoadPayload(index)
                                    enabled: _activeVehicle && _dropperLoadUnlocked && _dropperCanLoad(index) && !_dropperState.loaded[index]
                                }
                            }
                        }
                    }
                }

                Item {
                    width: parent.width
                    height: ScreenTools.defaultFontPixelWidth * 8
                    visible: _dropperDropVisible

                    Column {
                        spacing: ScreenTools.defaultFontPixelWidth * 0.35

                        QGCButton {
                            text: qsTr("Burst")
                            onClicked: _dropperSendBurst()
                        }

                        Row {
                            spacing: ScreenTools.defaultFontPixelWidth * 0.4

                            Repeater {
                                model: 4
                                delegate: QGCButton {
                                    text: qsTr("PLD %1").arg(index + 1)
                                    onClicked: _dropperSendSingle(index)
                                    enabled: _activeVehicle && !_dropperState.dropped[index]
                                }
                            }
                        }
                    }
                }

                Item {
                    width: parent.width
                    height: ScreenTools.defaultFontPixelWidth * 8
                    visible: _dropperCameraVisible

                    Column {
                        spacing: ScreenTools.defaultFontPixelWidth * 0.35

                        Row {
                            spacing: ScreenTools.defaultFontPixelWidth * 0.4

                            QGCButton {
                                text: qsTr("Center")
                                onClicked: _dropperSendCameraAction("center")
                            }

                            QGCButton {
                                text: qsTr("Capture")
                                onClicked: _dropperSendCameraAction("capture")
                            }

                            QGCButton {
                                text: qsTr("Track")
                                onClicked: _dropperSendCameraAction("track-center")
                            }
                        }

                        Row {
                            spacing: ScreenTools.defaultFontPixelWidth * 0.4

                            QGCButton {
                                text: qsTr("Zoom +")
                                onClicked: _dropperSendCameraAction("zoom-in")
                            }

                            QGCButton {
                                text: qsTr("Zoom -")
                                onClicked: _dropperSendCameraAction("zoom-out")
                            }

                            QGCButton {
                                text: qsTr("Rec")
                                onClicked: _dropperSendCameraAction("rec-start")
                            }
                        }
                    }
                }
            }
        }

        // STRATUM: guided-action confirm bar, relocated from the top toolbar to the
        // bottom edge for ergonomic reach. Hosts the slide-to-confirm control used to
        // accept guided / flight-mode command changes. The message display and its
        // fade timer/animation are kept co-located in this same document so the
        // GuidedActionConfirm internals resolve their ids exactly as before.
        Item {
            id:                         guidedActionConfirmBottomBar
            anchors.bottom:             parent.bottom
            anchors.bottomMargin:       _toolsMargin
            anchors.horizontalCenter:   parent.horizontalCenter
            width:                      guidedActionConfirmBottom.width + (_toolsMargin * 2)
            height:                     ScreenTools.toolbarHeight
            visible:                    guidedActionConfirmBottom.visible
            z:                          QGroundControl.zOrderTopMost

            Rectangle {
                anchors.fill:   parent
                color:          qgcPal.window
                opacity:        0.85
                radius:         ScreenTools.defaultBorderRadius
            }

            GuidedActionConfirm {
                id:                 guidedActionConfirmBottom
                anchors.centerIn:   parent
                height:             parent.height
                guidedController:   _guidedController
                guidedValueSlider:  _guidedValueSlider
                messageDisplay:     guidedActionMessageDisplay
            }
        }

        // Message display floats just above the bottom confirm bar. Defined here (not
        // inside GuidedActionConfirm) so it is not clipped and so messageFadeTimer /
        // messageOpacityAnimation remain resolvable from the confirm control.
        Rectangle {
            id:                         guidedActionMessageDisplay
            anchors.bottom:             guidedActionConfirmBottomBar.top
            anchors.bottomMargin:       _margins
            anchors.horizontalCenter:   guidedActionConfirmBottomBar.horizontalCenter
            width:                      messageLabel.contentWidth + (_margins * 2)
            height:                     messageLabel.contentHeight + (_margins * 2)
            // Opacity is intentionally left unbound: GuidedActionConfirm drives it via
            // messageFadeTimer / messageOpacityAnimation (fade out) and reset (back to 1).
            color:                      qgcPal.windowTransparent
            radius:                     ScreenTools.defaultBorderRadius
            visible:                    guidedActionConfirmBottom.visible
            z:                          QGroundControl.zOrderTopMost

            QGCLabel {
                id:         messageLabel
                x:          _margins
                y:          _margins
                width:      ScreenTools.defaultFontPixelWidth * 30
                wrapMode:   Text.WordWrap
                text:       guidedActionConfirmBottom.message
            }

            PropertyAnimation {
                id:         messageOpacityAnimation
                target:     guidedActionMessageDisplay
                property:   "opacity"
                from:       1
                to:         0
                duration:   500
            }

            Timer {
                id:             messageFadeTimer
                interval:       4000
                onTriggered:    messageOpacityAnimation.start()
            }
        }

        // STRATUM: engagement status + abort overlay. Top-centre of the flight view
        // (below the toolbar), above all map widgets so it cannot be missed. Carries
        // the blinking ENGAGING! banner, the time-to-impact countdown, and the
        // HOLD-TO-ABORT control. Driven by the shared engagement/abort controller.
        EngagementAbortOverlay {
            id:                     engagementAbortOverlay
            engagementController:    engagementController
            topMargin:               toolbar.height + (_toolsMargin * 3)
        }

        // STRATUM: vision-engagement status + abort overlay. Same top-centre slot as the
        // coordinate-engagement overlay above; the two are mutually exclusive by mode, so
        // only one is ever visible. Carries the VISION ENGAGING! banner, the 42002-driven
        // guidance panel, and the SHARED HOLD-TO-ABORT control (contract Task 5 -- one
        // abort path, not a fork).
        VisionEngagementOverlay {
            id:                     visionEngagementOverlay
            engagementController:    engagementController
            topMargin:               toolbar.height + (_toolsMargin * 3)
        }

        Loader {
            id:           viewer3DLoader
            z:            1
            anchors.fill: parent
            visible:      _is3DMode
        }

        Connections {
            target: QGCViewer3DManager
            function onDisplayModeChanged() {
                if (QGCViewer3DManager.displayMode === QGCViewer3DManager.View3D) {
                    if (!viewer3DLoader.item) {
                        viewer3DLoader.setSource(
                            "qrc:/qml/QGroundControl/Viewer3D/Models3D/Viewer3DModel.qml",
                            { missionController: Qt.binding(() => _missionController) }
                        )
                    }
                } else if (!_keepSceneAlive) {
                    viewer3DLoader.source = ""
                }
            }
        }
    }

    FlyViewToolBar {
        id:                 toolbar
        guidedValueSlider:  _guidedValueSlider
        visible:            !QGroundControl.videoManager.fullScreen

        // STRATUM: AOP / standoff entry commands relocated to the ribbon centre; route
        // them to the widget layer that owns the standoff panel and the AOP map editor.
        onDefineAOP:   widgetLayer.startAOP()
        onSetStandoff: widgetLayer.toggleStandoff()
    }
}
