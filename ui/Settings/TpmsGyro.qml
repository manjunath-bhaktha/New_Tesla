import QtQuick 2.0
import "../GyroScreen"
import "../Tpms"
import Style 1.0

Rectangle{
    id:tpmsGyro
    anchors.fill:parent
    color:Style.background
    Rectangle{
        id:tpmsScreen
        width:parent.width/2
        height:parent.height
        color: "transparent"


        Tpms{
            id:tpms
        }
    }
    Rectangle{
        id:gyroScreen
        anchors.left:tpmsScreen.right
        anchors.leftMargin: -parent.width/6
        width:parent.width/2
        height:parent.height
        color: "transparent"

        GyroScreen{
            id:gyro
        }
    }
}
