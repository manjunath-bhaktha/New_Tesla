import QtQuick 2.0


Rectangle {
    id: rightScreen

    anchors{
        top: parent.top
        bottom: parent.bottom
        right: parent.right
        topMargin:header.height
    }

    color: "yellow"
    width: parent.width *  2/3
}

