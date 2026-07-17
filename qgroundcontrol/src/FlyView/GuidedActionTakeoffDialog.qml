import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

import QGroundControl
import QGroundControl.Controls
import QGroundControl.FlyView

// STRATUM: Modal takeoff dialog. Replaces the inline slide-to-confirm bar for the
// Takeoff command. Captures the desired takeoff altitude and surfaces an explicit
// launch caution, since accepting arms and launches the vehicle.
QGCPopupDialog {
    id:         root
    title:      qsTr("Takeoff")
    buttons:    Dialog.Ok | Dialog.Cancel

    property var    guidedController
    property var    _activeVehicle:     guidedController ? guidedController._activeVehicle : null
    property var    _unitsConversion:   QGroundControl.unitsConversion
    property string _altUnits:          _unitsConversion.appSettingsVerticalDistanceUnitsString
    property real   _minAltitude:       _activeVehicle ? _unitsConversion.metersToAppSettingsVerticalDistanceUnits(_activeVehicle.minimumTakeoffAltitudeMeters()) : 0

    // STRATUM: live echo of the altitude the operator has entered, clamped to the
    // minimum, used by the confirmation sentence below so it always reflects the value
    // that will actually be commanded (matching the onAccepted clamp logic).
    property real   _enteredAltitude: {
        var v = parseFloat(altitudeField.text)
        return (isNaN(v) || v < _minAltitude) ? _minAltitude : v
    }

    QGCPalette { id: qgcPal }

    onAccepted: {
        var altitude = parseFloat(altitudeField.text)
        if (isNaN(altitude) || altitude < root._minAltitude) {
            altitude = root._minAltitude
        }
        // sliderOutputValue is interpreted in app-settings vertical distance units and
        // converted to meters inside executeAction, matching the original slider path.
        guidedController.executeAction(guidedController.actionTakeoff, undefined, altitude, false)
    }

    ColumnLayout {
        spacing: ScreenTools.defaultFontPixelHeight / 2

        QGCLabel {
            Layout.maximumWidth:    ScreenTools.defaultFontPixelWidth * 40
            wrapMode:               Text.WordWrap
            text:                   qsTr("Set the takeoff altitude. The vehicle will climb to this height above its current position.")
        }

        RowLayout {
            spacing: ScreenTools.defaultFontPixelWidth

            QGCLabel { text: qsTr("Takeoff altitude") }

            QGCTextField {
                id:                 altitudeField
                Layout.preferredWidth: ScreenTools.defaultFontPixelWidth * 14
                text:               root._minAltitude.toFixed(1)
                unitsLabel:         root._altUnits
                showUnits:          true
                inputMethodHints:   Qt.ImhFormattedNumbersOnly
            }
        }

        // STRATUM: explicit, live confirmation sentence. Reflects the entered altitude
        // (clamped to the minimum) so the operator sees exactly what will be commanded.
        QGCLabel {
            Layout.maximumWidth:    ScreenTools.defaultFontPixelWidth * 40
            wrapMode:               Text.WordWrap
            font.bold:              true
            text:                   qsTr("Vehicle will take off to %1 %2.")
                                        .arg(root._enteredAltitude.toFixed(1))
                                        .arg(root._altUnits)
        }

        QGCLabel {
            Layout.maximumWidth:    ScreenTools.defaultFontPixelWidth * 40
            wrapMode:               Text.WordWrap
            color:                  qgcPal.warningText
            font.bold:              true
            text:                   qsTr("CAUTION: Pressing OK will launch the vehicle. It will arm (if required) and climb to the altitude above.")
        }
    }
}
