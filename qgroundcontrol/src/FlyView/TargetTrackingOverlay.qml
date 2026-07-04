import QtQuick

// STRATUM: operator-in-the-loop visual target designation overlay.
//
// Draws on top of the live video. A click drops a fixed-size selection box on the
// target; a drag draws a custom box. On release the normalized box is sent to the
// companion tracker via Vehicle::sendTargetSelect (NEXAM_TARGET_SELECT / 42003). The
// companion runs the OpenCV tracker and streams NEXAM_TARGET_TRACK (42004) back, which
// arrives here as vehicle.targetTrack.* facts and is drawn as the red tracked box.
//
// This is intentionally decoupled from the camera-tracking path (VehicleCameraControl):
// it needs no CAMERA_INFORMATION capability handshake, only a connected vehicle and a
// running video stream, because the tracker lives on the companion, not in a camera.
Item {
    id: rootItem

    required property var  vehicle       // active Vehicle (may be null)
    required property real videoWidth
    required property real videoHeight

    // Fixed selection box size (fraction of the displayed video) used for a plain
    // click. Matches the "fixed selection bounding box" designation mode.
    property real fixedBoxFrac: 0.15

    readonly property bool _enabled: !!vehicle && videoWidth > 0 && videoHeight > 0

    // Drag state (parent/view coordinates)
    property real _dragStartX: 0
    property real _dragStartY: 0
    property real _dragCurrentX: 0
    property real _dragCurrentY: 0
    property bool _dragging: false

    readonly property real _marginH: (rootItem.width - videoWidth) / 2
    readonly property real _marginV: (rootItem.height - videoHeight) / 2

    // --- Tracked target feed (from the companion via NEXAM_TARGET_TRACK) ---
    // status: 0=IDLE, 1=TRACKING, 2=LOST
    readonly property var  _track: vehicle ? vehicle.targetTrack : null
    readonly property bool _trackingActive: _enabled && _track && _track.status.value === 1

    // --- helpers -------------------------------------------------------------
    // View coordinate -> normalized video coordinate (0..1), clamped, letterbox-aware.
    function _normX(px) { return Math.max(0.0, Math.min(1.0, (px - _marginH) / videoWidth)) }
    function _normY(py) { return Math.max(0.0, Math.min(1.0, (py - _marginV) / videoHeight)) }

    function mouseClicked(mouseX, mouseY) {
        if (!_enabled) {
            return
        }
        // Fixed-size box centred on the click.
        var cx = _normX(mouseX)
        var cy = _normY(mouseY)
        var hw = fixedBoxFrac / 2
        var hh = fixedBoxFrac / 2
        var x0 = Math.max(0.0, cx - hw)
        var y0 = Math.max(0.0, cy - hh)
        var x1 = Math.min(1.0, cx + hw)
        var y1 = Math.min(1.0, cy + hh)
        vehicle.sendTargetSelect(x0, y0, x1, y1, 1)
    }

    function mouseDragStart(mouseX, mouseY) {
        if (!_enabled) {
            return
        }
        _dragStartX = mouseX
        _dragStartY = mouseY
        _dragCurrentX = mouseX
        _dragCurrentY = mouseY
        _dragging = true
    }

    function mouseDragPositionChanged(mouseX, mouseY) {
        if (!_dragging) {
            return
        }
        _dragCurrentX = mouseX
        _dragCurrentY = mouseY
    }

    function mouseDragEnd(mouseX, mouseY) {
        _dragging = false
        if (!_enabled) {
            return
        }
        var x0 = _normX(Math.min(_dragStartX, mouseX))
        var x1 = _normX(Math.max(_dragStartX, mouseX))
        var y0 = _normY(Math.min(_dragStartY, mouseY))
        var y1 = _normY(Math.max(_dragStartY, mouseY))

        // Ignore degenerate rectangles (near-horizontal / near-vertical drags):
        // treat them as a click instead so a stray drag still designates a target.
        if ((x1 - x0) < 0.02 || (y1 - y0) < 0.02) {
            mouseClicked(mouseX, mouseY)
            return
        }
        vehicle.sendTargetSelect(x0, y0, x1, y1, 1)
    }

    // --- selection overlay (green box while dragging) ------------------------
    Rectangle {
        visible: _dragging
        color: Qt.rgba(0.1, 0.85, 0.1, 0.25)
        border.color: "green"
        border.width: 2
        x: Math.min(_dragStartX, _dragCurrentX)
        y: Math.min(_dragStartY, _dragCurrentY)
        width: Math.abs(_dragCurrentX - _dragStartX)
        height: Math.abs(_dragCurrentY - _dragStartY)
    }

    // --- tracked target overlay (red box streamed back from the companion) ---
    Rectangle {
        id: trackedBox
        color: "transparent"
        border.color: "red"
        border.width: 3
        radius: 3
        visible: rootItem._trackingActive

        x: rootItem._trackingActive ? rootItem._marginH + videoWidth  * rootItem._track.topLeftX.value : 0
        y: rootItem._trackingActive ? rootItem._marginV + videoHeight * rootItem._track.topLeftY.value : 0
        width:  rootItem._trackingActive ? videoWidth  * (rootItem._track.botRightX.value - rootItem._track.topLeftX.value) : 0
        height: rootItem._trackingActive ? videoHeight * (rootItem._track.botRightY.value - rootItem._track.topLeftY.value) : 0

        // Small corner label with the track id + confidence.
        Rectangle {
            visible: parent.visible
            color: Qt.rgba(0, 0, 0, 0.5)
            anchors.left: parent.left
            anchors.bottom: parent.top
            width: label.implicitWidth + 8
            height: label.implicitHeight + 4
            Text {
                id: label
                anchors.centerIn: parent
                color: "red"
                font.pixelSize: 12
                text: rootItem._trackingActive
                      ? ("T" + rootItem._track.targetId.value + "  " + Math.round(rootItem._track.confidence.value * 100) + "%")
                      : ""
            }
        }
    }
}
