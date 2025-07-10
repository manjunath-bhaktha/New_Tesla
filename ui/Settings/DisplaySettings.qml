import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "../../components"
import Style 1.0


Rectangle {
    id: displaySettings
    anchors {
        top: parent.top
        bottom: parent.bottom
        right: parent.right
        left: parent.left
    }
    color: Style.background

    Rectangle{
        id:brightness
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left:parent.left
        height: parent.height * 0.3
        color:"transparent"
        Image{
            id:bicon
            source: "qrc:/images/brightness 2.svg"
            visible: true
            height: text1.height


            fillMode: Image.PreserveAspectFit

            anchors.left: parent.left
            anchors.leftMargin:  parent.height / 10
            anchors.verticalCenter: parent.verticalCenter

        }
        Text {
            id: text1
            text: qsTr("Display brightness")

            anchors.left: bicon.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin:   parent.height / 10
            font.pixelSize: parent.height /5

        }



    }
    Rectangle{
        id:slider1
        anchors.top: brightness.bottom
        anchors.right: parent.right
        anchors.left:parent.left
        height: parent.height * 0.1
        color:"transparent"



        PrefSlider {
            id:slider2
            value: 75
            width: parent.width *0.8
            height: parent.height * 0.3
            anchors.left:slider1.left
            anchors.leftMargin:  parent.height / 5


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
            y: 0
            text: qsTr("Themes")
            anchors.leftMargin: 45
            font.pixelSize:parent.height
            anchors.left: parent.left
            anchors.top: parent.bottom

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

        PrefButton {
            id:button1
            anchors.left:parent.left
            width: parent.width/5
            height: parent.height
            backgroundColor: "#FFFFFF"
            textColor: "#000000"
            text: qsTr("Light")
            onClicked: Style.isDark = false
            anchors.leftMargin:  parent.height / 5
        }
        PrefButton {
            anchors.left:button1.right
            width: parent.width/5
            height: parent.height
            backgroundColor: "#000000"
            text: "Dark"
            anchors.leftMargin: parent.height /3
            onClicked: Style.isDark = true

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

