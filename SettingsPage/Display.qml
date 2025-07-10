import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0

Rectangle {
    id: root
    anchors.fill: parent
    color: Style.isDark ? Style.lightblack : Style.lightwhite


    property int selectedFeature: Style.isDark ? 1 : 0
    property int selectedLight: 1


    Rectangle {
        id: displays
        width: parent.width * 0.95
        height: parent.height * 0.95
        color: Style.isDark ? Style.lightblack : Style.lightwhite
        anchors.centerIn: parent

        Column {
            anchors.fill: parent
            spacing: 15

            Text {
                text: "Appearance"
                font.bold: true
                font.pixelSize: displays.height * 0.03
                color: Style.isDark ? Style.white : Style.black
            }


            Rectangle {
                width: (displays.width / 6) * 3 + 6
                height: displays.height / 12 + 4
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
                            ListElement { label: "Light" }
                            ListElement { label: "Dark" }
                            ListElement { label: "Auto" }
                        }

                        Rectangle {
                            width: displays.width / 6
                            height: displays.height / 12
                            color: index === root.selectedFeature
                                    ? (Style.isDark ? "black" : "white")
                                    : "transparent"
                            radius: 5

                            Text {
                                anchors.centerIn: parent
                                text: model.label
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.WordWrap
                                font.pixelSize: displays.height * 0.02
                                color: index === root.selectedFeature
                                       ? (Style.isDark ? "white" : "black")
                                       : (Style.isDark ? "white" : "black")  // Default color
                                font.bold: index === root.selectedFeature
                            }


                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    root.selectedFeature = index;
                                    if (model.label === "Dark") {
                                        Style.isDark = true;
                                    } else if (model.label === "Light") {
                                        Style.isDark = false;
                                    } else {
                                        Style.isDark = Qt.application.palette.window.color === "black";
                                    }
                                }
                            }
                        }
                    }
                }
            }

            Text {
                text: "Brightness"
                font.bold: true
                font.pixelSize: displays.height * 0.03
                color: Style.isDark ? Style.white : Style.black
            }


            Rectangle {
                width: (displays.width / 6) * 4 + 6
                height: displays.height / 12 + 4
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
                            ListElement { label: "48%" }
                            ListElement { label: "lowbeam" }
                            ListElement { label: "Auto" }
                        }
                        Rectangle {
                            width: displays.width / 6
                            height: displays.height / 12
                            color: index === root.selectedLight
                                    ? (Style.isDark ? "black" : "white")
                                    : "transparent"
                            radius: 5

                            Text {
                                anchors.centerIn: parent
                                text: model.label
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.WordWrap
                                font.pixelSize: displays.height * 0.02
                                color: index === root.selectedLight
                                       ? (Style.isDark ? "white" : "black")
                                       : (Style.isDark ? "white" : "black")
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    root.selectedLight = index;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
