import QtQuick
import QtQuick.Layouts

import QGroundControl
import QGroundControl.Controls

// STRATUM — On-Screen Display (OSD) overlay for the video streamer.
// Renders all primary flight parameters directly over the live video,
// grouped FPV/HUD-style into the screen corners. This control is purely
// passive: it draws telemetry, it does not capture input, so the existing
// gimbal / tracking MouseArea beneath it keeps working.
Item {
    id: _root

    anchors.fill: parent

    // Drawn but never interactive — let clicks/drags fall through to the video controls.
    enabled: false

    property var _activeVehicle:    QGroundControl.multiVehicleManager.activeVehicle
    property bool _hasVehicle:      _activeVehicle !== null

    // Smaller readouts when the video is running in the picture-in-picture corner.
    property bool   compact:        false
    readonly property real _fontPt: compact ? ScreenTools.smallFontPointSize : ScreenTools.defaultFontPointSize
    readonly property real _margin: ScreenTools.defaultFontPixelHeight * (compact ? 0.5 : 1.0)
    readonly property string _noVal: "--"

    visible: _hasVehicle && QGroundControl.videoManager.hasVideo

    // ---- One labelled readout (LABEL on top, big value + units below) -------
    component OSDField : ColumnLayout {
        property string label:  ""
        property string value:  _root._noVal
        property string units:  ""
        property int    align:  Text.AlignLeft
        spacing: 0

        Text {
            text:                   label
            color:                  "#cfd8dc"
            style:                  Text.Outline
            styleColor:             "#000000"
            font.pointSize:         _root._fontPt * 0.78
            font.family:            ScreenTools.normalFontFamily
            font.letterSpacing:     1
            horizontalAlignment:    parent.align
            Layout.fillWidth:       true
            visible:                label !== ""
        }
        Text {
            text:                   units === "" ? value : (value + " " + units)
            color:                  "#ffffff"
            style:                  Text.Outline
            styleColor:             "#000000"
            font.pointSize:         _root._fontPt * 1.15
            font.bold:              true
            font.family:            ScreenTools.fixedFontFamily
            horizontalAlignment:    parent.align
            Layout.fillWidth:       true
        }
    }

    // ---- Battery (read from the lowest battery, mirrors BatteryIndicator) ----
    property var _battery: (_hasVehicle && _activeVehicle.batteries.count > 0) ? _activeVehicle.batteries.get(0) : null

    // ===================== TOP-LEFT : status =================================
    ColumnLayout {
        anchors.left:       parent.left
        anchors.top:        parent.top
        anchors.margins:    _margin
        spacing:            _margin * 0.5

        OSDField {
            label: qsTr("MODE")
            value: _hasVehicle ? _activeVehicle.flightMode : _noVal
        }
        OSDField {
            label: qsTr("ARMED")
            value: _hasVehicle ? (_activeVehicle.armed ? qsTr("ARMED") : qsTr("DISARMED")) : _noVal
        }
    }

    // ===================== TOP-RIGHT : links / GPS ===========================
    ColumnLayout {
        anchors.right:      parent.right
        anchors.top:        parent.top
        anchors.margins:    _margin
        spacing:            _margin * 0.5

        OSDField {
            align: Text.AlignRight
            label: qsTr("GPS SATS")
            value: _hasVehicle ? _activeVehicle.gps.count.valueString : _noVal
        }
        OSDField {
            align: Text.AlignRight
            label: qsTr("HDOP")
            value: _hasVehicle ? _activeVehicle.gps.hdop.valueString : _noVal
        }
        OSDField {
            align: Text.AlignRight
            label: qsTr("RC RSSI")
            value: _hasVehicle ? _activeVehicle.rcRSSI.valueString : _noVal
            units: "%"
        }
    }

    // ===================== TOP-CENTER : heading ==============================
    OSDField {
        anchors.horizontalCenter:   parent.horizontalCenter
        anchors.top:                parent.top
        anchors.topMargin:          _margin
        align:                      Text.AlignHCenter
        label:                      qsTr("HDG")
        value:                      _hasVehicle ? _activeVehicle.heading.valueString : _noVal
        units:                      "°"
    }

    // ===================== LEFT-CENTER : speeds ==============================
    ColumnLayout {
        anchors.left:               parent.left
        anchors.verticalCenter:     parent.verticalCenter
        anchors.margins:            _margin
        spacing:                    _margin * 0.5

        OSDField {
            label: qsTr("GND SPD")
            value: _hasVehicle ? _activeVehicle.groundSpeed.valueString : _noVal
            units: _hasVehicle ? _activeVehicle.groundSpeed.units : ""
        }
        OSDField {
            label: qsTr("AIR SPD")
            value: _hasVehicle ? _activeVehicle.airSpeed.valueString : _noVal
            units: _hasVehicle ? _activeVehicle.airSpeed.units : ""
        }
        OSDField {
            label: qsTr("THR")
            value: _hasVehicle ? _activeVehicle.throttlePct.valueString : _noVal
            units: "%"
        }
    }

    // ===================== RIGHT-CENTER : altitude ===========================
    ColumnLayout {
        anchors.right:              parent.right
        anchors.verticalCenter:     parent.verticalCenter
        anchors.margins:            _margin
        spacing:                    _margin * 0.5

        OSDField {
            align: Text.AlignRight
            label: qsTr("ALT REL")
            value: _hasVehicle ? _activeVehicle.altitudeRelative.valueString : _noVal
            units: _hasVehicle ? _activeVehicle.altitudeRelative.units : ""
        }
        OSDField {
            align: Text.AlignRight
            label: qsTr("ALT AMSL")
            value: _hasVehicle ? _activeVehicle.altitudeAMSL.valueString : _noVal
            units: _hasVehicle ? _activeVehicle.altitudeAMSL.units : ""
        }
        OSDField {
            align: Text.AlignRight
            label: qsTr("CLIMB")
            value: _hasVehicle ? _activeVehicle.climbRate.valueString : _noVal
            units: _hasVehicle ? _activeVehicle.climbRate.units : ""
        }
    }

    // ===================== BOTTOM-LEFT : battery =============================
    ColumnLayout {
        anchors.left:       parent.left
        anchors.bottom:     parent.bottom
        anchors.margins:    _margin
        spacing:            _margin * 0.5

        OSDField {
            label: qsTr("BATT")
            value: _battery ? _battery.percentRemaining.valueString : _noVal
            units: "%"
        }
        OSDField {
            label: qsTr("VOLTAGE")
            value: _battery ? _battery.voltage.valueString : _noVal
            units: _battery ? _battery.voltage.units : ""
        }
        OSDField {
            label: qsTr("CURRENT")
            value: _battery ? _battery.current.valueString : _noVal
            units: _battery ? _battery.current.units : ""
        }
    }

    // ===================== BOTTOM-CENTER : nav / time ========================
    RowLayout {
        anchors.horizontalCenter:   parent.horizontalCenter
        anchors.bottom:             parent.bottom
        anchors.margins:            _margin
        spacing:                    _margin * 1.5

        OSDField {
            align: Text.AlignHCenter
            label: qsTr("DIST HOME")
            value: _hasVehicle ? _activeVehicle.distanceToHome.valueString : _noVal
            units: _hasVehicle ? _activeVehicle.distanceToHome.units : ""
        }
        OSDField {
            align: Text.AlignHCenter
            label: qsTr("FLIGHT TIME")
            value: _hasVehicle ? _activeVehicle.flightTime.valueString : _noVal
        }
        OSDField {
            align: Text.AlignHCenter
            label: qsTr("FLIGHT DIST")
            value: _hasVehicle ? _activeVehicle.flightDistance.valueString : _noVal
            units: _hasVehicle ? _activeVehicle.flightDistance.units : ""
        }
    }

    // ===================== BOTTOM-RIGHT : attitude / next WP ==================
    ColumnLayout {
        anchors.right:      parent.right
        anchors.bottom:     parent.bottom
        anchors.margins:    _margin
        spacing:            _margin * 0.5

        OSDField {
            align: Text.AlignRight
            label: qsTr("ROLL")
            value: _hasVehicle ? _activeVehicle.roll.valueString : _noVal
            units: "°"
        }
        OSDField {
            align: Text.AlignRight
            label: qsTr("PITCH")
            value: _hasVehicle ? _activeVehicle.pitch.valueString : _noVal
            units: "°"
        }
        OSDField {
            align: Text.AlignRight
            label: qsTr("DIST WP")
            value: _hasVehicle ? _activeVehicle.distanceToNextWP.valueString : _noVal
            units: _hasVehicle ? _activeVehicle.distanceToNextWP.units : ""
        }
    }
}
                                  