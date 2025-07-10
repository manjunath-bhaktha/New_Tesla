import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import Style 1.0

Rectangle {
    id: header
    height: parent.height / 15
     color: Style.isDark ? Style.bgblack : Style.bgwhite
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right

    QtObject {
        id: appObject
        readonly property string weatherApiUrl: "http://api.openweathermap.org/data/2.5/weather?"
        readonly property string apiKey: "47093641e3417a718e442d2e4680c400"
        readonly property string method: "GET"

        property double lat: 12.9716
        property double lon: 77.5946
        property double temp: 0.0
        property bool isCelsius: true
    }

    Component.onCompleted: weatherRequest()

    function weatherRequest() {
        var req = new XMLHttpRequest();
        var unit = appObject.isCelsius ? "metric" : "imperial";
        var url = `${appObject.weatherApiUrl}lat=${appObject.lat}&lon=${appObject.lon}&units=${unit}&appid=${appObject.apiKey}`;

        req.open(appObject.method, url);
        req.onreadystatechange = function () {
            if (req.readyState === XMLHttpRequest.DONE && req.status === 200) {
                let result = JSON.parse(req.responseText);
                appObject.temp = result.main.temp;
            }
        }
        req.send();
    }

    Rectangle {
        id: airbag
        height: parent.height
        width: parent.width / 12
        anchors.right: parent.right
        color: Style.isDark ? Style.lightblack : Style.lightwhite
        anchors.verticalCenter: parent.verticalCenter
        radius: 5

        Image {
            id: bagimg
            source: "qrc:/Images/airbag.svg"
            height: parent.height / 3
            width: parent.width / 3
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
        }

        Text {
            id: passsss
            text: qsTr("PASSENGER")
            anchors.top: parent.top
            anchors.topMargin: parent.height / 4
            anchors.left: bagimg.right
            font.pixelSize: parent.height / 4
            color: "black"
            font.bold: true
        }
        Text {
            id: airbagtxt
            text: qsTr("AIRBAG")
            anchors.top: passsss.bottom
            anchors.left: bagimg.right
            font.pixelSize: parent.height / 4
            color: Style.isDark ? Style.white : Style.black
            font.bold: true
        }
        Text {
            id: on
            text: qsTr("ON")
            anchors.top: passsss.bottom
            anchors.left: airbagtxt.right
            anchors.leftMargin: parent.height / 8
            font.pixelSize: parent.height / 5
            color: "#f8d00d"
            font.bold: true
        }
    }

    Rectangle {
        id: temp
        height: parent.height
        width: parent.width / 15
        anchors.rightMargin: 20
        anchors.right: airbag.left
        color: "transparent"

        Image {
            id: sun
            source: "qrc:/Images/sun.svg"
            height: parent.height / 3.5
            width: parent.width / 3.5
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
        }

        Text {
            text: `${appObject.temp.toFixed(0)}°C`
            anchors.left: sun.right
            font.pixelSize: parent.height / 2.9
            anchors.verticalCenter: parent.verticalCenter
            color: Style.isDark ? Style.white : Style.black
            font.bold: true
        }
    }

    Text {
        id: timeText
        text: Qt.formatTime(new Date(), "hh:mm AP")
        anchors.right: temp.left
        anchors.rightMargin: 20
        font.pixelSize: parent.height / 2.9
        anchors.verticalCenter: parent.verticalCenter
        color: Style.isDark ? Style.white : Style.black
        font.bold: true

        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: timeText.text = Qt.formatTime(new Date(), "hh:mm AP")
        }
    }

    Image {
        source: Style.isDark ? "qrc:/Images/lock.svg" : "qrc:/Images/lock dark.svg"
        width: parent.height * 0.7
        height: parent.height * 0.7
        fillMode: Image.PreserveAspectFit
        anchors.right: icon.left
        anchors.margins: parent.height / 4
        anchors.verticalCenter: parent.verticalCenter
    }

    Image {
        id: icon
        source: "qrc:/Images/icons.svg"
        width: parent.height * 0.7
        height: parent.height * 0.7
        fillMode: Image.PreserveAspectFit
        anchors.right: entry.left
        anchors.margins: parent.height / 4
        anchors.verticalCenter: parent.verticalCenter
    }

    Text {
        id: entry
        text: qsTr("Easy Enter")
        anchors.centerIn: parent
        font.pixelSize: parent.height * 0.3
        anchors.margins: parent.height / 4
        color: Style.isDark ? Style.white : Style.black
        font.bold: true
    }

    Image {
        source: "qrc:/Images/Sentry.svg"
        width: parent.height * 0.7
        height: parent.height * 0.7
        fillMode: Image.PreserveAspectFit
        anchors.left: entry.right
        anchors.margins: parent.height / 4
        anchors.verticalCenter: parent.verticalCenter
    }

    RowLayout {
        id: gears
        anchors.left: parent.left
        anchors.leftMargin: 20
        spacing: 10
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Repeater {
            model: ["P", "R", "N", "D"]

            Text {
                text: modelData
                font.pixelSize: parent.height / 2.9
                color: Style.isDark ? Style.white : Style.black
                font.bold: true
            }
        }
    }

    Image {
        id: autopilot
        source: Style.isAutopilot
                ? "qrc:/Images/steering wheel.svg"
                : "qrc:/settings_Icon/steering wheel-small.svg"
        anchors.left: gears.right
        anchors.leftMargin: 20
        height: parent.height / 2
        width: height
        fillMode: Image.PreserveAspectFit
        anchors.verticalCenter: parent.verticalCenter
    }
}
