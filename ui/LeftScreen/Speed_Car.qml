import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import Style 1.0


Rectangle {
    id:speed_car
    anchors.fill: parent
    color: Style.isDark ? Style.lightblack : Style.lightwhite


    Rectangle{
        id:line
        anchors.top: parent.top
        anchors.topMargin: parent.height/12
        color: "grey"
        width: parent.width
        height: 1
    }

    Text {
        id: speed
        text: qsTr("75")
        anchors.left: parent.left
        anchors.leftMargin: parent.width/20
        anchors.top:line.bottom
        font.pixelSize: speed_car.height / 10
        color: Style.isDark ? Style.white : Style.black
    }

    Text {
        id: kph
        text: qsTr("KMPH")
        anchors.left: parent.left
        anchors.leftMargin: parent.width/18
        anchors.top:speed.bottom
        font.pixelSize: speed_car.height / 40
        color: Style.isDark ? Style.white : Style.black
        opacity:0.5
        font.bold: true
    }

    Text {
        id: mode
        text: qsTr("Chill")
        anchors.bottom: line.top
        anchors.bottomMargin: parent.height/30
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: parent.height/40
        opacity: 0.6
    }

    Image{
        id:autopilots
        source: "qrc:/Images/autopilot.png"
        anchors.centerIn: parent
        width:parent.width
        anchors.bottom: line.top
        anchors.bottomMargin: parent.height/30
        fillMode: Image.PreserveAspectFit

    }

    Rectangle{
         id:limit
        anchors.right: parent.right
        anchors.top:line.bottom
        height: parent.height/10
        color: "transparent"
        width: parent.width/10

        Text {
            id:limits
            text: qsTr("SPEED \nLIMIT")
            anchors.top:parent.top
            font.pixelSize: speed_car.height / 50
            color: Style.isDark ? Style.white : Style.black
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {

            text: qsTr("65")
            anchors.top: limits.bottom
            font.pixelSize: speed_car.height / 50
             color: Style.isDark ? Style.white : Style.black
            opacity:0.5
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

    }

    Rectangle{
         id:set
        anchors.right: limit.left
        anchors.rightMargin: parent.width/20
        anchors.top:line.bottom
        height: parent.height/10
        color: "transparent"
        width: parent.width/10

            Text {
                id:sets
                text: qsTr("75")
                anchors.top:parent.top
                font.pixelSize: speed_car.height / 50
                color: Style.isDark ? Style.white : Style.black
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                id: max
                text: qsTr("MAX")
                anchors.top: sets.bottom
                font.pixelSize: speed_car.height / 50
                color: "blue"
                opacity:0.5
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
            }
    }
    Rectangle {
        id: swipe
        width: parent.width / 2
        height: parent.height
        color: "transparent"
        opacity: 0
        anchors.right: parent.right
        anchors.top: parent.top
        z: 100
        visible: true

        MouseArea {
            id: swipeArea
            anchors.fill: parent
            property real startY: 0
            property real distance: 0
            drag.axis: Drag.YAxis

            onPressed: {
                starty = mouse.y
            }

            onReleased: {
                if (distance > parent.width * 0.25) {
                    currentindexvalue1=0;

                }
                distance = 0
            }

            onPositionChanged: {
                distance = mouse.y - startY
            }
        }
    }

}
