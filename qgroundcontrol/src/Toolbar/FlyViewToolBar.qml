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
    property color  _mainStatusBGColor: qgcPal.brandingPurple
    property real   _leftRightMargin:   ScreenTools.defaultFontPixelWidth * 0.75
    property var    _guidedController:  globals.guidedControllerFlyView

    function dropMainStatusIndicatorTool() {
        mainStatusIndicator.dropMainStatusIndicator();
    }

    QGCPalette { id: qgcPal }

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

                // Gradient background behind Q button and main status indicator
                Rectangle {
                    id:         gradientBackground
                    height:     parent.height
                    width:      mainStatusLayout.width
                    opacity:    qgcPal.windowTransparent.a

                    gradient: Gradient {
                        orientation: Gradient.Horizontal
                        GradientStop { position: 0; color: _mainStatusBGColor }
                        //GradientStop { position: qgcButton.x + qgcButton.width; color: _mainStatusBGColor }
                        GradientStop { position: 1; color: qgcPal.window }
                    }
                }

                // Standard toolbar background to the right of the gradient
                Rectangle {
                    anchors.left:   gradientBackground.right
                    anchors.right:  parent.right
                    height:         parent.height
                    color:          qgcPal.windowTransparent
                }

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
                            icon.source:        "/res/QGCLogoFull.svg"
                            logo:               true
                            onClicked:          mainWindow.showToolSelectDialog()
                        }

                        MainStatusIndicator {
                            id:                 mainStatusIndicator
                            objectName:         "toolbar_mainStatusIndicator"
                            Layout.fillHeight:  true
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

                Rectangle {
                    anchors.fill:   parent
                    color:          qgcPal.windowTransparent
                }
            }

            Item {
                id:     rightPanel
                width:  flyViewIndicators.width
                height: parent.height

                Rectangle {
                    anchors.fill:   parent
                    color:          qgcPal.windowTransparent
                }

                FlyViewToolBarIndicators {
                    id:     flyViewIndicators
                    height: parent.height
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
