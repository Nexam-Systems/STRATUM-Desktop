import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

import QGroundControl
import QGroundControl.Controls
import QGroundControl.FlyView

// STRATUM: Engage (terminal dive) parameter entry. The operator sets the dive angle;
// on accept the vehicle repositions to the distance that yields that angle for the
// current standoff height (D = height / tan(angle)), then dives onto the target to
// 0 altitude. Requires an active standoff (the target and height come from it).
QGCPopupDialog {
    id:         root
    title:      qsTr("Engage")
    buttons:    Dialog.Ok | Dialog.Cancel

    property var    standoffController

    readonly property real _minAngle:    30
    readonly property real _maxAngle:    60
    property bool   _hasStandoff:        standoffController ? standoffController._standoffActive : false
    property real   _height:             standoffController ? standoffController._standoffHeight : 0

    QGCPalette { id: qgcPal }

    function _angle()  { return parseFloat(angleField.text) }

    function _validationError() {
        if (!_hasStandoff) {
            return qsTr("Set a standoff (target) first, then Engage.")
        }
        if (_height <= 0) {
            return qsTr("Standoff height must be greater than zero to dive.")
        }
        var a = _angle()
        if (isNaN(a) || a < _minAngle || a > _maxAngle) {
            return qsTr("Engagement angle must be between %1° and %2° (steeper than %2° would require an unsafe dive).").arg(_minAngle).arg(_maxAngle)
        }
        return ""
    }

    onAccepted: {
        var err = _validationError()
        if (err !== "") {
            warningLabel.text = err
            preventClose = true   // keep the dialog open so the operator can correct
            return
        }
        standoffController.beginEngage(_angle())
    }

    ColumnLayout {
        spacing: ScreenTools.defaultFontPixelHeight / 2

        QGCLabel {
            Layout.maximumWidth:    ScreenTools.defaultFontPixelWidth * 44
            wrapMode:               Text.WordWrap
            text:                   qsTr("Dive angle, 30° to 60°. The vehicle repositions to the distance that produces this angle for the current standoff height, then dives onto the target.")
        }

        RowLayout {
            spacing: ScreenTools.defaultFontPixelWidth
            QGCLabel { text: qsTr("Engagement angle") }
            QGCTextField {
                id:                 angleField
                Layout.preferredWidth: ScreenTools.defaultFontPixelWidth * 12
                text:               "45"
                unitsLabel:         qsTr("deg")
                showUnits:          true
                inputMethodHints:   Qt.ImhFormattedNumbersOnly
            }
        }

        QGCLabel {
            id:                     warningLabel
            Layout.maximumWidth:    ScreenTools.defaultFontPixelWidth * 44
            wrapMode:               Text.WordWrap
            color:                  qgcPal.warningText
            visible:                text !== ""
            text:                   ""
        }

        QGCLabel {
            Layout.maximumWidth:    ScreenTools.defaultFontPixelWidth * 44
            wrapMode:               Text.WordWrap
            color:                  qgcPal.warningText
            font.bold:              true
            text:                   qsTr("CAUTION: OK commits the vehicle to a terminal dive onto the target at ground level.")
        }
    }
}
