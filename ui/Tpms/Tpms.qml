import QtQuick 2.0
import Style 1.0
Rectangle {
    id: tpms
    anchors{
        top: parent.top
        bottom: parent.bottom
        right: parent.right
        left: parent.left
        topMargin:parent.height/6
        bottomMargin: parent.height/6
    }
    color: "transparent"
    Image {
        id: scooterTpms
        anchors.top: parent.top
        anchors.topMargin: parent.height / 7
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height / 20
        anchors.right: parent.right
        anchors.rightMargin: parent.width / 2
        anchors.left: parent.left
        anchors.leftMargin: parent.width / 8
        source: "../../images/scooter-top.png"
        Text {
            id: frontTpms
            text: qsTr("32")
            anchors{
                top: parent.top
                right: parent.right
                rightMargin: parent.width/6
            }
            font.pixelSize: parent.width / 7
        }
        Text {
            id: backTpms
            text: qsTr("32")
            anchors{
                bottom: parent.bottom
                right: parent.right
                rightMargin: parent.width/8
            }
            font.pixelSize: parent.width / 7
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_width:155;anchors_x:231;anchors_y:54}
}
##^##*/
