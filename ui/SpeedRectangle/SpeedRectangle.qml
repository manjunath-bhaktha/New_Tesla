import QtQuick 2.14
import QtQuick.Controls 2.14
import QtGraphicalEffects 1.0
//import "../SpeedRectangle1"

Rectangle {
    id: rectangle1
    color: "transparent"
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: parent.height * 2 / 3

    FontLoader {
        id: customfont
        source: "qrc:/fonts/digital-7.ttf"
    }

    Text {
        id: speed2
        anchors.horizontalCenterOffset: 0
        anchors.top: parent.top
        anchors.topMargin: parent.height * .1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * .8
        font.pixelSize: parent.height / 8
        anchors.horizontalCenter: parent.horizontalCenter
        Component.onCompleted: timervalue.start()
    }

    property int timer: 0
    property real batteryLevel: 100 // Initial battery level
    property int rpm: 0 // Initial RPM value

    Timer {
        id: timervalue
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            if (timer == 0) {
                speed2.text = "P"
            } else if (timer == 15) {
                speed2.text = "E"
            } else if (timer == 30) {
                speed2.text = "S"
            }

            if (batteryLevel > 0) {
                batteryLevel -= 1;
                percentageValue.text = batteryLevel + "%";
                batteryProgressBar.value = batteryLevel / 100;
            }

            timer++;
            speed.text = timer;
            updateTemperature();
        }
    }


    Text {
        id: speed
        verticalAlignment: Text.AlignRight
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: speed2.bottom
        anchors.topMargin: parent.height * .1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * .6
        font.family: "Digital-7"
        font.pixelSize: parent.height / 3
        visible: currentMode !== ""
    }

    Text {
        id: kmhtext
        text: qsTr("Km/hr")
        anchors.horizontalCenterOffset: 0
        horizontalAlignment: Text.AlignHCenter
        anchors.top: speed.bottom
        anchors.topMargin: parent.height * .15
        anchors.horizontalCenter: speed.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * .4
        font.pixelSize: parent.height / 16
        width: rectangle1.width
        color: "black"
    }

    ProgressBar {
        id: batteryProgressBar
        anchors.top: kmhtext.bottom

        anchors.horizontalCenter: kmhtext.horizontalCenter
        width: parent.width * 0.4
        height: 30
        anchors.horizontalCenterOffset: 0
        anchors.topMargin: parent.height * .1

        background: Rectangle {
            id:bg
            color: "gray"
            border.color: "black"
            border.width: 2
            radius: 15

        }
        Image {
            id: charging
            source: "qrc:/images/Charging.png"
            anchors.horizontalCenter: bg.horizontalCenter
            anchors.verticalCenter: bg.verticalCenter
            height: bg.height
            width: bg.height
            z: 1
            visible: true


            SequentialAnimation {
                running: true
                loops: Animation.Infinite

                PropertyAction {
                    target: charging
                    property: "visible"
                    value: true
                }
                PauseAnimation { duration: 1000 }

                PropertyAction {
                    target: charging
                    property: "visible"
                    value: false
                }
                PauseAnimation { duration: 1000 }
                PropertyAction {
                    target: charging
                    property: "visible"
                    value: true
                }
            }
        }

        contentItem: Rectangle {
            width: Math.max(batteryProgressBar.width * batteryProgressBar.value, batteryProgressBar.width * 0.12) // Adjusted to ensure at least 5% width
            height: batteryProgressBar.height
            color: {
                if (batteryLevel >= 60)
                    return "green";
                else if (batteryLevel >= 25)
                    return "yellow";
                else
                    return "red";
            }
            border.color: "#120f0f"
            border.width: 2
            radius: 15 // Radius should match the progress bar's corner radius
            clip: true // Clip the contentItem to the rounded corners of the progress bar
            Behavior on width {
                NumberAnimation {
                    duration: 1000
                }
            }
        }

        Text {
            id: kmValue
            text: "100 km"
            font.italic: false
            font.bold: true
            anchors.verticalCenterOffset: 1
            anchors.right: parent.left
            anchors.rightMargin: 6
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: -59
            font.pixelSize: 16
            color: "black"
        }
        Text {
            id:chargingtxt
            text: qsTr("Charging!")
            anchors.top:parent.bottom
            anchors.topMargin: parent.height/2
            font.pixelSize:parent.height /2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            SequentialAnimation {
                running: true
                loops: Animation.Infinite

                PropertyAction {
                    target: chargingtxt
                    property: "visible"
                    value: true
                }
                PauseAnimation { duration: 1000 }

                PropertyAction {
                    target: chargingtxt
                    property: "visible"
                    value: false
                }
                PauseAnimation { duration: 1000 }
                PropertyAction {
                    target: chargingtxt
                    property: "visible"
                    value: true
                }
            }
        }

        Text {
            id: percentageValue
            text: "100%"
            font.bold: true
            anchors.verticalCenterOffset: 0
            anchors.right: parent.right
            anchors.left: parent.right
            anchors.leftMargin: 6
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: -32
            font.pixelSize: 16
            color: "black"
        }

        font.pointSize: 19
        value: batteryLevel / 100
    }
    Text {
        id: temperatureDisplay
        //width: 150
        font.bold: true
//        text: "Temperature: " + Math.floor(Math.random() * 31) + "°C"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/18
        width: parent.width/4
        font.pixelSize: 20
        visible: true // Set it visible by default

    }
    function updateTemperature() {
        // Generate random temperature between 0 and 30
        temperatureDisplay.text = "Temperature: " + Math.floor(Math.random() * 31) + "°C";
    }

}


