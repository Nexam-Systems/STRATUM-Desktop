import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

import QGroundControl
import QGroundControl.Controls
import QGroundControl.FlyView

// STRATUM: Shown once the vehicle reaches the standoff point. Offers to convert the
// static standoff hold into an orbit around the same target, reusing the standoff
// distance as the orbit radius and the standoff height as the orbit altitude.
QGCPopupDialog {
    id:         root
    title:      qsTr("Standoff Reached")
    buttons:    Dialog.Yes | Dialog.No

    property var standoffController

    onAccepted: standoffController.confirmOrbit()   // Yes
    onRejected: standoffController.cancelStandoff()  // No

    ColumnLayout {
        spacing: ScreenTools.defaultFontPixelHeight / 2

        QGCLabel {
            Layout.maximumWidth:    ScreenTools.defaultFontPixelWidth * 40
            wrapMode:               Text.WordWrap
            text:                   qsTr("The vehicle has reached the standoff point. Continue to orbit around the standoff target?")
        }
    }
}
