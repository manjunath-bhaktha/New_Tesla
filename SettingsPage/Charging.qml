import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0

Rectangle {
    id: root
    anchors.fill: parent
 color: Style.isDark ? Style.lightblack : Style.lightwhite

    Rectangle {
        id: charging
        width: parent.width * 0.95
        height: parent.height * 0.95
         color: Style.isDark ? Style.lightblack : Style.lightwhite
        anchors.centerIn: parent


        ColumnLayout{
            spacing: 20


            Rectangle{

               height: charging.height/12
               width:charging.width/3.5
               radius:10
                color: Style.isDark ? Style.sblack : Style.swhite
               border.color: "grey"

               Text {
                   text: qsTr("Stop Charging")
                   anchors.centerIn: parent
                   font.pixelSize: parent.height/3
                   color: Style.isDark ? Style.lightblack : Style.lightwhite
               }
            }


            ColumnLayout{
                spacing: 10

            Text {

                text: qsTr("Stop Charging")
                font.pixelSize: charging.height * 0.02
                color: Style.isDark ?Style.white : Style.black
            }

            Text {

                text: qsTr("19,78 EUR")
                font.pixelSize: charging.height * 0.02
                color: Style.isDark ?Style.white : Style.black
            }

            Text {

                text: qsTr("Bengaluru,INDIA \nMon21.Apr 6:11pm")
                font.pixelSize: charging.height * 0.02
                color: Style.isDark ?Style.white : Style.black
            }

            Text {

                text: qsTr("Supercharging Tips")
                font.pixelSize: charging.height * 0.02
                color: "#3467FF"
            }



            }
}
    }
}

