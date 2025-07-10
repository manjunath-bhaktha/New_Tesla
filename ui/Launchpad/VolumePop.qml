import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Qt5Compat.GraphicalEffects
import Style 1.0

Popup {
    id: volumepop
    width: parent.width / 4
    height: parent.height / 9

    // Right-aligned
    x: parent.width - width
    y: footer.y - height

    background: Rectangle {
        anchors.fill: parent
        radius: 12
        color: Style.isDark ? Style.lightblack : Style.lightwhite
        border.width: 0

        Rectangle{
            id:adjust
            anchors.left: parent.left
            width: parent.height * 0.45
            height: parent.height * 0.45
            anchors.verticalCenter: parent.verticalCenter
            clip:true
            color: "transparent"

            Rectangle {
               color: Style.isDark ?Style.white : Style.black
                anchors.fill: parent
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Image{
            fillMode: Image.PreserveAspectFit
            source: "qrc:/Images/adjustments_dark.svg"
        }
                }
            }
        }


        Rectangle {
            id: slider
            height: parent.height/12
            width: parent.width * 0.65
            color: "gray"
            radius: height / 2
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: parent.height/4

            opacity: 0.8

            property real progressValue: 0.4
            Rectangle {
                id: progress
                height: parent.height
                width: slider.width * slider.progressValue
                color: "#3467FF"
                radius: height / 2
            }

            Rectangle {
                id: handle
                width: 25
                height: 25
                radius: width / 2
               color: Style.isDark ? Style.sblack : Style.swhite
                border.color: "#333"
                border.width: 1
                anchors.verticalCenter: parent.verticalCenter
                x: slider.progressValue * slider.width - handle.width / 2

                MouseArea {
                    anchors.fill: parent
                    drag.target: handle
                    drag.axis: Drag.XAxis
                    drag.minimumX: -handle.width / 2
                    drag.maximumX: slider.width - handle.width / 2

                    onPositionChanged: {
                        // Update progressValue based on handle position
                        let newVal = (handle.x + handle.width / 2) / slider.width;
                        slider.progressValue = Math.max(0, Math.min(1, newVal));
                    }
                }
            }
        }



    }

}
