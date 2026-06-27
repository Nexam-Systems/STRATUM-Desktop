import QtQuick
import QtQuick.Layouts

import QGroundControl
import QGroundControl.Controls

// STRATUM: time-to-impact countdown, driven by the ENGAGEMENT_STATUS (42001)
// FactGroup on Vehicle. Self-manages visibility:
//   * shown only while state == DIVE (or RECOVER, as a break-off hint);
//   * valid == 1  -> prominent count, one decimal, interpolated smoothly between the
//                    ~5 Hz vehicle updates so it ticks down rather than stepping;
//   * valid == 0  -> "COMPUTING…" (never a stale or zero number);
//   * stream lost -> "COMPUTING…" too (telemetryAvailable false) -- never a frozen value.
//     STRATUM: this used to read "SIGNAL LOST", which misleadingly implied an RC/datalink
//     dropout; it is only the 42001 status-stream watchdog, so it now falls back to
//     COMPUTING rather than alarming the operator about a link that is in fact up.
// The abort control does NOT depend on any of this; the countdown is display-only.
Item {
    id: root

    // Vehicle.engagementStatus FactGroup, or null when no vehicle / not wired.
    property var engagementStatus

    readonly property bool _hasGroup: !!engagementStatus
    readonly property int  _state:    _hasGroup ? engagementStatus.state.rawValue : 0
    readonly property bool _valid:    _hasGroup ? (engagementStatus.valid.rawValue === 1) : false
    readonly property bool _live:     _hasGroup ? engagementStatus.telemetryAvailable : false
    readonly property real _tti:      _hasGroup ? engagementStatus.timeToImpact.rawValue : NaN
    readonly property real _range:    _hasGroup ? engagementStatus.range.rawValue : NaN
    readonly property real _closing:  _hasGroup ? engagementStatus.closingSpeed.rawValue : NaN

    readonly property int _stateInactive: 0
    readonly property int _stateDive:     1
    readonly property int _stateRecover:  2

    // Display model, recomputed at 10 Hz by the interpolation tick below.
    //   displayMode: 0 = valid count, 1 = computing, 2 = stale, 3 = recover
    property int  displayMode:  1
    property real displayTTI:   NaN

    // Show during the dive, or while recovering (target lost) so the operator still
    // sees what the vehicle is doing. Hidden otherwise.
    visible:        _state === _stateDive || _state === _stateRecover
    implicitWidth:  card.implicitWidth
    implicitHeight: card.implicitHeight

    QGCPalette { id: qgcPal }

    Timer {
        id:         tick
        interval:   100
        repeat:     true
        running:    root.visible

        property double anchorTTI:   NaN     // last value received from the vehicle
        property double anchorMs:    0       // wall-clock when it was received
        property double lastFactTTI: NaN     // detects a fresh vehicle sample

        onTriggered: {
            if (root._state === root._stateRecover) {
                root.displayMode = 3
                return
            }
            if (!root._live) {
                root.displayMode = 1            // STRATUM: stream stale -> "COMPUTING…", not "SIGNAL LOST"
                return
            }
            if (root._valid && !isNaN(root._tti)) {
                if (root._tti !== lastFactTTI) { // new sample -> re-anchor
                    lastFactTTI = root._tti
                    anchorTTI   = root._tti
                    anchorMs    = Date.now()
                }
                var dt = (Date.now() - anchorMs) / 1000.0
                root.displayTTI  = Math.max(0, anchorTTI - dt)
                root.displayMode = 0
            } else {
                root.displayMode = 1            // computing
            }
        }
    }

    Rectangle {
        id:             card
        implicitWidth:  Math.max(contentCol.implicitWidth + ScreenTools.defaultFontPixelWidth * 4,
                                 ScreenTools.defaultFontPixelWidth * 20)
        implicitHeight: contentCol.implicitHeight + ScreenTools.defaultFontPixelHeight
        radius:         ScreenTools.defaultBorderRadius
        color:          root.displayMode === 0 ? "#cc0000" : "#33000000"
        border.color:   "white"
        border.width:   root.displayMode === 0 ? 2 : 1

        ColumnLayout {
            id:                 contentCol
            anchors.centerIn:   parent
            spacing:            0

            QGCLabel {
                Layout.alignment:   Qt.AlignHCenter
                text:               qsTr("TIME TO IMPACT")
                color:              "white"
                font.bold:          true
                font.pointSize:     ScreenTools.smallFontPointSize
                visible:            root.displayMode === 0
            }

            QGCLabel {
                Layout.alignment:   Qt.AlignHCenter
                color:              "white"
                font.bold:          true
                font.pointSize:     ScreenTools.largeFontPointSize
                text: {
                    switch (root.displayMode) {
                    case 0:  return root.displayTTI.toFixed(1) + qsTr(" s")
                    case 1:  return qsTr("COMPUTING…")
                    case 2:  return qsTr("COMPUTING…")   // STRATUM: was "SIGNAL LOST" (misleading); kept for safety, never set
                    case 3:  return qsTr("TARGET LOST — RECOVERING")
                    default: return ""
                    }
                }
            }

            // Secondary readouts, only meaningful with a valid estimate.
            QGCLabel {
                Layout.alignment:   Qt.AlignHCenter
                color:              "white"
                font.pointSize:     ScreenTools.smallFontPointSize
                visible:            root.displayMode === 0 && !isNaN(root._range) && !isNaN(root._closing)
                text:               qsTr("range %1 m   closing %2 m/s")
                                        .arg(isNaN(root._range)   ? "—" : root._range.toFixed(0))
                                        .arg(isNaN(root._closing) ? "—" : root._closing.toFixed(1))
            }
        }
    }
}
