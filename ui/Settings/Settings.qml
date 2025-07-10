import QtQuick 2.0

Rectangle{
    id: settings
    color: "red"
    Text {
        id: name
        text: qsTr("Settings")
        anchors.centerIn: parent
    }
}
