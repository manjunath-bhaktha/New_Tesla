import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0
import Qt5Compat.GraphicalEffects

Popup {
    id: popup
    width: parent.width * 2/3
    height: footer.y - (header.y + header.height)
    x: parent.width - width
    y: header.y + header.height
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

    background: Rectangle {
        anchors.fill: parent
        radius: 12
        color: Style.isDark ? Style.lightblack : Style.lightwhite
    }

    Rectangle {
        anchors.fill: parent
        color: Style.isDark ? Style.lightblack : Style.lightwhite

        Rectangle {
            id: lists
            width: parent.width / 4
            height: parent.height
            color: Style.isDark ? Style.lightblack : Style.lightwhite

            ListView {
                id: listView
                anchors.fill: parent
                clip: true
                spacing: 0

                model: [
                    { icon: "qrc:/settings_Icon/model3-icon-small.svg", title: "Pedals & Steering", page: "qrc:/SettingsPage/Pedals_Steering.qml" },
                    { icon: "qrc:/settings_Icon/Charging.svg", title: "Charging", page: "qrc:/SettingsPage/Charging.qml" },
                    { icon: "qrc:/settings_Icon/steering wheel-small.svg", title: "Autopilot", page: "qrc:/SettingsPage/Autopilot.qml" },
                    { icon: "qrc:/settings_Icon/lock.svg", title: "Locks", page: "qrc:/SettingsPage/Lock.qml" },
                    { icon: "qrc:/settings_Icon/lights.svg", title: "Lights", page: "qrc:/SettingsPage/Light.qml" },
                    { icon: "qrc:/settings_Icon/display.svg", title: "Display", page: "qrc:/SettingsPage/Display.qml" },
                    { icon: "qrc:/settings_Icon/trip.png", title: "Trips", page: "qrc:/SettingsPage/Trip.qml" },
                    { icon: "qrc:/settings_Icon/Naviagtion.svg", title: "Navigation", page: "qrc:/SettingsPage/Navigation.qml" },
                    { icon: "qrc:/settings_Icon/safety and security.svg", title: "Safety", page: "qrc:/SettingsPage/Safety.qml" },
                    { icon: "qrc:/settings_Icon/service.svg", title: "Service", page: "qrc:/SettingsPage/Service.qml" },
                    { icon: "qrc:/settings_Icon/software.svg", title: "Software", page: "qrc:/ui/GyroScreen/software.qml" }
                ]

                Component.onCompleted: {
                    currentIndex = 0
                    pageLoader.source = model[currentIndex].page
                }

                delegate: ItemDelegate {
                    id: delegateItem
                    width: listView.width
                    height: listView.height / listView.count
                    hoverEnabled: true

                    background: Rectangle {
                        anchors.fill: parent
                        radius: height * 0.2
                        color: index === listView.currentIndex ? "white" : "transparent"
                    }
                    contentItem: Row {
                        anchors.fill: parent
                        anchors.margins: parent.height * 0.1
                        spacing: parent.width * 0.05

                        Rectangle{
                            width: parent.height * 0.53
                            height: parent.height * 0.53
                            clip:true
                            color: "transparent"
                            anchors.verticalCenter: parent.verticalCenter

                            Rectangle {
                                color: index === listView.currentIndex
                                       ? (Style.isDark ? Style.black : Style.black)  // Black text on white background
                                       : (Style.isDark ? Style.white : Style.black)  // Default text color
                                anchors.fill: parent
                                layer.enabled: true
                                layer.effect: OpacityMask {
                                    maskSource:Image {
                            source: modelData.icon
                            fillMode: Image.PreserveAspectFit

                        }
                                }
                            }
                        }
                        Text {
                            text: modelData.title
                            font.pixelSize: parent.height * 0.4
                            color: index === listView.currentIndex
                                   ? (Style.isDark ? Style.black : Style.black)  // Black text on white background
                                   : (Style.isDark ? Style.white : Style.black)  // Default text color
                            anchors.verticalCenter: parent.verticalCenter
                            elide: Text.ElideRight
                        }

                    }
                    onClicked: {
                        listView.currentIndex = index
                        pageLoader.source = modelData.page
                    }
                }
            }
        }

        Rectangle {
            id: pagess
            anchors.left: lists.right
            height: parent.height
            width: parent.width - lists.width
            color: "#ffffff"

            Loader {
                id: pageLoader
                anchors.fill: parent
                source: "qrc:/SettingsPage/Pedals_Steering.qml"
            }
        }
    }
}
