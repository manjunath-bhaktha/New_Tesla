import QtQuick 2.0
import Style 1.0
import QtQuick.Layouts 1.3


Rectangle {
    id: calender
    anchors.fill: parent
     color: Style.isDark ? Style.lightblack : Style.lightwhite


    Image {
        id: icon
        width: parent.height/30
        height: parent.height/30
        source: "qrc:/LaunchpadIcons/messages.svg"
        anchors.leftMargin: parent.height/8
        anchors.left: parent.left
        anchors.top:parent.top
        anchors.topMargin: parent.height/8
        fillMode:Image.PreserveAspectFit

    }


    Text {
        text: qsTr("Messages ")
        anchors.leftMargin: 18
        anchors.left: icon.right
        font.pixelSize: parent.height/40
        anchors.top:parent.top
        anchors.topMargin: parent.height/8
        color: Style.isDark ?Style.white : Style.black

    }

    Text {
        id:txt
        text: qsTr("Phone is not connected ")
        anchors.leftMargin: parent.height/8
        anchors.left: parent.left
        font.pixelSize: parent.height/30
        anchors.top:icon.bottom
        anchors.topMargin: parent.height/7
        font.bold: true
        color: Style.isDark ?Style.white : Style.black

    }




}
