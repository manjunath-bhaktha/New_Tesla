import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0

Rectangle {
    id: root
    anchors.fill: parent
   color: Style.isDark ? Style.lightblack : Style.lightwhite


    property int volumeLevel: 50


    Rectangle {
        id: navigation
        width: parent.width * 0.95
        height: parent.height * 0.95
         color: Style.isDark ? Style.lightblack : Style.lightwhite
        anchors.centerIn: parent


        ColumnLayout{
           anchors.fill: parent
            spacing: 8


            Column{
                spacing:5

            Text {
                text: "Navigation Volume"
                font.bold: true
                font.pixelSize:navigation.height * 0.03
                color: Style.isDark ?Style.white : Style.black
            }

            Row{
                spacing: 10

            Rectangle{
               id:volume
               height: navigation.height/8
               width:navigation.width/2.7
               radius:10
                  color: Style.isDark ? Style.sblack : Style.swhite
                 border.color: "grey"


                 Text {
                     id: plus
                     text: qsTr("+")
                     anchors.left: parent.left
                     anchors.leftMargin:parent.height/6
                     anchors.verticalCenter: parent.verticalCenter
                     font.pixelSize: parent.height/2
                     color: Style.isDark ?Style.white : Style.black

                     MouseArea {
                         anchors.fill: parent
                         onClicked: {
                             if (volumeLevel < 100) volumeLevel += 10
                         }
                     }
                 }

                 // Bar background
                 Rectangle {
                     id: barBackground
                     height: volume.height /6
                     width: volume.width /1.7
                     radius: height / 2
                     color: "#c0c0c0"
                     anchors.centerIn: parent

                     Rectangle {
                         width: barBackground.width * (volumeLevel / 100)
                         height: parent.height
                         radius: height / 2
                         color: "#007bff"
                     }
                 }

                 Text {
                     id: minus
                     text: qsTr("-")
                     anchors.right: parent.right
                     anchors.rightMargin:parent.height/6
                     anchors.verticalCenter: parent.verticalCenter
                     font.pixelSize: parent.height/1.5
                     color: Style.isDark ?Style.white : Style.black

                     MouseArea {
                         anchors.fill: parent
                         onClicked: {
                             if (volumeLevel > 0) volumeLevel -= 10
                         }
                     }
                 }
            }


            Rectangle{
               color: Style.isDark ? Style.sblack : Style.swhite
               height: navigation.height/8
               width:navigation.width/7
               radius:10
               border.color: "grey"

               Image {
                          source: "qrc:/Images/mute.png"
                          anchors.centerIn: parent
                          fillMode: Image.PreserveAspectFit
                          height: parent.height / 3
                          width: parent.width / 3
                      }

            }

            }
            }

              ColumnLayout{
                  spacing: 3


            RowLayout {
                Switch { checked: true }

                Text {
                    text: "Automatic Navigation"
                    font.pixelSize: navigation.height * 0.027
                    color: Style.isDark ?Style.white : Style.black
                }

}
                    Text {
                        text: "Automatically route to Home, Work or next calendar event upon entry. "
                        font.pixelSize: navigation.height * 0.02
                         opacity:0.7
                          color: Style.isDark ?Style.white : Style.black

                    }

                }


              ColumnLayout{
                  spacing: 3


            RowLayout {
                Switch { checked: true }

                Text {
                    text: "Trip Planner"
                    font.pixelSize: navigation.height * 0.027
                    color: Style.isDark ?Style.white : Style.black
                }

}
                    Text {
                        text: "Adds SuperCharger stops in necessary."
                        font.pixelSize: navigation.height * 0.02
                        opacity:0.7
                         color: Style.isDark ?Style.white : Style.black

                    }

                }



              ColumnLayout{
                  spacing: 3


            RowLayout {
                Switch { checked: true }

                Text {
                    text: "Online Routing"
                    font.pixelSize: navigation.height * 0.027
                    color: Style.isDark ?Style.white : Style.black
                }

}
                    Text {
                        text: "Finds optimal routes based on tarffic condition"
                        font.pixelSize: navigation.height * 0.02
                         opacity:0.7
                          color: Style.isDark ?Style.white : Style.black

                    }

                }

              RowLayout {
                  Switch { checked: true }

                  Text {
                      text: "Avoid tolls"
                      font.pixelSize: navigation.height * 0.03
                      color: Style.isDark ?Style.white : Style.black
                  }
              }
        }
    }
}

