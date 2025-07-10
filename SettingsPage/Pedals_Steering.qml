import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0

Rectangle {
    anchors.fill: parent
    color: Style.isDark ? Style.lightblack : Style.lightwhite

    property int accelSelected: 0
    property int steeringSelected: 0
    property int stoppingSelected: 2

    Rectangle {
        id: pedals_Steering
        width: parent.width * 0.95
        height: parent.height * 0.95
        color: Style.isDark ? Style.lightblack : Style.lightwhite
        anchors.centerIn: parent

        ColumnLayout {
            anchors.fill: parent
            spacing: 10

            // Acceleration
            Column {
                spacing: 5

                Text {
                    text: "Acceleration"
                    font.bold: true
                    font.pixelSize: pedals_Steering.height * 0.03
                    color: Style.isDark ? Style.white : Style.black
                }

                Rectangle {
                    width: (pedals_Steering.width / 7) * 2 + 6
                    height: pedals_Steering.height / 12 + 4
                    color: Style.isDark ? Style.sblack : Style.swhite
                    radius: 5
                    border.color: "grey"
                    border.width: 1

                    Row {
                        anchors.fill: parent
                        anchors.margins: 2
                        spacing: 2

                        Repeater {
                            model: ListModel {
                                ListElement { label: "Chill" }
                                ListElement { label: "Standard" }
                            }

                            Rectangle {
                                width: ((pedals_Steering.width / 7) * 2 + 6 - 6) / 2
                                height: parent.height
                                color: index === accelSelected
                                        ? (Style.isDark ? "black" : "white")
                                        : "transparent"
                                radius: 5

                                Text {
                                    anchors.centerIn: parent
                                    text: model.label
                                    font.pixelSize: parent.height / 3.5
                                    color: index === accelSelected
                                           ? (Style.isDark ? "white" : "black")
                                           : (Style.isDark ? "white" : "black")
                                    font.bold: index === accelSelected
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: accelSelected = index
                                }
                            }
                        }
                    }
                }
            }

            // Steering
            Column {
                spacing: 5

                Text {
                    text: "Steering Mode"
                    font.bold: true
                    font.pixelSize: pedals_Steering.height * 0.03
                    color: Style.isDark ? Style.white : Style.black
                }

                Rectangle {
                    width: (pedals_Steering.width / 6) * 3 + 6
                    height: pedals_Steering.height / 12 + 4
                    color: Style.isDark ? Style.sblack : Style.swhite
                    radius: 5
                    border.color: "grey"
                    border.width: 1

                    Row {
                        anchors.fill: parent
                        anchors.margins: 2
                        spacing: 2

                        Repeater {
                            model: ListModel {
                                ListElement { label: "Comfort" }
                                ListElement { label: "Standard" }
                                ListElement { label: "Sport" }
                            }

                            Rectangle {
                                width: ((pedals_Steering.width / 6) * 3 + 6 - 8) / 3
                                height: parent.height
                                color: index === steeringSelected
                                        ? (Style.isDark ? "black" : "white")
                                        : "transparent"
                                radius: 5

                                Text {
                                    anchors.centerIn: parent
                                    text: model.label
                                    font.pixelSize: parent.height / 3.5
                                    color: index === steeringSelected
                                           ? (Style.isDark ? "white" : "black")
                                           : (Style.isDark ? "white" : "black")
                                    font.bold: index === steeringSelected
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: steeringSelected = index
                                }
                            }
                        }
                    }
                }
            }

            // Stopping Mode
            Column {
                spacing: 5

                Text {
                    text: "Stopping Mode"
                    font.bold: true
                    font.pixelSize: pedals_Steering.height * 0.03
                    color: Style.isDark ? Style.white : Style.black
                }

                Rectangle {
                    width: (pedals_Steering.width / 6) * 3 + 6
                    height: pedals_Steering.height / 12 + 4
                    color: Style.isDark ? Style.sblack : Style.swhite
                    radius: 5
                    border.color: "grey"
                    border.width: 1

                    Row {
                        anchors.fill: parent
                        anchors.margins: 2
                        spacing: 2

                        Repeater {
                            model: ListModel {
                                ListElement { label: "Creep" }
                                ListElement { label: "Roll" }
                                ListElement { label: "Hold" }
                            }

                            Rectangle {
                                width: ((pedals_Steering.width / 6) * 3 + 6 - 8) / 3
                                height: parent.height
                                color: index === stoppingSelected
                                        ? (Style.isDark ? "black" : "white")
                                        : "transparent"
                                radius: 5

                                Text {
                                    anchors.centerIn: parent
                                    text: model.label
                                    font.pixelSize: parent.height / 3.5
                                    color: index === stoppingSelected
                                           ? (Style.isDark ? "white" : "black")
                                           : (Style.isDark ? "white" : "black")
                                    font.bold: index === stoppingSelected
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: stoppingSelected = index
                                }
                            }
                        }
                    }
                }

                Text {
                    text: "Maximizes range by extending\nregenerative braking to lower speeds and automatically\nblends in brakes to hold the vehicle at a stop"
                    font.pixelSize: pedals_Steering.height * 0.02
                    opacity: 0.5
                    color: Style.isDark ? Style.white : Style.black
                    wrapMode: Text.WordWrap
                }
            }

            // Slip Start Toggle
            Column {
                spacing: 8

                RowLayout {
                    spacing: 10

                    Switch { id: slipSwitch }

                    Text {
                        text: "Slip Start"
                        font.bold: true
                        font.pixelSize: pedals_Steering.height * 0.03
                        color: Style.isDark ? Style.white : Style.black
                    }
                }

                Text {
                    text: "Use to help free vehicle stuck in snow, sand, or mud."
                    wrapMode: Text.Wrap
                    color: Style.isDark ? "#bbb" : "#555"
                    font.pixelSize: pedals_Steering.height * 0.02
                    Layout.leftMargin: 40
                    Layout.preferredWidth: 300
                }
            }
        }
    }
}
