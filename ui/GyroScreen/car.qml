import QtQuick 2.0
import QtQuick.Controls 2.12
import Style 1.0

Rectangle {
    anchors.fill: parent
    color: Style.isDark ? Style.lightblack : Style.lightwhite

    Image {
        fillMode: Image.PreserveAspectFit
        scale: 1.25
        source: Style.isDark
                ? "qrc:/Images/TESLA_DARK.png"
                : "qrc:/Images/TESLA.png"
        anchors.fill: parent
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
