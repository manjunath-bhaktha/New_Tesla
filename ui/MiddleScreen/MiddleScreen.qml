import QtQuick 2.0
import Style 1.0
Rectangle {
    id: middleScreen
    anchors{
        top: parent.top
        bottom: parent.bottom
        right: rightScreen.left
        left: leftScreen.right

    }
    color: Style.background
}
