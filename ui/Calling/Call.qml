import QtQuick 2.0
import QtLocation 5.12
import QtPositioning 5.12

Rectangle{
    id: call
    color: "transparent"
    anchors.fill: parent

//    width: parent.width
    Rectangle{
        id:photo
        anchors{
            top: parent.top
            topMargin: parent.height / 8
            left: parent.left
            leftMargin: parent.width / 4
//            horizontalCenter: parent.horizontalCenter
//            verticalCenter: parent.verticalCenter
        }
        width: parent.width/6
        height: parent.width/6
        radius: 360
        color: "red"
        Text {
            id: phoneNumber
            text: qsTr("9999999999")
            verticalAlignment: Text.horizontalCenter
            anchors{
                top: parent.bottom
                topMargin: 10
                horizontalCenter: parent.horizontalCenter
            }
            height: parent.height / 2
            font.pixelSize: parent.height / 3
        }
        Rectangle{
            anchors.top: phoneNumber.bottom
            anchors.right: phoneNumber.left
            anchors.topMargin: 10
            height: parent.height / 2
            width: parent.width / 2
            color: "transparent"
            Image {
                id: calling
                source: "../../images/call.png"
                anchors.fill: parent
            }
        }
        Rectangle{
            anchors.top: phoneNumber.bottom
            anchors.left: phoneNumber.right
            anchors.topMargin: 10
            height: parent.height / 2
            width: parent.width / 2
            color: "transparent"
            Image {
                id: endCall
                source: "../../images/end_call.png"
                anchors.fill: parent
            }
        }
    }
}
