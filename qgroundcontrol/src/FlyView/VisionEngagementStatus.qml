import QtQuick
import QtQuick.Layouts

import QGroundControl
import QGroundControl.Controls

// STRATUM: vision-engagement guidance panel, driven by the VISION_ENGAGEMENT_STATUS
// (42002) FactGroup on Vehicle. Camera-guided terminal run -- there is NO target
// coordinate to show. The panel reacts to `state`:
//
//   SEARCH   (0): "ACQUIRING", no countdown. Vehicle holds; safe. ABORT still live.
//   TRACK    (1): closed-loop pursuit -- show range / closing speed; countdown when
//                 tti_valid == 1, interpolated smoothly between the ~5 Hz updates.
//   COAST    (2): lock momentarily lost -- "TRACKING LOST — COASTING", no countdown.
//   TERMINAL (3): within commit range -- prominent countdown (when tti_valid).
//   ABORT    (4): vehicle self-aborting (FOV/coast breakdown) -- reflect it.
//
// Field rules (contract B1):
//   * time_to_impact is trustworthy ONLY when tti_valid == 1; 0 means "computing",
//     never a real zero. We never render a stale or zero countdown.
//   * track_quality 0..255 (255 = 1.0); 0 = no lock -> lock-strength bar.
//   * eps_az/el are small LOS errors (rad) -> a sensor-health / centering cue.
//   * stream lost (telemetryAvailable false) -> readouts shown stale, never frozen live.
//
// TRACK <-> COAST flapping is expected with a strapdown camera in a dive, so the
// DISPLAYED state is debounced (~0.5 s hold on COAST). The ABORT control is NEVER
// debounced and is owned by the overlay, not this display-only panel.
Item {
    id: root

    // Vehicle.visionEngagementStatus FactGroup, or null when no vehicle / not wired.
    property var visionStatus

    readonly property int _stateSearch:   0
    readonly property int _stateTrack:    1
    readonly property int _stateCoast:    2
    readonly property int _stateTerminal: 3
    readonly property int _stateAbort:    4

    readonly property bool _hasGroup: !!visionStatus
    readonly property int  _rawState: _hasGroup ? visionStatus.state.rawValue : _stateSearch
    readonly property bool _ttiValid: _hasGroup ? (visionStatus.ttiValid.rawValue === 1) : false
    readonly property bool _live:     _hasGroup ? visionStatus.telemetryAvailable : false
    readonly property real _tti:      _hasGroup ? visionStatus.timeToImpact.rawValue : NaN
    readonly property real _range:    _hasGroup ? visionStatus.range.rawValue : NaN
    readonly property real _closing:  _hasGroup ? visionStatus.closingSpeed.rawValue : NaN
    readonly property real _epsAz:    _hasGroup ? visionStatus.epsAz.rawValue : NaN
    readonly property real _epsEl:    _hasGroup ? visionStatus.epsEl.rawValue : NaN
    readonly property int  _trackQ:   _hasGroup ? visionStatus.trackQuality.rawValue : 0

    // Debounced display state. Only TRACK<->COAST is debounced; every other transition
    // (SEARCH / TERMINAL / ABORT) is adopted immediately.
    property int _dispState: _stateSearch

    // Whether a smooth, valid countdown should be shown: only in TRACK / TERMINAL,
    // with a valid estimate and a live stream.
    readonly property bool _showCountdown:
        (_dispState === _stateTrack || _dispState === _stateTerminal) &&
        _ttiValid && _live && !isNaN(_tti)

    // Secondary numeric readouts are meaningful while pursuing (TRACK / TERMINAL).
    readonly property bool _showMetrics:
        _dispState === _stateTrack || _dispState === _stateTerminal

    property real displayTTI: NaN

    onVisionStatusChanged: _dispState = _rawState

    // COAST hold: latch COAST for ~0.5 s so a TRACK<->COAST flap does not flicker text.
    Timer {
        id:         coastHoldTimer
        interval:   500
        repeat:     false
        onTriggered: {
            // Hold expired: adopt whatever the vehicle is currently reporting.
            if (root._rawState !== root._stateCoast) {
                root._dispState = root._rawState
            }
        }
    }

    on_RawStateChanged: {
        if (_rawState === _stateCoast) {
            _dispState = _stateCoast
            coastHoldTimer.restart()
        } else if (_rawState === _stateTrack) {
            // Only debounce the TRACK<->COAST pair: while the coast hold is running,
            // keep showing COAST; otherwise adopt TRACK immediately.
            if (!coastHoldTimer.running) {
                _dispState = _stateTrack
            }
        } else {
            // SEARCH / TERMINAL / ABORT: adopt immediately, cancel any coast hold.
            coastHoldTimer.stop()
            _dispState = _rawState
        }
    }

    // Show whenever the vehicle is in vision engagement (the overlay also gates on the
    // mode, but the panel self-limits to a valid state range so it never shows on stale
    // defaults when the mode is not active).
    visible:        _hasGroup
    implicitWidth:  card.implicitWidth
    implicitHeight: card.implicitHeight

    QGCPalette { id: qgcPal }

    // Smooth 10 Hz interpolation of the countdown between ~5 Hz vehicle samples so it
    // ticks down rather than stepping. Only runs when a valid countdown is shown.
    Timer {
        id:         tick
        interval:   100
        repeat:     true
        running:    root.visible && root._showCountdown

        property double anchorTTI:   NaN
        property double anchorMs:    0
        property double lastFactTTI: NaN

        onTriggered: {
            if (root._tti !== lastFactTTI) {   // new vehicle sample -> re-anchor
                lastFactTTI = root._tti
                anchorTTI   = root._tti
                anchorMs    = Date.now()
            }
            var dt = (Date.now() - anchorMs) / 1000.0
            root.displayTTI = Math.max(0, anchorTTI - dt)
        }
    }

    Rectangle {
        id:             card
        implicitWidth:  Math.max(contentCol.implicitWidth + ScreenTools.defaultFontPixelWidth * 4,
                                 ScreenTools.defaultFontPixelWidth * 22)
        implicitHeight: contentCol.implicitHeight + ScreenTools.defaultFontPixelHeight
        radius:         ScreenTools.defaultBorderRadius
        // Red while a valid terminal countdown is up or the vehicle is self-aborting;
        // amber while coasting; translucent otherwise.
        color: {
            if (root._dispState === root._stateAbort)  return "#cc6600"
            if (root._dispState === root._stateCoast)  return "#996600"
            if (root._showCountdown)                   return "#cc0000"
            return "#33000000"
        }
        border.color:   "white"
        border.width:   (root._showCountdown || root._dispState === root._stateAbort) ? 2 : 1

        ColumnLayout {
            id:                 contentCol
            anchors.centerIn:   parent
            spacing:            ScreenTools.defaultFontPixelHeight * 0.25

            // Primary status line.
            QGCLabel {
                Layout.alignment:   Qt.AlignHCenter
                color:              "white"
                font.bold:          true
                font.pointSize:     ScreenTools.mediumFontPointSize
                text: {
                    if (!root._live)                              return qsTr("VISION — STALE")
                    switch (root._dispState) {
                    case root._stateSearch:   return qsTr("ACQUIRING…")
                    case root._stateTrack:    return qsTr("TRACKING")
                    case root._stateCoast:    return qsTr("TRACKING LOST — COASTING")
                    case root._stateTerminal: return qsTr("TERMINAL")
                    case root._stateAbort:    return qsTr("SELF-ABORT")
                    default:                  return qsTr("VISION")
                    }
                }
            }

            // Countdown header + value, shown only with a valid estimate.
            QGCLabel {
                Layout.alignment:   Qt.AlignHCenter
                text:               qsTr("TIME TO IMPACT")
                color:              "white"
                font.bold:          true
                font.pointSize:     ScreenTools.smallFontPointSize
                visible:            root._showCountdown
            }
            QGCLabel {
                Layout.alignment:   Qt.AlignHCenter
                color:              "white"
                font.bold:          true
                font.pointSize:     ScreenTools.largeFontPointSize
                visible:            root._showCountdown || root._showMetrics
                text: {
                    if (root._showCountdown) {
                        return root.displayTTI.toFixed(1) + qsTr(" s")
                    }
                    // In TRACK/TERMINAL without a valid estimate: "computing", never zero.
                    if (root._showMetrics) {
                        return qsTr("COMPUTING…")
                    }
                    return ""
                }
            }

            // Range / closing speed, meaningful while pursuing.
            QGCLabel {
                Layout.alignment:   Qt.AlignHCenter
                color:              "white"
                font.pointSize:     ScreenTools.smallFontPointSize
                visible:            root._showMetrics
                text:               qsTr("range %1 m   closing %2 m/s")
                                        .arg(isNaN(root._range)   ? "—" : root._range.toFixed(0))
                                        .arg(isNaN(root._closing) ? "—" : root._closing.toFixed(1))
            }

            // LOS-error / centering cue (small, sensor-health hint). Shown while pursuing.
            QGCLabel {
                Layout.alignment:   Qt.AlignHCenter
                color:              "#dddddd"
                font.pointSize:     ScreenTools.smallFontPointSize
                visible:            root._showMetrics && !isNaN(root._epsAz) && !isNaN(root._epsEl)
                text:               qsTr("LOS az %1°  el %2°")
                                        .arg((root._epsAz * 180 / Math.PI).toFixed(1))
                                        .arg((root._epsEl * 180 / Math.PI).toFixed(1))
            }

            // Lock-strength bar from track_quality (0..255 -> 0..1).
            RowLayout {
                Layout.alignment:   Qt.AlignHCenter
                spacing:            ScreenTools.defaultFontPixelWidth
                visible:            root._dispState !== root._stateAbort

                QGCLabel {
                    text:           qsTr("LOCK")
                    color:          "white"
                    font.pointSize: ScreenTools.smallFontPointSize
                }
                Rectangle {
                    Layout.preferredWidth:  ScreenTools.defaultFontPixelWidth * 12
                    Layout.preferredHeight: ScreenTools.defaultFontPixelHeight * 0.6
                    radius:         2
                    color:          "#22ffffff"
                    border.color:   "white"
                    border.width:   1
                    Rectangle {
                        anchors.left:       parent.left
                        anchors.top:        parent.top
                        anchors.bottom:     parent.bottom
                        anchors.margins:    1
                        width:              Math.max(0, Math.min(1, root._trackQ / 255)) * (parent.width - 2)
                        radius:             2
                        color:              root._trackQ > 170 ? "#43A047"
                                                : root._trackQ > 60 ? "#FDD835" : "#E53935"
                    }
                }
            }
        }
    }
}
