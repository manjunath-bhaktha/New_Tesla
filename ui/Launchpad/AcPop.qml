import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Qt5Compat.GraphicalEffects
import Style 1.0

Popup {
    id: popup
    width: parent.width
    height: parent.height / 2.1
    x: 0
    y: footer.y - height

    background: Rectangle {
        anchors.fill: parent
        color:"#eaeaea"
    }

    contentItem: Rectangle {
        id: ac
        anchors.fill: parent
        color:"#eaeaea"

        property int selectedIndex: -1
        property string selectedButton: "none"

        Rectangle{
            id: acimg
            width: parent.width/1.2
            height: parent.height/1.1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            color: "transparent"

            Image {

                source: "qrc:/Images/AC.png"
                height: parent.height
                width: parent.width
                anchors.fill: parent
                smooth: true
            }

        }

        Rectangle {
            id: sidebar
            width: parent.width / 12
            height: parent.height
            color: "white"
            anchors.right:acimg.left
            anchors.top: parent.top

            Column {
                anchors.fill: parent
                spacing: 2

                Rectangle {
                    id: front
                    property bool isActive: false
                    color: isActive ? "#3467FF" : "#eaeaea"
                    width: parent.width
                    height: parent.height / 2

                    Text {
                        text: qsTr("Front")
                        anchors.centerIn: parent
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: front.isActive = !front.isActive
                    }
                }

                Rectangle {
                    id: back
                    property bool isActive: false
                    color: isActive ? "#3467FF" : "#eaeaea"
                    width: parent.width
                    height: parent.height / 2

                    Text {
                        text: qsTr("Rear")
                        anchors.centerIn: parent
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: back.isActive = !back.isActive
                    }
                }
            }
        }

        Rectangle {
            id: pwerbuttons
            width: parent.width / 8
            height: parent.height / 6
            color: "black"
            anchors.left: sidebar.right
            anchors.top: parent.top
            anchors.leftMargin: parent.height / 15
            anchors.topMargin: parent.height / 25

            Rectangle {
                height: parent.height
                width: 1
                anchors.centerIn: parent
                color: "white"
                z: 1
            }

            Row {
                anchors.fill: parent

                Rectangle {
                    id: power
                    color: ac.selectedButton === "power" ? "#3467FF" : "#eaeaea"
                    width: parent.width / 2
                    height: parent.height

                    Image {
                        source: "qrc:/Images/powerbutton.svg"
                        anchors.centerIn: parent
                        fillMode: Image.PreserveAspectFit
                        height: parent.height / 3
                        width: parent.width / 3
                        opacity: 0.5
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: ac.selectedButton = ac.selectedButton === "power" ? "none" : "power"
                    }
                }

                Rectangle {
                    id: auto
                    color: ac.selectedButton === "auto" ? "#3467FF" : "#eaeaea"
                    width: parent.width / 2
                    height: parent.height

                    Text {
                        text: qsTr("AUTO")
                        anchors.centerIn: parent
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: ac.selectedButton = ac.selectedButton === "auto" ? "none" : "auto"
                    }
                }
            }
        }

        Rectangle {
            id: froter
            width: parent.width / 8
            height: parent.height / 6
            color: "black"
            anchors.left: pwerbuttons.right
            anchors.top: parent.top
            anchors.leftMargin: parent.height / 15
            anchors.topMargin: parent.height / 25
            radius: 10

            Rectangle {
                height: parent.height
                width: 1
                anchors.centerIn: parent
                color: "white"
                z: 1
            }

            Row {
                anchors.fill: parent

                Rectangle {
                    id: defrost
                    property bool isActive: false
                    color: isActive ? "#3467FF" : "#eaeaea"
                    width: parent.width / 2
                    height: parent.height

                    Image {
                        source: "qrc:/LaunchpadIcons/front-defrost.svg"
                        anchors.centerIn: parent
                        fillMode: Image.PreserveAspectFit
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: defrost.isActive = !defrost.isActive
                    }
                }

                Rectangle {
                    id: heater
                    property bool isActive: false
                    color: isActive ? "#3467FF" : "#eaeaea"
                    width: parent.width / 2
                    height: parent.height

                    Image {
                        source: "qrc:/LaunchpadIcons/rear-defrost.svg"
                        anchors.centerIn: parent
                        fillMode: Image.PreserveAspectFit
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: heater.isActive = !heater.isActive
                    }
                }
            }
        }

        Image{
            id:fan
            source:"qrc:/Images/fan.png"
            anchors.left: froter.right
            anchors.leftMargin: parent.height/20
            anchors.top: parent.top
            anchors.topMargin: parent.height / 20
            fillMode: Image.PreserveAspectFit
            width: height
            height: parent.height / 10
            opacity: 0.3
        }

        Slider {
            id: slider
            width: parent.width / 3
            value: 0.5
            anchors.left: fan.right
            anchors.leftMargin: parent.height/20
            anchors.top: parent.top
            anchors.topMargin: parent.height / 20
            opacity: 0.3
        }

        Rectangle {
            id: schedule
            width: parent.width / 8
            height: parent.height / 6
            color: "#eaeaea"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: parent.height / 15
            anchors.topMargin: parent.height / 15

            Text {
                text: qsTr("Schedule")
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.rightMargin: parent.height / 8
            }

            Image {
                source: "qrc:/Images/clock.svg"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: parent.height / 8
                fillMode: Image.PreserveAspectFit
                height: parent.height / 3
                width: parent.width / 3
                opacity: 0.5
            }
        }

        Column {
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: parent.height/20
            anchors.left:acimg.right

            Repeater {
                model: [
                    { source: "qrc:/Images/fan.png", label: "keep" },
                    { source: "qrc:/Images/dogpaw.png", label: "dog" },
                    { source: "qrc:/Images/camping.png", label: "camp" }
                ]

                delegate: Item {
                    width: ac.width / 20
                    height: ac.height / 6

                    Rectangle {
                        anchors.fill: parent
                        color: index === ac.selectedIndex ? "#3467FF" : "#eaeaea"

                        MouseArea {
                            anchors.fill: parent
                            onClicked: ac.selectedIndex = index
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                        }

                        Column {
                            anchors.fill: parent
                            anchors.margins: 5
                            spacing: 4

                            Image {
                                source: modelData.source
                                fillMode: Image.PreserveAspectFit
                                width: parent.width * 0.4
                                height: parent.height * 0.4
                                anchors.horizontalCenter: parent.horizontalCenter
                                opacity: 0.3
                            }

                            Text {
                                text: modelData.label
                                font.pixelSize: parent.height / 5
                                color: "black"
                                horizontalAlignment: Text.AlignHCenter
                                width: parent.width
                                wrapMode: Text.WordWrap
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            id: bottomright
            width: parent.width / 8
            height: parent.height / 8
            color: "black"
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: parent.height / 15
            anchors.bottomMargin: parent.height / 22
            radius: 10

            Rectangle {
                height: parent.height
                width: 1
                anchors.centerIn: parent
                color: "white"
                z: 1
            }

            Row {
                anchors.fill: parent

                Rectangle {
                    id: auto2
                    property bool isActive: false
                    color: isActive ? "#3467FF" : "#eaeaea"
                    width: parent.width / 2
                    height: parent.height

                    Text {
                        text: qsTr("AUTO")
                        anchors.centerIn: parent
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: auto2.isActive = !auto2.isActive
                    }
                }

                Rectangle {
                    id: seat
                    property bool isActive: false
                    color: isActive ? "#3467FF" : "#eaeaea"
                    width: parent.width / 2
                    height: parent.height

                    Image {
                        source: "qrc:/Images/seat.svg"
                        anchors.centerIn: parent
                        fillMode: Image.PreserveAspectFit
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: seat.isActive = !seat.isActive
                    }
                }
            }
        }
    }
}
