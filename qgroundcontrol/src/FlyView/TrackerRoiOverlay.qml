import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// STRATUM: tracker ROI-scoping overlay (picture-in-picture style).
//
// Draws the outer region-of-interest (ROI) box centered on the live video. The tracker
// on the companion only searches WITHIN this box before it emits a NEXAM_TARGET_TRACK
// box (see NEXAM_TRACKER_CONFIG / 42005). One operator control changes the ROI diagonal
// fraction (roi_size = ROI diagonal as a fraction of the full-frame diagonal, D5). On
// change it calls Vehicle::setTrackerRoi(0.5, 0.5, sizeDiag), which packs + sends the
// full config to the companion.
//
// Center is fixed at (0.5, 0.5) for now (D5); only the diagonal fraction is operator-
// controlled. This is decoupled from TargetTrackingOverlay (which does designation):
// this one only scopes the search region, it does not pick a target.
Item {
    id: rootItem

    required property var  vehicle       // active Vehicle (may be null)
    required property real videoWidth
    required property real videoHeight

    // ROI diagonal fraction (0..1). Local model value; pushed to the vehicle on change.
    property real roiSize: 0.5

    // Fixed ROI center (D5).
    readonly property real _roiCenterX: 0.5
    readonly property real _roiCenterY: 0.5

    // Effective video dimensions. videoWidth/videoHeight come from the streaming widget
    // (letterbox-correct), but they can read 0 before the stream is sized -- and that
    // binding would then latch this overlay invisible forever. Fall back to this overlay's
    // own (anchors.fill) size, which is always valid once laid out, so the ROI affordance
    // always appears once a vehicle is connected.
    readonly property real _vw: videoWidth  > 0 ? videoWidth  : rootItem.width
    readonly property real _vh: videoHeight > 0 ? videoHeight : rootItem.height

    // Show the ROI control whenever a vehicle is connected (independent of stream size),
    // so the operator can scope the search region before enabling tracking.
    readonly property bool _enabled: !!vehicle && _vw > 0 && _vh > 0

    readonly property real _marginH: (rootItem.width  - _vw) / 2
    readonly property real _marginV: (rootItem.height - _vh) / 2

    // Clamp the diagonal fraction to a sane operable range.
    readonly property real _minRoi: 0.1
    readonly property real _maxRoi: 1.0
    readonly property real _step:   0.05

    // Same-aspect ROI: a box similar to the frame has fractional side length equal to
    // fractional diagonal length, so roi_w = roiSize * videoWidth, roi_h = roiSize *
    // videoHeight. This matches the companion's _roi_pixel_rect math exactly.
    readonly property real _roiPixW: roiSize * _vw
    readonly property real _roiPixH: roiSize * _vh

    function _clampRoi(v) { return Math.max(_minRoi, Math.min(_maxRoi, v)) }

    function _applyRoi(v) {
        roiSize = _clampRoi(v)
        if (_enabled) {
            vehicle.setTrackerRoi(_roiCenterX, _roiCenterY, roiSize)
        }
    }

    // --- outer ROI box (centered) --------------------------------------------
    Rectangle {
        id: roiBox
        visible: rootItem._enabled
        color: "transparent"
        border.color: Qt.rgba(0.1, 0.7, 1.0, 0.9)   // cyan: distinct from the green
        border.width: 2                              // designation / red tracked boxes
        radius: 3

        width:  rootItem._roiPixW
        height: rootItem._roiPixH
        x: rootItem._marginH + (rootItem._vw - width)  / 2
        y: rootItem._marginV + (rootItem._vh - height) / 2

        // Dashed feel via a subtle inner tint so the box reads as a scope, not a target.
        Rectangle {
            anchors.fill: parent
            color: Qt.rgba(0.1, 0.7, 1.0, 0.04)
            border.width: 0
        }
    }

    // --- ROI size control (PiP-style, bottom-left of the video) --------------
    Rectangle {
        id: controlPanel
        visible: rootItem._enabled
        color: Qt.rgba(0, 0, 0, 0.55)
        radius: 4
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: rootItem._marginH + 12
        anchors.bottomMargin: rootItem._marginV + 12
        width: controlRow.implicitWidth + 16
        height: controlRow.implicitHeight + 10

        RowLayout {
            id: controlRow
            anchors.centerIn: parent
            spacing: 6

            Text {
                text: qsTr("ROI")
                color: "white"
                font.pixelSize: 12
                Layout.alignment: Qt.AlignVCenter
            }

            Button {
                text: "−"   // minus
                implicitWidth: 26
                implicitHeight: 22
                onClicked: rootItem._applyRoi(rootItem.roiSize - rootItem._step)
            }

            Text {
                text: Math.round(rootItem.roiSize * 100) + "%"
                color: "white"
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                Layout.minimumWidth: 34
                Layout.alignment: Qt.AlignVCenter
            }

            Button {
                text: "+"
                implicitWidth: 26
                implicitHeight: 22
                onClicked: rootItem._applyRoi(rootItem.roiSize + rootItem._step)
            }
        }
    }
}
