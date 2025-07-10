import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0

Rectangle {
    id: root
    anchors.fill: parent
    color: Style.isDark ? Style.lightblack : Style.lightwhite


    Rectangle {
        id: autopilot
        width: parent.width * 0.95
        height: parent.height * 0.95
        color: Style.isDark ? Style.lightblack : Style.lightwhite
        anchors.centerIn: parent

        property int selectedFeature: 1
        property int selectedActivation: 1
        property int selectedSpeed: 1

        ColumnLayout {
            anchors.fill: parent
            spacing: 15

            Text {
                text: "Autopilot Features ⓘ"
                font.bold: true
                font.pixelSize: autopilot.height * 0.03
                color: Style.isDark ?Style.white : Style.black
            }

            Rectangle {
                width: autopilot.width * 0.6
                height: autopilot.height / 10
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
                            ListElement { label: "Traffic-Aware\nCruise Control" }
                            ListElement { label: "Autosteer\n(Beta)" }
                        }

                        Rectangle {
                            width: (autopilot.width * 0.6 - 6) / 2  // subtract spacing, divide evenly
                            height: autopilot.height / 10 - 4
                            color: index === autopilot.selectedFeature
                                    ? (Style.isDark ? "black" : "white")
                                    : "transparent"
                            radius: 5

                            Text {
                                anchors.centerIn: parent
                                text: model.label
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.WordWrap
                                font.pixelSize: autopilot.height * 0.02
                                color: index === autopilot.selectedFeature
                                       ? (Style.isDark ? "white" : "black")
                                       : (Style.isDark ? "white" : "black")  // Default color
                                font.bold: index === autopilot.selectedFeature
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: autopilot.selectedFeature = index
                            }
                        }

                    }
                }
            }


            Text {
                text: "If an Autopilot Strikeout occurs 5 times due to improper use,\nAutosteer (Beta) will no longer operate. This vehicle has not had any such events."
                font.pixelSize: autopilot.height * 0.02
                opacity: 0.5
                color: Style.isDark ?Style.white : Style.black

            }


            Text {
                text: "Autopilot Activation ⓘ"
                font.bold: true
                font.pixelSize: autopilot.height * 0.03
                color: Style.isDark ?Style.white : Style.black

            }

            Rectangle {
                width: (autopilot.width / 7) * 2 + 6
                height: autopilot.height / 12 + 4
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
                            ListElement { label: "Single Click" }
                            ListElement { label: "Double Click" }
                        }

                        Rectangle {
                            width: autopilot.width / 7
                            height: autopilot.height / 12
                            color: index === autopilot.selectedActivation
                                    ? (Style.isDark ? "black" : "white")
                                    : "transparent"
                            radius: 5

                            Text {
                                anchors.centerIn: parent
                                text: model.label
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.WordWrap
                                font.pixelSize: autopilot.height * 0.02
                                color: index === autopilot.selectedActivation
                                       ? (Style.isDark ? "white" : "black")
                                       : (Style.isDark ? "white" : "black")  // Default color
                                font.bold: index === autopilot.selectedActivation
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: autopilot.selectedActivation = index
                            }
                        }

                    }
                }
            }



            ColumnLayout {
                spacing: 3

                RowLayout {

                    Switch { checked: true }

                    Text {
                        text: "Navigate on Autopilot (Beta)"
                        font.pixelSize: autopilot.height * 0.02
                        color: Style.isDark ?Style.white : Style.black
                    }
                }

                Text {
                    text: "Learn more in Tesla Tutorials"
                    color: "blue"
                    font.pixelSize: autopilot.height * 0.02
                    Layout.leftMargin: autopilot.height / 7

                }
            }

            Rectangle {
                width: parent.width / 2
                height: autopilot.height / 10
                color: Style.isDark ? Style.swhite : Style.sblack
                radius: 6

                Text {
                    anchors.centerIn: parent
                    text: "Customise Navigate on Autopilot"
                    font.pixelSize: parent.height / 5
                    font.bold: true
                    color: Style.isDark ?Style.black : Style.white

                }
            }

            RowLayout {
                spacing: 10
                Switch { checked: true }

                Text {
                    text: "Traffic Light and Stop Sign Control (Beta)"
                    font.pixelSize: autopilot.height * 0.02
                    color: Style.isDark ?Style.white : Style.black
                }
            }

            Text {
                text: "Set Speed ⓘ"
                font.bold: true
                font.pixelSize: autopilot.height * 0.03
                color: Style.isDark ?Style.white : Style.black

            }

            Rectangle {
                width: (autopilot.width / 7) * 2 + 6
                height: autopilot.height / 12 + 4
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
                            ListElement { label: "Speed Limit" }
                            ListElement { label: "Current Speed" }
                        }

                        Rectangle {
                            width: autopilot.width / 7
                            height: autopilot.height / 12
                            color: index === autopilot.selectedSpeed
                                    ? (Style.isDark ? "black" : "white")
                                    : "transparent"
                            radius: 5

                            Text {
                                anchors.centerIn: parent
                                text: model.label
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.WordWrap
                                font.pixelSize: autopilot.height * 0.02
                                color: index === autopilot.selectedSpeed
                                       ? (Style.isDark ? "white" : "black")
                                       : (Style.isDark ? "white" : "black")  // Default color
                                font.bold: index === autopilot.selectedFeature
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: autopilot.selectedSpeed = index
                            }
                        }

                    }
                }
            }

        }
    }
}

