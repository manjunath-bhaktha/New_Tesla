import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "../../components"
import Style 1.0

Rectangle {
    id: bluetoothsettings
    anchors{
        top: parent.top
        bottom: parent.bottom
        right: parent.right
        left: parent.left
    }
    color: Style.background

    Rectangle{
        id:blue
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left:parent.left
        height: parent.height * 0.3
        color:"transparent"

        Text {
            id: text1
            text: qsTr("Bluetooth")
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin:parent.height / 3
            font.pixelSize: parent.height /5

        }

        Image{
            id:bicon1
            source: "qrc:/images/bluetooth.svg"
            anchors.left: text1.right
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            visible: true
        }
    }
    Rectangle{
        id:slider1
        anchors.top: blue.bottom
        anchors.right: parent.right
        anchors.left:parent.left
        height: parent.height * 0.1
        color:"transparent"


        Rectangle{
            id:backrect
            width:parent.width /4
            height:parent.height/1.5
            anchors.left:parent.left
            anchors.leftMargin:parent.height / 1
            color: "#00B1B2"
            radius: 7.9

            PrefSwitch{
                id:scroll
                width: backrect.width /2
                height:backrect.height
                anchors.leftMargin:parent.height / 3
                anchors.left:backrect.left

                Text{
                    id:text2
                    text:"on/off"
                    anchors.right: scroll.left
                    font.pixelSize: backrect.height / 2
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    color: "white"

                }
            }
        }
    }
    Rectangle{
        id:sometext
        anchors.top: slider1.bottom
        anchors.right: scootyrectangle.left
        anchors.left:parent.left
        height: parent.height * 0.1
        color:"transparent"

        Text{
            id:text3
            text:"On your bluetooth to connect with the device"
            anchors.left:parent.left
            anchors.horizontalCenter: sometext.horizontalCenter
            anchors.verticalCenter: sometext.verticalCenter
            anchors.leftMargin: parent.height /2
            font.pixelSize: parent.height /5
        }

    }
    Rectangle{
        id:scootyrectangle
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: parent.height/6
        anchors.rightMargin: parent.width/10
        height: parent.height/2
        width: parent.width/3
        color:"transparent"


        Image{
            source:"qrc:/images/scooty.png"
            anchors.fill:parent

        }

    }
}













