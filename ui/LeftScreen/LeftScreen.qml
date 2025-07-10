import QtQuick 2.0
import Style 1.0
Rectangle {
    id: leftScreen
    clip: true

    anchors{
        top: parent.top
        bottom: parent.bottom
        left: parent.left

    }
    color: "black"
    width: parent.width / 3
}
