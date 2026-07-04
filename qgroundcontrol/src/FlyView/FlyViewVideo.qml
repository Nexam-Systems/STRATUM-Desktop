import QtQuick

import QGroundControl
import QGroundControl.Controls

Item {
    id: _root

    property Item pipView
    property Item pipState: videoPipState

    PipState {
        id:         videoPipState
        pipView:    _root.pipView
        isDark:     true

        onWindowAboutToOpen: {
            QGroundControl.videoManager.stopVideo()
            videoStartDelay.start()
        }

        onWindowAboutToClose: {
            QGroundControl.videoManager.stopVideo()
            videoStartDelay.start()
        }

        onStateChanged: {
            if (pipState.state !== pipState.fullState) {
                QGroundControl.videoManager.fullScreen = false
            }
        }
    }

    Timer {
        id:           videoStartDelay
        interval:     2000;
        running:      false
        repeat:       false
        onTriggered:  QGroundControl.videoManager.startVideo()
    }

    //-- Video Streaming
    FlightDisplayViewVideo {
        id:             videoStreaming
        anchors.fill:   parent
        useSmallFont:   _root.pipState.state !== _root.pipState.fullState
        visible:        QGroundControl.videoManager.isStreamSource || QGroundControl.videoManager.isUvc
    }

    QGCLabel {
        text: qsTr("Double-click to exit full screen")
        font.pointSize: ScreenTools.largeFontPointSize
        visible: QGroundControl.videoManager.fullScreen
        anchors.centerIn: parent

        onVisibleChanged: {
            if (visible) {
                labelAnimation.start()
            }
        }

        PropertyAnimation on opacity {
            id: labelAnimation
            duration: 10000
            from: 1.0
            to: 0.0
            easing.type: Easing.InExpo
        }
    }

    OnScreenGimbalController {
        id:                      onScreenGimbalController
        anchors.fill:            parent
        cameraTrackingEnabled:   !!(videoStreaming._camera && videoStreaming._camera.trackingEnabled)
    }

    OnScreenCameraTrackingController {
        id:                      cameraTrackingController
        anchors.fill:            parent
        camera:                  videoStreaming._camera
        videoWidth:              videoStreaming.getWidth()
        videoHeight:             videoStreaming.getHeight()
    }

    //-- STRATUM: operator visual target designation. Sends NEXAM_TARGET_SELECT on
    //   click/drag and renders the tracked box streamed back by the companion. Works
    //   without a MAVLink camera (the tracker lives on the companion computer).
    TargetTrackingOverlay {
        id:                      targetTrackingOverlay
        anchors.fill:            parent
        vehicle:                 QGroundControl.multiVehicleManager.activeVehicle
        videoWidth:              videoStreaming.getWidth()
        videoHeight:             videoStreaming.getHeight()
    }

    //-- STRATUM: tracker ROI-scoping overlay. Draws the outer ROI box the companion
    //   tracker searches within and exposes a single diagonal-fraction control that
    //   calls Vehicle::setTrackerRoi (NEXAM_TRACKER_CONFIG / 42005). Guards for a null
    //   active vehicle internally (its _enabled check).
    TrackerRoiOverlay {
        id:                      trackerRoiOverlay
        anchors.fill:            parent
        // STRATUM: sit above flyViewVideoMouseArea (below) so the +/- ROI buttons receive
        // clicks; the overlay's transparent areas still pass mouse events through to the
        // designation MouseArea (a plain Item does not grab events).
        z:                       20
        vehicle:                 QGroundControl.multiVehicleManager.activeVehicle
        videoWidth:              videoStreaming.getWidth()
        videoHeight:             videoStreaming.getHeight()
    }

    MouseArea {
        id:                         flyViewVideoMouseArea
        anchors.fill:               parent
        enabled:                    pipState.state === pipState.fullState

        property real _pressX:      0
        property real _pressY:      0
        property bool _dragging:    false
        readonly property real _dragThreshold: 10

        onDoubleClicked: QGroundControl.videoManager.fullScreen = !QGroundControl.videoManager.fullScreen

        onPressed: (mouse) => {
            _pressX = mouse.x
            _pressY = mouse.y
            _dragging = false
        }

        onPositionChanged: (mouse) => {
            if (!_dragging && (Math.abs(mouse.x - _pressX) >= _dragThreshold || Math.abs(mouse.y - _pressY) >= _dragThreshold)) {
                _dragging = true
                onScreenGimbalController.mouseDragStart(_pressX, _pressY)
                cameraTrackingController.mouseDragStart(_pressX, _pressY)
                targetTrackingOverlay.mouseDragStart(_pressX, _pressY)
            }
            if (_dragging) {
                onScreenGimbalController.mouseDragPositionChanged(mouse.x, mouse.y)
                cameraTrackingController.mouseDragPositionChanged(mouse.x, mouse.y)
                targetTrackingOverlay.mouseDragPositionChanged(mouse.x, mouse.y)
            }
        }

        onReleased: (mouse) => {
            if (_dragging) {
                onScreenGimbalController.mouseDragEnd()
                cameraTrackingController.mouseDragEnd(mouse.x, mouse.y)
                targetTrackingOverlay.mouseDragEnd(mouse.x, mouse.y)
            } else {
                onScreenGimbalController.mouseClicked(mouse.x, mouse.y)
                cameraTrackingController.mouseClicked(mouse.x, mouse.y)
                targetTrackingOverlay.mouseClicked(mouse.x, mouse.y)
            }
            _dragging = false
        }
    }

    ProximityRadarVideoView{
        anchors.fill:   parent
        vehicle:        QGroundControl.multiVehicleManager.activeVehicle
    }

    ObstacleDistanceOverlayVideo {
        id: obstacleDistance
        showText: pipState.state === pipState.fullState
    }

    //-- STRATUM flight-parameter OSD. Drawn on top of the video only.
    //   enabled:false inside the control lets gimbal/tracking input pass through.
    FlyViewVideoOSD {
        id:         flightParamOSD
        anchors.fill: parent
        compact:    _root.pipState.state !== _root.pipState.fullState
        visible:    videoStreaming.visible
    }
}
