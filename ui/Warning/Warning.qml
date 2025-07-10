import QtQuick 2.0
import QtLocation 5.12
import QtPositioning 5.12

Rectangle{
    id: call
    color: "transparent"
    anchors.fill: parent
    Rectangle{
        id: warning
        anchors{
            top: parent.top
            topMargin: parent.height / 8
            right: parent.right
            rightMargin: parent.width / 4
        }
        width: parent.width/6
        height: parent.width/6
        radius: 360
        color: "transparent"
        Image {
            id: wimage
            source: "../../images/warning.png"
            anchors.fill: parent
        }
    }
    Text {
        id: warningMsg
        text: qsTr("SERVICE NEEDED")
        anchors.top: warning.bottom
        anchors.topMargin: 6
        anchors.right: parent.right
        anchors.rightMargin: parent.width / 7
        font.pixelSize: warning.height/3
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
