import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtWebEngine 1.8
import QtQuick.Controls



Rectangle {
    id: calender
    anchors.fill: parent
    color: "#f7f6f6"


    WebEngineView {
        anchors.fill: parent
        url: "https://calendar.google.com/calendar/u/0/r?pli=1"
    }
}





//    Image {
//        id: icon
//        width: parent.height/30
//        height: parent.height/30
//        source: "qrc:/LaunchpadIcons/calendar.svg"
//        anchors.leftMargin: parent.height/8
//        anchors.left: parent.left
//        anchors.top:parent.top
//        anchors.topMargin: parent.height/12
//        fillMode:Image.PreserveAspectFit
//    }


//    Text {
//        text: qsTr("Calendar ")
//        anchors.leftMargin: 18
//        anchors.left: icon.right
//        font.pixelSize: parent.height/40
//        anchors.top:parent.top
//        anchors.topMargin: parent.height/12

//    }

//    Rectangle {
//        id:calendars
//        width: parent.width * 0.75
//        height: parent.height * 0.65
//        color: "#eaeaea"
//        anchors.centerIn: parent

//        Calendar {
//            id: calendar
//            anchors.fill: parent
//            frameVisible: false
//            selectedDate: new Date()

//            style: CalendarStyle {

//                dayDelegate: Item {
//                    readonly property color selectedDateColor: "#1976d2"
//                    readonly property color selectedTextColor: "white"
//                    readonly property color normalTextColor: "#333"
//                    readonly property color otherMonthTextColor: "#aaa"
//                    readonly property color todayBorderColor: "#ff9800"

//                    Rectangle {
//                        anchors.fill: parent
//                        color: styleData.selected ? selectedDateColor : "transparent"
//                        border.color: styleData.date.toDateString() === new Date().toDateString() ? todayBorderColor : "transparent"
//                        border.width: 1
//                    }

//                    Label {
//                        text: styleData.date.getDate()
//                        anchors.centerIn: parent
//                        color: styleData.selected ? selectedTextColor :
//                       (styleData.visibleMonth ? normalTextColor : otherMonthTextColor)
//                    }
//                }
//            }
//        }
//    }


//}






//    Text {
//        id:txt
//        text: qsTr("Enable Calendar Access  ")
//        anchors.leftMargin: parent.height/8
//        anchors.left: parent.left
//        font.pixelSize: parent.height/40
//        anchors.top:icon.bottom
//        anchors.topMargin: parent.height/7
//        font.bold: true

//    }

//    Text {
//        text: qsTr("Calendar access is disabled. On your phone, allow calendar
// access for the mobile app. ")
//        anchors.leftMargin: parent.height/8
//        anchors.left: parent.left
//        font.pixelSize: parent.height/45
//        anchors.top:txt.bottom
//        anchors.topMargin: parent.height/35
//        opacity:0.4

//    }


