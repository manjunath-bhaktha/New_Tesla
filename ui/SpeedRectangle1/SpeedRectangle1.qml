import QtQuick 2.14
import QtQuick.Controls 2.14
import "../SpeedRectangle"

Rectangle {
    id:rectangle2
    height: parent.height * 1/3
    anchors{
        bottom: parent.bottom
        right: parent.right
        left: parent.left
    }

    color: "transparent"

    property string currentMode: "P" // Initial mode is parking

    Text {
        id: modeText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        text: currentMode
        font.bold: true
        font.pixelSize: parent.height /3
    }
    Text {
        id: odometerText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: modeText.bottom
        anchors.left: parent.left
        text: "ODO"
        anchors.topMargin: 10
        font.bold: false
        font.pixelSize: modeText.height / 3

        Text {
            id: odometerValueText
            anchors.top: parent.bottom
            anchors.left: parent.left
            text: "km 000000" // Sample speed value
            font.pixelSize: modeText.height / 6

        }
    }
    Timer {
        interval: 1500 // Interval in milliseconds
        running: true
        repeat: true
        property int odometerValue: 0 // Initial odometer value
        onTriggered: {
            // Increment odometer value
            if (odometerValue < 1000) {
                odometerValue++;
            } else {
                // Reset odometer value to 0 when it reaches 1000
                odometerValue = 0;
            }

            // Update the odometerValueText with the updated value
            var formattedValue = ("000000" + odometerValue).slice(-6);
            odometerValueText.text = "km " + formattedValue;
        }
    }

    Text {
        id: speedText
        anchors.top: modeText.bottom
        anchors.right: parent.right
        text: "TRIP"
        anchors.topMargin: 10
        font.bold: false
        font.pixelSize: modeText.height / 3

        Text {
            id: speedValueText
            anchors.top: parent.bottom
            anchors.left: parent.left
            text: "km 0000" // Sample speed value
            font.pixelSize: modeText.height / 6

        }
    }


    Timer {
        interval: 1500 // Interval in milliseconds
        running: true
        repeat: true
        property int speedValue: 0 // Initial speed value
        onTriggered: {
            // Increment speed value
            if (speedValue < 100) {
                speedValue++;
            } else {
                // Reset speed value to 0 when it reaches 100
                speedValue = 0;
            }

            // Update the speedValueText with the updated value
            var formattedValue = ("0000" + speedValue).slice(-4);
            speedValueText.text = "km " + formattedValue;
        }
    }

    function changeMode() {
        switch (currentMode) {
        case "P":
            currentMode = "D";
            break;
        case "D":
            currentMode = "R";
            break;
        case "R":
            currentMode = "P";
            break;
        }
    }

    Timer {
        interval: 15000 // 15 seconds
        running: true
        repeat: true
        onTriggered: {
            changeMode();
            modeText.text = currentMode;
        }
    }
}

