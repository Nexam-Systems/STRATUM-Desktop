import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

import QGroundControl
import QGroundControl.Controls
import QGroundControl.FlyView

// STRATUM: Standoff parameter entry. Captures the geometry of a standoff relative to
// a clicked target: how far from it the vehicle holds (distance), how high above it
// (height), and from which compass bearing it approaches and faces it (angle). These
// are, geometrically, the same parameters an orbit is built from.
QGCPopupDialog {
    id:         root
    title:      qsTr("Standoff Here")
    buttons:    Dialog.Ok | Dialog.Cancel

    property var    standoffController
    property var    _unitsConversion:   QGroundControl.unitsConversion
    property string _horizUnits:        _unitsConversion.appSettingsHorizontalDistanceUnitsString
    property string _vertUnits:         _unitsConversion.appSettingsVerticalDistanceUnitsString

    QGCPalette { id: qgcPal }

    onAccepted: {
        var distance = parseFloat(distanceField.text)
        var height   = parseFloat(heightField.text)
        var angle    = parseFloat(angleField.text)
        if (isNaN(distance) || distance <= 0) { distance = 0 }
        if (isNaN(height))                     { height   = 0 }
        if (isNaN(angle))                      { angle    = 0 }
        // Normalize bearing into [0, 360)
        angle = ((angle % 360) + 360) % 360
        standoffController.beginStandoff(distance, height, angle)
    }

    GridLayout {
        columns:        2
        columnSpacing:  ScreenTools.defaultFontPixelWidth
        rowSpacing:     ScreenTools.defaultFontPixelHeight / 2

        QGCLabel {
            Layout.columnSpan:      2
            Layout.maximumWidth:    ScreenTools.defaultFontPixelWidth * 44
            wrapMode:               Text.WordWrap
            text:                   qsTr("The vehicle will hold at the standoff distance from the target, at the standoff height, on the bearing given by the standoff angle, facing the target.")
        }

        QGCLabel { text: qsTr("Standoff distance") }
        QGCTextField {
            id:                 distanceField
            Layout.preferredWidth: ScreenTools.defaultFontPixelWidth * 14
            text:               "50"
            unitsLabel:         root._horizUnits
            showUnits:          true
            inputMethodHints:   Qt.ImhFormattedNumbersOnly
        }

        QGCLabel { text: qsTr("Standoff height") }
        QGCTextField {
            id:                 heightField
            Layout.preferredWidth: ScreenTools.defaultFontPixelWidth * 14
            text:               "30"
            unitsLabel:         root._vertUnits
            showUnits:          true
            inputMethodHints:   Qt.ImhFormattedNumbersOnly
        }

        QGCLabel { text: qsTr("Standoff angle") }
        QGCTextField {
            id:                 angleField
            Layout.preferredWidth: ScreenTools.defaultFontPixelWidth * 14
            text:               "0"
            unitsLabel:         qsTr("deg (from N)")
            showUnits:          true
            inputMethodHints:   Qt.ImhFormattedNumbersOnly
        }
    }
}
