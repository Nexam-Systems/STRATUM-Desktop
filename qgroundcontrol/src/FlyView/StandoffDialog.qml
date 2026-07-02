import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import QtPositioning

import QGroundControl
import QGroundControl.Controls
import QGroundControl.FlyView

// STRATUM: Standoff parameter entry. Captures the geometry of a standoff relative to
// a clicked target: how far from it the vehicle holds (distance), how high above it
// (height), and from which compass bearing it approaches and faces it (angle). These
// are, geometrically, the same parameters an orbit is built from. The target lat/lon
// pre-fills from the map click but is editable, letting the operator refine or replace
// the clicked coordinate with a known-precise one.
QGCPopupDialog {
    id:         root
    title:      qsTr("Standoff Here")
    buttons:    Dialog.Ok | Dialog.Cancel

    property var    standoffController
    property var    _unitsConversion:   QGroundControl.unitsConversion
    property string _horizUnits:        _unitsConversion.appSettingsHorizontalDistanceUnitsString
    property string _vertUnits:         _unitsConversion.appSettingsVerticalDistanceUnitsString
    // Clicked target coordinate; seeds the editable lat/lon fields below.
    property var    _clickedTarget:     standoffController ? standoffController._targetCoordinate : QtPositioning.coordinate()

    QGCPalette { id: qgcPal }

    onAccepted: {
        var distance = parseFloat(distanceField.text)
        var height   = parseFloat(heightField.text)
        var angle    = parseFloat(angleField.text)
        var lat      = parseFloat(latField.text)
        var lon      = parseFloat(lonField.text)
        if (isNaN(distance) || distance <= 0) { distance = 0 }
        if (isNaN(height))                     { height   = 0 }
        if (isNaN(angle))                      { angle    = 0 }
        // Normalize bearing into [0, 360)
        angle = ((angle % 360) + 360) % 360
        // Operator-entered lat/lon overrides the clicked target. Invalid or
        // out-of-range values fall back to the original map click.
        var target = _clickedTarget
        if (!isNaN(lat) && !isNaN(lon) && Math.abs(lat) <= 90 && Math.abs(lon) <= 180) {
            target = QtPositioning.coordinate(lat, lon)
        }
        standoffController.beginStandoff(distance, height, angle, target)
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

        QGCLabel { text: qsTr("Target latitude") }
        QGCTextField {
            id:                 latField
            Layout.preferredWidth: ScreenTools.defaultFontPixelWidth * 14
            text:               _clickedTarget.isValid ? _clickedTarget.latitude.toFixed(7) : ""
            unitsLabel:         qsTr("deg")
            showUnits:          true
            inputMethodHints:   Qt.ImhFormattedNumbersOnly
        }

        QGCLabel { text: qsTr("Target longitude") }
        QGCTextField {
            id:                 lonField
            Layout.preferredWidth: ScreenTools.defaultFontPixelWidth * 14
            text:               _clickedTarget.isValid ? _clickedTarget.longitude.toFixed(7) : ""
            unitsLabel:         qsTr("deg")
            showUnits:          true
            inputMethodHints:   Qt.ImhFormattedNumbersOnly
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
