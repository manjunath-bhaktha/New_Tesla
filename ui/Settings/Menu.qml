import QtQuick.Layouts 1.3
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Controls 2.14
import Style 1.0



Rectangle {
    id: settingsLeftScreen
    anchors {
        top: parent.top
        bottom: parent.bottom
        left: parent.left
    }

    color: Style.background
    width: parent.width / 3


    Rectangle {

        id: rectangle
        width: parent.width
        height: parent.width * .15
        color: "transparent"

        Text {
            anchors.left: parent.left
            anchors.leftMargin: parent.width * .02

            text: "Settings"
            anchors.verticalCenter:parent.verticalCenter
            anchors.verticalCenterOffset: parent.height * .4
            font.pixelSize: parent.width / 6
            color: "Black"
        }
    }

    ColumnLayout {
        anchors {
            //fill: parent
            top: rectangle.bottom
            right: parent.right
            left: parent.left
            bottom: parent.bottom
        }

        ListView {
            id: listItemView
            anchors {
                top: settingsText.bottom
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
                topMargin: 20
            }
            width: parent.width
            height: parent.height - settingsText.height - 60
            spacing: 20

            model: ListModel {
                ListElement { name: "Display" }
                ListElement { name: "Bluetooth" }
                ListElement { name: "Wifi" }
                ListElement { name: "Date & Time" }
                ListElement { name: "Sounds" }
                ListElement { name: "Change Password" }
                ListElement { name: "TPMS & Gyro" }

            }

            delegate: Rectangle {
                width: parent.width
                height: 50
                color: listItemView.currentIndex === index ? "white" : "transparent"

                Text {
                    anchors.centerIn: parent
                    text: model.name
                    font.pixelSize: 30//listItemView.currentIndex === index ? 20 : 18
                    color: "black"
                    font.weight: Font.bold
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        listItemView.currentIndex = index
                        currentidexvalue2 = index + 3
                    }
                }

                states: [
                    State {
                        name: "hovered"
                        when: mouseArea.containsMouse
                        PropertyChanges {
                            target: parent
                            color: "white"
                        }
                    }
                ]

                transitions: [
                    Transition {
                        from: ""
                        to: "hovered"
                        ParallelAnimation {
                            ColorAnimation { properties: "color"; duration: 300 }
                        }
                    }
                ]
            }
        }
    }

    Text {
        id: settingsText
        visible: false
    }
    Text {
        id: version
        text: "Version 2.0"
        anchors.left: parent.left
        anchors.leftMargin: parent.width * .02
        anchors.bottom: parent.bottom
        font.pixelSize: parent.width /25
        anchors.bottomMargin: parent.width * .02
        color: "Black"

    }
}

