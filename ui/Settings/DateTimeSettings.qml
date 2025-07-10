
import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "../../components"
import Style 1.0


Rectangle {
    id: dateTimeSettings
    anchors {
        top: parent.top
        bottom: parent.bottom
        right: parent.right
        left: parent.left
    }
    color: Style.background

    Rectangle{
        id:datetime
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left:parent.left
        height: parent.height * 0.2
        color:"transparent"

        Text {
            id: text1
            text: qsTr("Date & Time")
            font.bold: true
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin:parent.height / 3
            font.pixelSize: parent.height /5
        }

        Rectangle {
            id:timeset
            anchors.top: datetime.bottom
            anchors.right: parent.right
            anchors.left:parent.left
            height:parent.height /4
            color: "transparent"

            Text {
                id:setauto
                text: qsTr("Set time Automatically:")
                anchors.top: timeset.top
                anchors.left: timeset.left
                font.pixelSize: timeset .height /1.5
                anchors.leftMargin: timeset.height /1.2
            }

            PrefSwitch{
                id:switch1
                anchors.top:timeset.top
                anchors.right:timeset.right
                width: timeset.width *0.1
                height:timeset.height
            }

        }

        Rectangle{
            id:datetimes
            anchors.top: timeset.bottom
            anchors.right: parent.right
            anchors.left:parent.left
            height:parent.height /1.5
            color: "transparent"

            Text {
                id:date
                text: qsTr("Date")
                anchors.top: datetimes.top
                anchors.left: datetimes.left
                font.pixelSize: datetimes .height /5
                anchors.leftMargin: datetimes.height /3
                opacity: 0.5
            }
            Text {
                id:date1
                text: qsTr("March 11,2024")
                anchors.top: date.bottom
                anchors.left: datetimes.left
                font.pixelSize: datetimes .height /5
                anchors.leftMargin: datetimes.height /3
                opacity: 0.5
            }
            Text {
                id:time
                text: qsTr("Time")
                anchors.bottom: time1.top
                anchors.left: datetimes.left
                font.pixelSize: datetimes .height /5
                anchors.leftMargin: datetimes.height /3
                opacity: 0.5
            }
            Text {
                id:time1
                text: qsTr("2:45PM")
                anchors.bottom: datetimes.bottom
                anchors.left: datetimes.left
                font.pixelSize: datetimes .height /5
                anchors.leftMargin: datetimes.height /3
                opacity: 0.5
            }



        }

        Rectangle {
            id:timezone
            anchors.top: datetimes.bottom
            anchors.right: parent.right
            anchors.left:parent.left
            height:parent.height * 1.1
            color: "transparent"

            Image {
                id:line1
                anchors.topMargin: timezone.height /8
                anchors.top:timezone.top
                width: parent.width
                source: "qrc:/images/HorizontalSeparator.png"
                visible: true
            }


            Text {
                id:timezonetxt1
                text: qsTr("Set time zone Automatically")
                anchors.top: timezone.top
                anchors.left: timezone.left
                font.pixelSize: timezone .height /6
                anchors.leftMargin: timezone.height /5
                anchors.topMargin: timezone.height /4
            }
            PrefSwitch{
                id:switch2
                anchors.top: timezone.top
                anchors.right: timezone.right
                width: timeset.width *0.1
                height:timeset.height
                anchors.topMargin: timezone.height /4
            }
            Text {
                id:timezonetxt2
                text: qsTr("Use 24-hours format ")
                anchors.bottom: timezone.bottom
                anchors.left: timezone.left
                font.pixelSize: timezone .height /6
                anchors.leftMargin: timezone.height /5
                anchors.topMargin: timezone.height /4
            }
            PrefSwitch{
                id:switch3
                anchors.bottom: timezone.bottom
                anchors.right: timezone.right
                width: timeset.width *0.1
                height:timeset.height
                anchors.topMargin: timezone.height /4
            }
            Image {
                id:line2
                anchors.topMargin: timezone.height /8
                anchors.top:timezone.bottom
                width: parent.width
                source: "qrc:/images/HorizontalSeparator.png"
                visible: true
            }
        }
    }
}




