import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0

Rectangle {
    id: root
    anchors.fill: parent
    color: Style.isDark ? Style.lightblack : Style.lightwhite

    property int selectedHeadlight: 0
    property int selectedFrontFog: 0
    property int selectedRearFog: 0
    property int selectedDome: 0

    Rectangle {
        id: lights
        width: parent.width * 0.95
        height: parent.height * 0.95
        color: Style.isDark ? Style.lightblack : Style.lightwhite
        anchors.centerIn: parent

        ColumnLayout {
            anchors.fill: parent
            spacing: 8

            Text {
                text: "Headlights"
                font.bold: true
                font.pixelSize: lights.height * 0.03
                color: Style.isDark ? Style.white : Style.black
            }

            // Headlight Selector
            Rectangle {
                width: (lights.width / 6) * 4 + 6
                height: lights.height / 12 + 4
                radius: 5
                color: Style.isDark ? Style.sblack : Style.swhite
                border.color: "grey"
                border.width: 1
                 clip: true

                Row {
                    anchors.fill: parent
                    anchors.margins: 2
                    spacing: 2

                    Repeater {
                        model: ListModel {
                            ListElement { label: "Off" }
                            ListElement { label: "High beam" }
                            ListElement { label: "lowbeam" }
                            ListElement { label: "Auto" }
                        }

                        Rectangle {
                            width: lights.width / 7
                            height: lights.height / 12
                            color: index === root.selectedHeadlight
                                ? (Style.isDark ? "black" : "white")
                                : "transparent"
                            radius: 5

                            Text {
                                anchors.centerIn: parent
                                text: model.label
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.WordWrap
                                font.pixelSize: parent.height / 4
                                color: index === root.selectedHeadlight
                                       ? (Style.isDark ? "white" : "black")
                                       : (Style.isDark ? "white" : "black")  // Default color
                                font.bold: index === root.selectedHeadlight
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: root.selectedHeadlight = index
                            }
                        }
                    }
                }
            }

            // Front Fog & Rear Fog
            RowLayout {
                spacing: 20

                // Front Fog
                Rectangle {
                    width: (lights.width / 7) * 2 + 6
                    height: lights.height / 12 + 4
                    radius: 5
                    color: Style.isDark ? Style.sblack : Style.swhite
                    border.color: "grey"
                    border.width: 1

                    Row {
                        anchors.fill: parent
                        anchors.margins: 2
                        spacing: 2

                        Repeater {
                            model: ListModel {
                                ListElement { label: "Off" }
                                ListElement { label: "Front Fog" }
                            }

                            Rectangle {
                                width: lights.width / 7
                                height: lights.height / 12
                                color: index === root.selectedFrontFog
                                    ? (Style.isDark ? "black" : "white")
                                    : "transparent"
                                radius: 5

                                Text {
                                    anchors.centerIn: parent
                                    text: model.label
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: parent.height / 4
                                    color: index === root.selectedFrontFog
                                           ? (Style.isDark ? "white" : "black")
                                           : (Style.isDark ? "white" : "black")  // Default color
                                    font.bold: index === root.selectedFrontFog
                                }


                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: root.selectedFrontFog = index
                                }
                            }
                        }
                    }
                }

                // Rear Fog
                Rectangle {
                    width: (lights.width / 7) * 2 + 6
                    height: lights.height / 12 + 4
                    radius: 5
                    color: Style.isDark ? Style.sblack : Style.swhite
                    border.color: "grey"
                    border.width: 1

                    Row {
                        anchors.fill: parent
                        anchors.margins: 2
                        spacing: 2

                        Repeater {
                            model: ListModel {
                                ListElement { label: "Off" }
                                ListElement { label: "Front Fog" }
                            }

                            Rectangle {
                                width: lights.width / 7
                                height: lights.height / 12
                                color: index === root.selectedRearFog
                                    ? (Style.isDark ? "black" : "white")
                                    : "transparent"
                                radius: 5

                                Text {
                                    anchors.centerIn: parent
                                    text: model.label
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.WordWrap
                                    font.pixelSize: parent.height / 4
                                    color: index === root.selectedRearFog
                                           ? (Style.isDark ? "white" : "black")
                                           : (Style.isDark ? "white" : "black")  // Default color
                                    font.bold: index === root.selectedRearFog
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: root.selectedRearFog = index
                                }
                            }
                        }
                    }
                }
            }

            Text {
                text: "Dome Lights"
                font.bold: true
                font.pixelSize: lights.height * 0.02
                color: Style.isDark ? Style.white : Style.black
            }

            // Dome Selector
            Rectangle {
                width: (lights.width / 6) * 3 + 6
                height: lights.height / 12 + 4
                radius: 5
                color: Style.isDark ? Style.sblack : Style.swhite
                border.color: "grey"
                border.width: 1


                Row {
                    anchors.fill: parent
                    anchors.margins: 2
                    spacing: 2

                    Repeater {
                        model: ListModel {
                            ListElement { label: "Off" }
                            ListElement { label: "On" }
                            ListElement { label: "Auto" }
                        }

                        Rectangle {
                            width: ((lights.width / 6) * 3 + 6 - 8) / 3
                            height: parent.height
                            color: index === root.selectedDome
                                ? (Style.isDark ? "black" : "white")
                                : "transparent"
                            radius: 5

                            Text {
                                anchors.centerIn: parent
                                text: model.label
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.WordWrap
                                font.pixelSize: parent.height / 4
                                color: index ===  root.selectedDome
                                       ? (Style.isDark ? "white" : "black")
                                       : (Style.isDark ? "white" : "black")  // Default color
                                font.bold: index ===  root.selectedDome
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: root.selectedDome = index
                            }
                        }
                    }
                }
            }

            Rectangle {
                width: lights.width / 5
                height: lights.height / 12
                color: "#007bff"
                radius: 5

                Text {
                    id: name
                    text: qsTr("Ambient Lights")
                    anchors.centerIn: parent
                    font.pixelSize: parent.height / 4
                    color: "white"
                }
            }

            // Switches
            RowLayout {
                Switch { checked: true }
                Text {
                    text: "Auto High Beam"
                    font.pixelSize: lights.height * 0.025
                    color: Style.isDark ? Style.white : Style.black
                }
            }

            RowLayout {
                Switch { checked: true }
                Text {
                    text: "Headlight After Exit"
                    font.pixelSize: lights.height * 0.025
                    color: Style.isDark ? Style.white : Style.black
                }
            }

            RowLayout {
                Switch { checked: true }
                Text {
                    text: "steeering wheel light"
                    font.pixelSize: lights.height * 0.025
                    color: Style.isDark ? Style.white : Style.black
                }
            }
        }
    }
}
