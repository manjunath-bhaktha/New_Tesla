import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0

Rectangle {
    id: root
    anchors.fill: parent
    color: Style.isDark ? Style.lightblack : Style.lightwhite

    Rectangle {
        id: trip
        width: parent.width * 0.95
        height: parent.height * 0.95
        color: Style.isDark ? Style.lightblack : Style.lightwhite
        anchors.centerIn: parent


        ColumnLayout{
            anchors.fill: parent
            spacing: 5

            Text {
                text: "Current Drive"
                font.bold: true
                font.pixelSize:trip.height * 0.03
                color: Style.isDark ?Style.white : Style.black
            }

            Row {

                Repeater {
                    model: ListModel {
                        ListElement { label: "Distance \n 0mi" }
                        ListElement { label: "Duration \n21min" }
                        ListElement { label: "Avg.Energy \n0 Wh/mi" }

                    }

                    Rectangle {
                        width: trip.width / 3
                        height: trip.height / 5
                          color: Style.isDark ? Style.sblack : Style.swhite
                        border.color: "grey"



                        Text {
                            anchors.centerIn: parent
                            text: model.label
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.WordWrap
                           font.pixelSize:trip.height * 0.025
                           color: Style.isDark ?Style.white : Style.black
                        }

                        MouseArea {
                            anchors.fill: parent

                        }
                    }
                }
            }

            Text {
                text: "Since Last Charge"
                font.bold: true
                font.pixelSize:trip.height * 0.03
                color: Style.isDark ?Style.white : Style.black
            }

            Row {

                Repeater {
                    model: ListModel {
                        ListElement { label: "Distance \n 133 mi" }
                        ListElement { label: "Total Energy \n31 kw" }
                        ListElement { label: "Avg.Energy \n231 Wh/mi" }

                    }

                    Rectangle {
                        width: trip.width / 3
                        height: trip.height / 5
                          color: Style.isDark ? Style.sblack : Style.swhite
                        border.color: "grey"



                        Text {
                            anchors.centerIn: parent
                            text: model.label
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.WordWrap
                            font.pixelSize:trip.height * 0.025
                            color: Style.isDark ?Style.white : Style.black
                        }

                        MouseArea {
                            anchors.fill: parent

                        }
                    }
                }
            }

            Text {
                text: "Trip A"
                font.bold: true
                font.pixelSize:trip.height * 0.03
            }

            Row {

                Repeater {
                    model: ListModel {
                        ListElement { label: "Distance \n 789mi" }
                        ListElement { label: "Total Energy \n179kw" }
                        ListElement { label: "Avg.Energy \n231 Wh/mi" }

                    }

                    Rectangle {
                        width: trip.width / 3
                        height: trip.height / 5
                         color: Style.isDark ? Style.sblack : Style.swhite
                        border.color: "grey"


                        Text {
                            anchors.centerIn: parent
                            text: model.label
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.WordWrap
                           font.pixelSize:trip.height * 0.025
                           color: Style.isDark ?Style.white : Style.black
                        }

                        MouseArea {
                            anchors.fill: parent
                        }
                    }
                }
            }

            Row{
                spacing: 1
                Text {
                    text: "odometer "
                    font.pixelSize:trip.height * 0.02
                    color: Style.isDark ?Style.white : Style.black
                }
                Text {
                    text: "10,042 mi "
                    font.bold: true
                    font.pixelSize:trip.height * 0.02
                    color: Style.isDark ?Style.white : Style.black
                }
            }

        }
    }
}

