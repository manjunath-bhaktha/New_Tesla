import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0

Rectangle {
    id: root
    anchors.fill: parent
     color: Style.isDark ? Style.lightblack : Style.lightwhite

    Rectangle {
        id: safety
        width: parent.width * 0.95
        height: parent.height * 0.95
         color: Style.isDark ? Style.lightblack : Style.lightwhite
        anchors.centerIn: parent


        ColumnLayout{
            spacing: 15


            Rectangle{
               id:sos
               height: safety.height/6
               width:safety.width/3.5
               radius:5
                 color: Style.isDark ? Style.sblack : Style.swhite
                border.color: "grey"

               Text {
                   id:soss
                   text: qsTr("SOS")
                   anchors.centerIn: parent
                   font.pixelSize: parent.height/4
                   color: Style.isDark ?Style.white : Style.black
               }

               Text {
                   text: qsTr("Emergency Call")
                   anchors.top:  soss.bottom
                   font.pixelSize: parent.height/6
                   anchors.horizontalCenter: parent.horizontalCenter
                   color: Style.isDark ?Style.white : Style.black
               }
            }

            RowLayout {
                Switch { checked: true }

                Text {
                    text: "Allow Mobile Access"
                    font.pixelSize: safety.height * 0.02
                    color: Style.isDark ?Style.white : Style.black
                }
            }

            RowLayout {
                Switch { checked: true }

                Text {
                    text: "Allow Keyless Driving"
                    font.pixelSize: safety.height * 0.02
                    color: Style.isDark ?Style.white : Style.black
                }
            }

            Rectangle{
               id:poweroff
               height: safety.height/12
               width:safety.width/3.5
               radius:5
                 color: Style.isDark ? Style.sblack : Style.swhite
               border.color: "grey"

               Text {
                   text: qsTr("Power Off")
                   anchors.centerIn: parent
                   font.pixelSize: parent.height/3
                   color: Style.isDark ?Style.white : Style.black


               }

            }

}



    }
}

