import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

import QGroundControl
import QGroundControl.Controls
import QGroundControl.FlyView

Item {
    required property var guidedValueSlider

    id:     control
    width:  parent.width
    height: ScreenTools.toolbarHeight

    property var    _activeVehicle:     QGroundControl.multiVehicleManager.activeVehicle
    property bool   _communicationLost: _activeVehicle ? _activeVehicle.vehicleLinkManager.communicationLost : false
    property real   _leftRightMargin:   ScreenTools.defaultFontPixelWidth * 0.75
    property var    _guidedController:  globals.guidedControllerFlyView

    // STRATUM: solid ribbon colour reflects operational state. Kept in lock-step with
    // FlyViewToolStrip.qml and FlightMap/MapItems/VehicleMapItem.qml.
    readonly property string _abortModeName:      qsTr("Abort")
    readonly property string _engagementModeName: qsTr("Engagement")
    readonly property string _holdModeName:       _activeVehicle ? _activeVehicle.pauseFlightMode : qsTr("Hold")
    property color _ribbonColor: {
        if (!_activeVehicle) {
            return qgcPal.brandingPurple
        }
        if (_communicationLost) {
            return "#D32F2F"
        }
        var mode = _activeVehicle.flightMode
        if (mode === _abortModeName) {
            return "#FF8F00"
        }
        if (mode === _engagementModeName) {
            return "#D32F2F"
        }
        if (mode === qsTr("Standoff") || mode === qsTr("Takeoff") || mode === _holdModeName || _activeVehicle.flying) {
            return "#43A047"
        }
        return "#1E88E5"
    }
    readonly property color _ribbonTextColor: "#FFFFFF"

    function dropMainStatusIndicatorTool() {
        mainStatusIndicator.dropMainStatusIndicator();
    }

    QGCPalette { id: qgcPal }

    Rectangle {
        anchors.fill:   parent
        color:          _ribbonColor
    }

    QGCFlickable {
        anchors.fill:       parent
        contentWidth:       toolBarLayout.width
        flickableDirection: Flickable.HorizontalFlick

        Row {
            id:         toolBarLayout
            height:     parent.height
            spacing:    0

            Item {
                id:     leftPanel
                width:  leftPanelLayout.implicitWidth
                height: parent.height

                RowLayout {
                    id:         leftPanelLayout
                    height:     parent.height
                    spacing:    ScreenTools.defaultFontPixelWidth * 2

                    RowLayout {
                        id:         mainStatusLayout
                        height:     parent.height
                        spacing:    0

                        QGCToolBarButton {
                            id:                 qgcButton
                            objectName:         "toolbar_qgcLogo"
                            Layout.fillHeight:  true
                            // STRATUM: NEXAM (NX) company mark on the left.
                            icon.source:        "/res/NXLogo.svg"
                            logo:               true
                            onClicked:          mainWindow.showToolSelectDialog()
                        }

                        MainStatusIndicator {
                            id:                 mainStatusIndicator
                            objectName:         "toolbar_mainStatusIndicator"
                            Layout.fillHeight:  true
                            ribbonTextColor:    _ribbonTextColor
                        }
                    }

                    QGCButton {
                        id:         disconnectButton
                        text:       qsTr("Disconnect")
                        onClicked:  _activeVehicle.closeVehicle()
                        visible:    _activeVehicle && _communicationLost
                    }

                    FlightModeIndicator {
                        objectName:         "toolbar_flightModeIndicator"
                        Layout.fillHeight:  true
                        visible:            _activeVehicle
                    }
                }
            }
            Item {
                id:     centerPanel
                // STRATUM: the guided-action confirm bar was relocated to the bottom edge
                // (see FlyView.qml). The center panel now simply spans the remaining width.
                width:  Math.max(0, control.width - (leftPanel.width + rightPanel.width))
                height: parent.height
            }

            Item {
                id:     rightPanel
                width:  flyViewIndicators.width
                height: parent.height

                FlyViewToolBarIndicators {
                    id:                 flyViewIndicators
                    height:             parent.height
                    ribbonTextColor:    _ribbonTextColor
                }
            }
        }
    }

    // STRATUM: the guided-action confirm bar and its message display were moved to the
    // bottom edge of the fly view. See FlyView.qml (guidedActionConfirmBottomBar).

    ParameterDownloadProgress {
        anchors.fill: parent
    }
}
