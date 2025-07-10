import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "../../components"
import Style 1.0


Rectangle {
    id: soundsSettings
    anchors {
        top: parent.top
        bottom: parent.bottom
        right: parent.right
        left: parent.left
    }
    color: Style.background

    Rectangle{
        id:sound
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left:parent.left
        height: parent.height * 0.3
        color:"transparent"

        Text {
            id: text1
            text: qsTr("sounds")
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin:  parent.height / 3
            font.pixelSize: parent.height /5

        }


    }
    Rectangle{
        id:slider1
        anchors.top: sound.bottom
        anchors.right: parent.right
        anchors.left:parent.left
        height: parent.height * 0.1
        color:"transparent"

        Text {
            id: volume
            text: qsTr("volume")
            anchors.left: slider1.left
            anchors.top:parent.top
            font.pixelSize: parent.height /3
            anchors.leftMargin:  parent.height / 3

        }

        PrefSlider {
            id:slider2
            value: 75
            width: parent.width *0.5
            height: parent.height * 0.3
            anchors.left:volume.left
            anchors.leftMargin:  parent.height / 5
            anchors.bottom:parent.bottom
            anchors.bottomMargin: parent.height /5
        }
    }
    Image {
        id:line1
        anchors.top:slider1.bottom
        width: parent.width
        source: "qrc:/images/HorizontalSeparator.png"
        visible: true
    }

    Rectangle{
        id:theme1
        anchors.top: line1.bottom
        anchors.right: parent.right
        anchors.left:parent.left
        height: parent.height * 0.05
        color:"transparent"

        Text {
            id: text2
            text: qsTr(" Indicator Sound")
            font.pixelSize:parent.height/1.6
            anchors.left: parent.left
            anchors.top: parent.bottom
            anchors.leftMargin:  parent.height / 4


        }
        PrefSwitch {
            id:button1
            anchors.top: parent.bottom
            anchors.right:parent.right
            width: parent.width *0.1
            height: parent.height
            anchors.leftMargin:  parent.height / 5
        }
    }
    Rectangle{
        id:space
        anchors.top: theme1.bottom
        anchors.right: parent.right
        anchors.left:parent.left
        height: parent.height * 0.1
        color:"transparent"
    }

    Rectangle{
        id:mode
        anchors.top: space.bottom
        anchors.right: parent.right
        anchors.left:parent.left
        height: parent.height * 0.1
        color:"transparent"

        Text {
            id: text3
            text: qsTr("parking Asissit Sound")
            font.pixelSize:parent.height/3.4
            anchors.left: parent.left
            anchors.top: parent.bottom
            anchors.leftMargin:  parent.height / 4

        }
        PrefSwitch {
            id:button2
            anchors.top: parent.bottom
            anchors.right:parent.right
            width: parent.width * 0.1
            height: parent.height /2
            anchors.leftMargin:  parent.height / 5
        }
    }
    Rectangle{
        id:space1
        anchors.top: mode.bottom
        anchors.right: parent.right
        anchors.left:parent.left
        height: parent.height * 0.1
        color:"transparent"
    }
    Image {
        id:line2
        anchors.top:space1.bottom
        width: parent.width
        source: "qrc:/images/HorizontalSeparator.png"
        visible: true
    }

}

