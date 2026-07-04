import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

import QGroundControl
import QGroundControl.Controls

Rectangle {
    id: panel

    property var dropperAction

    width: ScreenTools.defaultFontPixelWidth * 30
    implicitHeight: contentColumn.implicitHeight + (ScreenTools.defaultFontPixelWidth * 1.5)
    color: Qt.rgba(0, 0, 0, 0.86)
    radius: ScreenTools.defaultBorderRadius
    border.color: "#4ADE80"
    border.width: 1

    MessageDialog {
        id: unloadConfirmDialog
        title: qsTr("Unload all payload gates?")
        text: qsTr("This will open all gates and clear the current dropper state. Continue?")
        buttons: MessageDialog.Yes | MessageDialog.No
        onAccepted: dropperAction ? dropperAction._dropperUnloadAll() : undefined
    }

    ColumnLayout {
        id: contentColumn
        anchors.fill: parent
        anchors.margins: ScreenTools.defaultFontPixelWidth * 0.75
        spacing: ScreenTools.defaultFontPixelWidth * 0.45

        QGCLabel {
            text: qsTr("Payload & Camera")
            font.bold: true
            color: "white"
        }

        QGCLabel {
            text: dropperAction ? dropperAction._dropperStatusText : qsTr("Dropper ready")
            color: "#BFDBFE"
            wrapMode: Text.WordWrap
            Layout.fillWidth: true
        }

        RowLayout {
            spacing: ScreenTools.defaultFontPixelWidth * 0.35
            Layout.fillWidth: true

            QGCButton {
                text: qsTr("Load")
                onClicked: dropperAction ? dropperAction._showDropperSection("load") : undefined
            }

            QGCButton {
                text: qsTr("Drop")
                onClicked: dropperAction ? dropperAction._showDropperSection("drop") : undefined
            }

            QGCButton {
                text: qsTr("Camera")
                onClicked: dropperAction ? dropperAction._showDropperSection("camera") : undefined
            }
        }

        Item {
            visible: dropperAction && dropperAction._dropperSection === "load"
            Layout.fillWidth: true
            implicitHeight: loadColumn.implicitHeight

            ColumnLayout {
                id: loadColumn
                anchors.left: parent.left
                anchors.right: parent.right
                spacing: ScreenTools.defaultFontPixelWidth * 0.35

                QGCButton {
                    text: dropperAction && dropperAction._dropperLoadUnlocked ? qsTr("Loading unlocked") : qsTr("Unlock load")
                    enabled: dropperAction && !dropperAction._dropperLoadUnlocked
                    onClicked: dropperAction ? dropperAction._dropperUnlockLoad() : undefined
                }

                QGCButton {
                    text: qsTr("Unload all")
                    enabled: !!dropperAction && !!dropperAction._activeVehicle
                    onClicked: unloadConfirmDialog.open()
                }

                Flow {
                    spacing: ScreenTools.defaultFontPixelWidth * 0.35
                    Layout.fillWidth: true

                    Repeater {
                        model: 4
                        delegate: QGCButton {
                            text: dropperAction && dropperAction._dropperState.loaded[index] ? qsTr("Loaded %1").arg(index + 1) : qsTr("Load %1").arg(index + 1)
                            enabled: dropperAction && dropperAction._dropperLoadUnlocked && dropperAction._dropperCanLoad(index) && !dropperAction._dropperState.loaded[index]
                            onClicked: dropperAction ? dropperAction._dropperLoadPayload(index) : undefined
                        }
                    }
                }
            }
        }

        Item {
            visible: dropperAction && dropperAction._dropperSection === "drop"
            Layout.fillWidth: true
            implicitHeight: dropColumn.implicitHeight

            ColumnLayout {
                id: dropColumn
                anchors.left: parent.left
                anchors.right: parent.right
                spacing: ScreenTools.defaultFontPixelWidth * 0.35

                QGCButton {
                    text: qsTr("Burst")
                    onClicked: dropperAction ? dropperAction._dropperSendBurst() : undefined
                }

                Flow {
                    spacing: ScreenTools.defaultFontPixelWidth * 0.35
                    Layout.fillWidth: true

                    Repeater {
                        model: 4
                        delegate: QGCButton {
                            text: qsTr("PLD %1").arg(index + 1)
                            enabled: dropperAction && !dropperAction._dropperState.dropped[index]
                            onClicked: dropperAction ? dropperAction._dropperSendSingle(index) : undefined
                        }
                    }
                }
            }
        }

        Item {
            visible: dropperAction && dropperAction._dropperSection === "camera"
            Layout.fillWidth: true
            implicitHeight: cameraColumn.implicitHeight

            ColumnLayout {
                id: cameraColumn
                anchors.left: parent.left
                anchors.right: parent.right
                spacing: ScreenTools.defaultFontPixelWidth * 0.35

                GridLayout {
                    columns: 3
                    spacing: ScreenTools.defaultFontPixelWidth * 0.35
                    Layout.fillWidth: true

                    Item { Layout.preferredWidth: parent.width / 3 }

                    QGCButton {
                        text: qsTr("↑")
                        font.pointSize: ScreenTools.defaultFontPointSize * 1.5
                        onClicked: dropperAction ? dropperAction._dropperSendCameraAction("pan-up") : undefined
                        Layout.preferredWidth: parent.width / 3
                    }

                    Item { Layout.preferredWidth: parent.width / 3 }

                    QGCButton {
                        text: qsTr("←")
                        font.pointSize: ScreenTools.defaultFontPointSize * 1.5
                        onClicked: dropperAction ? dropperAction._dropperSendCameraAction("tilt-left") : undefined
                        Layout.preferredWidth: parent.width / 3
                    }

                    QGCButton {
                        text: qsTr("■")
                        font.pointSize: ScreenTools.defaultFontPointSize * 1.5
                        onClicked: dropperAction ? dropperAction._dropperSendCameraAction("stop") : undefined
                        Layout.preferredWidth: parent.width / 3
                    }

                    QGCButton {
                        text: qsTr("→")
                        font.pointSize: ScreenTools.defaultFontPointSize * 1.5
                        onClicked: dropperAction ? dropperAction._dropperSendCameraAction("tilt-right") : undefined
                        Layout.preferredWidth: parent.width / 3
                    }

                    Item { Layout.preferredWidth: parent.width / 3 }

                    QGCButton {
                        text: qsTr("↓")
                        font.pointSize: ScreenTools.defaultFontPointSize * 1.5
                        onClicked: dropperAction ? dropperAction._dropperSendCameraAction("pan-down") : undefined
                        Layout.preferredWidth: parent.width / 3
                    }

                    Item { Layout.preferredWidth: parent.width / 3 }
                }

                RowLayout {
                    spacing: ScreenTools.defaultFontPixelWidth * 0.35
                    Layout.fillWidth: true

                    Item { Layout.preferredWidth: parent.width / 3 }

                    QGCButton {
                        text: qsTr("-")
                        font.pointSize: ScreenTools.defaultFontPointSize * 1.5
                        onClicked: dropperAction ? dropperAction._dropperSendCameraAction("zoom-out") : undefined
                        Layout.preferredWidth: parent.width / 3
                    }

                    QGCButton {
                        text: qsTr("+")
                        font.pointSize: ScreenTools.defaultFontPointSize * 1.5
                        onClicked: dropperAction ? dropperAction._dropperSendCameraAction("zoom-in") : undefined
                        Layout.preferredWidth: parent.width / 3
                    }
                }

                RowLayout {
                    spacing: ScreenTools.defaultFontPixelWidth * 0.35
                    Layout.fillWidth: true

                    QGCButton {
                        text: qsTr("Capture")
                        onClicked: dropperAction ? dropperAction._dropperSendCameraAction("capture") : undefined
                        Layout.preferredWidth: parent.width / 3
                    }

                    QGCButton {
                        text: qsTr("Track")
                        onClicked: dropperAction ? dropperAction._dropperSendCameraAction("track-center") : undefined
                        Layout.preferredWidth: parent.width / 3
                    }

                    QGCButton {
                        text: qsTr("Rec")
                        onClicked: dropperAction ? dropperAction._dropperSendCameraAction("rec-start") : undefined
                        Layout.preferredWidth: parent.width / 3
                    }
                }

                RowLayout {
                    spacing: ScreenTools.defaultFontPixelWidth * 0.35
                    Layout.fillWidth: true

                    QGCButton {
                        text: qsTr("TV")
                        onClicked: dropperAction ? dropperAction._dropperSelectFeed("TV") : undefined
                        Layout.preferredWidth: parent.width / 3
                    }

                    QGCButton {
                        text: qsTr("IR")
                        onClicked: dropperAction ? dropperAction._dropperSelectFeed("IR") : undefined
                        Layout.preferredWidth: parent.width / 3
                    }

                    QGCButton {
                        text: dropperAction && dropperAction._dropperIrFeedActive ? qsTr("IR active") : qsTr("TV active")
                        enabled: false
                        Layout.preferredWidth: parent.width / 3
                    }
                }
            }
        }
    }
}
