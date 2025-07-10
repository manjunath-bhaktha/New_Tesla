import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0

Rectangle {
    id: root
    anchors.fill: parent
    color: Style.isDark ? Style.lightblack : Style.lightwhite

    property int selectedFeature: 0

    Rectangle {
        id: lock
        width: parent.width * 0.95
        height: parent.height * 0.95
        color: Style.isDark ? Style.lightblack : Style.lightwhite
        anchors.centerIn: parent

        ColumnLayout {
            anchors.fill: parent
            spacing: 10

            // Walk-Away Door Lock
            ColumnLayout {
                spacing: 8

                RowLayout {
                    spacing: 10

                    Switch { checked: true }

                    Text {
                        text: "Walk-Away Door Lock"
                        font.pixelSize: lock.height * 0.027
                        color: Style.isDark ? Style.white : Style.black
                    }
                }

                Text {
                    text: "Automatically lock doors and trunks when leaving \nwith your phone or key fob"
                    font.pixelSize: lock.height * 0.02
                    Layout.leftMargin: lock.height / 5
                    color: Style.isDark ? "#bbb" : "#666"
                    wrapMode: Text.WordWrap
                }
            }

            // Other toggle options
            RowLayout {
                spacing: 10

                Switch { checked: false }

                Text {
                    text: "Driver Door Unlock Mode ⓘ"
                    font.pixelSize: lock.height * 0.027
                    color: Style.isDark ? Style.white : Style.black
                }
            }

            RowLayout {
                spacing: 10

                Switch { checked: true }

                Text {
                    text: "Hands-Free Trunk ⓘ"
                    font.pixelSize: lock.height * 0.027
                    color: Style.isDark ? Style.white : Style.black
                }
            }

            RowLayout {
                spacing: 10

                Switch { checked: true }

                Text {
                    text: "Unlock on Park"
                    font.pixelSize: lock.height * 0.027
                    color: Style.isDark ? Style.white : Style.black
                }
            }

            // Notification settings
            Text {
                text: "Car Left Open Notifications ⓘ"
                font.bold: true
                font.pixelSize: lock.height * 0.027
                color: Style.isDark ? Style.white : Style.black
            }

            Column {
                spacing: 5

                Rectangle {
                    width: (lock.width / 6) * 3 + 6
                    height: lock.height / 10 + 4
                    radius: 5
                    color: Style.isDark ? Style.sblack : Style.swhite
                    border.color: "grey"
                    border.width: 1

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 2
                        spacing: 2

                        Repeater {
                            model: ListModel {
                                ListElement { label: "Off" }
                                ListElement { label: "Doors" }
                                ListElement { label: "Doors &\nWindows" }
                            }

                            Rectangle {
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                radius: 5
                                color: index === root.selectedFeature
                                       ? (Style.isDark ? "black" : "white")
                                       : "transparent"

                                Text {
                                    anchors.centerIn: parent
                                    text: model.label
                                    wrapMode: Text.WordWrap
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    font.pixelSize: lock.height * 0.018
                                    font.bold: index === root.selectedFeature
                                    color: index === root.selectedFeature
                                           ? (Style.isDark ? "white" : "black")
                                           : (Style.isDark ? "white" : "black")
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: root.selectedFeature = index
                                }
                            }
                        }
                    }
                }


                Text {
                    text: "You will be notified if any boot, door or window is left open or \nif your vehicle is left unlocked unexpectedly"
                    wrapMode: Text.WordWrap
                    font.pixelSize: lock.height * 0.02
                    color: Style.isDark ? "#bbb" : "gray"
                }
            }

            // Additional toggles
            RowLayout {
                spacing: 10

                Switch { checked: false }

                Text {
                    text: "Lock Confirmation Sound"
                    font.pixelSize: lock.height * 0.027
                    color: Style.isDark ? Style.white : Style.black
                }
            }

            RowLayout {
                spacing: 10

                Switch { checked: false }

                Text {
                    text: "Close Windows on Lock"
                    font.pixelSize: lock.height * 0.027
                    color: Style.isDark ? Style.white : Style.black
                }
            }
        }
    }
}
