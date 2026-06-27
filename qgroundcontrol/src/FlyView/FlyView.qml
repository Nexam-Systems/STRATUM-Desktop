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

    property real   _fullItemZorder:    0
    property real   _pipItemZorder:     QGroundControl.zOrderWidgets

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
    }
}
