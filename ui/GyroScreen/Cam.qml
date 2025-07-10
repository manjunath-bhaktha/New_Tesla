//import QtQml 2.1
//import QtQuick 2.14
//import QtMultimedia 5.1
//import QtQuick.Window 2.14
//import QtQuick.Controls 2.1
//import QtGraphicalEffects 1.12
//import Qt.labs.folderlistmodel 2.4
//import QtQuick.Controls.Styles 1.4
//import QtQuick.Extras 1.4
//import QtQuick.Layouts 1.3

//Rectangle {
//   id: camerarecorder
//    visible: true
//    anchors.fill: parent

//    MediaPlayer {
//        id: mediaplayer
//        autoPlay: false
//    }

//    Text {
//        id: no_cameras
//        anchors.centerIn: parent
//        text: "No camera detected! Please check the connection and reboot."
//        font.pixelSize: 20
//        color: "#f7f6f6"

//    }

//    VideoOutput {
//        id: camera_feed
//        anchors.fill: parent
//        source: mediaplayer

//        RowLayout {
//            anchors.bottom: parent.bottom
//            anchors.horizontalCenter: parent.horizontalCenter
//            spacing: 10

//            Repeater {
//                id: camera_buttons
//                model: live_camera.liveCamera_get_count()

//                Button {
//                    width: parent.width * 0.1
//                    height: parent.height * 0.1
//                    text: live_camera.liveCamera_get_camera_name(index)
//                    onClicked: {
//                        live_camera.liveCamera_update_gst_pipeline(text)
//                        mediaplayer.stop()
//                        mediaplayer.source = live_camera.liveCamera_gst_pipeline()
//                        mediaplayer.play()
//                    }
//                }
//            }
//        }
//    }

//    Component.onCompleted: {
//        if (live_camera.liveCamera_get_count() === 0) {
//            no_cameras.visible = true
//            camera_feed.visible = false
//        } else {
//            no_cameras.visible = false
//            camera_feed.visible = true

//            live_camera.liveCamera_update_gst_pipeline(camera_buttons.itemAt(0).text)
//            mediaplayer.stop()
//            mediaplayer.source = live_camera.liveCamera_gst_pipeline()
//            mediaplayer.play()
//        }
//    }

//}
import QtQuick 2.0
import QtQuick.Controls 2.12
import QtMultimedia 5.12
import Style 1.0

Rectangle {
    id: camera
    color: Style.isDark ? Style.lightblack : Style.lightwhite
    anchors.fill: parent

    Text {
        id: name
        text: qsTr("Camera")
        anchors.centerIn: parent

    }


//    Camera {
//        id: camera1
//        objectName: "camera"
//        deviceId: "/dev/video2"
//        captureMode: Camera.CaptureStillImage
//    }

    Image{
        id:bg
        source: "qrc:/Images/rearview.png"
        anchors.bottom: parent.bottom
        height: parent.height/1.7
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        z:1
    }


//    VideoOutput {
//        anchors.fill: parent
//        source: camera1
//        fillMode:VideoOutput.PreserveAspectCrop
//    }

    }




