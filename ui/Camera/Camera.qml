import QtQuick 2.0
import QtMultimedia 5.4

Rectangle {
    id: camera
    color: "red"
    width: parent.width * 2/3
    height: parent.height

    Text {
        id: name
        text: qsTr("Camera")
        anchors.centerIn: parent
    }

    Camera {
        id: camera1
        objectName: "camera"
        captureMode: Camera.CaptureStillImage
    }

    VideoOutput {
        anchors.fill: parent
        source: camera1
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            camera1.imageCapture.capture()
        }
    }
}
