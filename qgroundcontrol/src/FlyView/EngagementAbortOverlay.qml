import QtQuick
import QtQuick.Layouts

import QGroundControl
import QGroundControl.Controls

// STRATUM: engagement status + abort overlay.
//
// Top-centre overlay that owns the operator-facing half of the safety loop during a
// terminal engagement:
//   * the blinking ENGAGING! banner (unchanged behaviour, now co-located with abort);
//   * a prominent HOLD-TO-ABORT control -- a deliberate hold so it cannot fire by
//     accident, but fast enough to use under time pressure;
//   * a slot for the time-to-impact countdown, driven by ENGAGEMENT_STATUS (42001).
//
// The abort control is intentionally NOT gated on a valid time-to-impact estimate:
// abort must work even while the countdown reads "computing". The countdown numbers
// are wired once the ENGAGEMENT_STATUS FactGroup lands on Vehicle.
Item {
    id: root

    property var  engagementController
    property real topMargin: 0

    property var  _activeVehicle: QGroundControl.multiVehicleManager.activeVehicle

    readonly property bool _engaged:  !!engagementController && engagementController.engaged
    readonly property bool _aborting:
        !!_activeVehicle && !!engagementController &&
        _activeVehicle.flightMode === engagementController.abortModeName

    // Live engagement state from ENGAGEMENT_STATUS (42001): 1 = DIVE, 2 = RECOVER.
    readonly property var  _es:       _activeVehicle ? _activeVehicle.engagementStatus : null
    readonly property int  _esState:  _es ? _es.state.rawValue : 0
    readonly property bool _diving:   _esState === 1
    readonly property bool _recover:  _esState === 2

    // Abort is offered whenever the engagement is live -- contract gate "state == DIVE
    // or mode == Engagement" -- and also during RECOVER, where the operator may still
    // command abort to choose the recovery point. Never depends on a valid estimate.
    readonly property bool _abortEnabled: _engaged || _diving || _recover

    visible:                    _engaged || _aborting || _diving || _recover
    implicitWidth:              panel.implicitWidth
    implicitHeight:             panel.implicitHeight
    anchors.horizontalCenter:   parent.horizontalCenter
    anchors.top:                parent.top
    anchors.topMargin:          topMargin
    z:                          QGroundControl.zOrderTopMost

    QGCPalette { id: qgcPal }

    ColumnLayout {
        id:         panel
        spacing:    ScreenTools.defaultFontPixelHeight * 0.5

        // Blinking ENGAGING! banner -- shown while in the engagement dive.
        Rectangle {
            id:                 engagingBanner
            Layout.alignment:   Qt.AlignHCenter
            visible:            root._engaged
            implicitWidth:      engagingLabel.contentWidth + (ScreenTools.defaultFontPixelWidth * 4)
            implicitHeight:     engagingLabel.contentHeight + (ScreenTools.defaultFontPixelWidth * 2)
            radius:             ScreenTools.defaultBorderRadius
            color:              "#cc0000"
            border.color:       "white"
            border.width:       2

            QGCLabel {
                id:                 engagingLabel
                anchors.centerIn:   parent
                text:               qsTr("ENGAGING!")
                color:              "white"
                font.bold:          true
                font.pointSize:     ScreenTools.largeFontPointSize
            }

            SequentialAnimation on opacity {
                running:    engagingBanner.visible
                loops:      Animation.Infinite
                NumberAnimation { from: 1.0;  to: 0.25; duration: 450 }
                NumberAnimation { from: 0.25; to: 1.0;  duration: 450 }
            }
        }

        // Countdown readout. Sits directly under the banner and above the abort control.
        // Self-manages visibility (shown only while diving / recovering) so it is left
        // to bind its own `visible`; do not override it here.
        EngagementCountdown {
            Layout.alignment:   Qt.AlignHCenter
            engagementStatus:   root._activeVehicle ? root._activeVehicle.engagementStatus : null
        }

        // HOLD-TO-ABORT control. Deliberate hold-to-fire (QGCDelayButton) so it cannot
        // be triggered accidentally; on completion it commands DO_SET_MODE(sub=22).
        QGCDelayButton {
            id:                 abortButton
            Layout.alignment:   Qt.AlignHCenter
            visible:            root._abortEnabled
            text:               qsTr("HOLD TO ABORT")
            onActivated: {
                if (root.engagementController) {
                    root.engagementController.abort()
                }
            }
        }

        // Recovery confirmation strip, shown once the vehicle is in Abort mode.
        Rectangle {
            Layout.alignment:   Qt.AlignHCenter
            visible:            root._aborting && !root._engaged
            implicitWidth:      abortingLabel.contentWidth + (ScreenTools.defaultFontPixelWidth * 4)
            implicitHeight:     abortingLabel.contentHeight + (ScreenTools.defaultFontPixelWidth * 2)
            radius:             ScreenTools.defaultBorderRadius
            color:              "#1E88E5"
            border.color:       "white"
            border.width:       2

            QGCLabel {
                id:                 abortingLabel
                anchors.centerIn:   parent
                text:               qsTr("ABORTING — RECOVERING")
                color:              "white"
                font.bold:          true
                font.pointSize:     ScreenTools.mediumFontPointSize
            }
        }
    }
}
