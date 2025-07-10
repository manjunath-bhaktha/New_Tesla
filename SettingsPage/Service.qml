import QtQuick 2.0
import Style 1.0


Rectangle {
    id: root
    anchors.fill: parent
    color: Style.isDark ? Style.lightblack : Style.lightwhite

    Rectangle {
        id: service
        width: parent.width * 0.95
        height: parent.height * 0.95
        color: Style.isDark ? Style.lightblack : Style.lightwhite
        anchors.centerIn: parent


        Image{
            id:car
            source: "qrc:/Images/model 3-1_new.svg"
            anchors.centerIn: parent
            height: parent.height/2
            width: parent.width/4
            fillMode: Image.PreserveAspectFit



            Text {
                id: name
                text: qsTr("45 psi")
                anchors.left:parent.right
                anchors.top: parent.top
                font.pixelSize: parent.height /20
                color: Style.isDark ?Style.white : Style.black
            }

            Text {

                text: qsTr("45 psi")
                anchors.left:parent.right
                anchors.bottom:  parent.bottom
                font.pixelSize: parent.height /20
                color: Style.isDark ?Style.white : Style.black
            }

            Text {

                text: qsTr("45 psi")
                anchors.right:parent.left
                anchors.bottom:  parent.bottom
                font.pixelSize: parent.height /20
                color: Style.isDark ?Style.white : Style.black
            }

            Text {
                text: qsTr("45 psi")
                anchors.right:parent.left
                anchors.top: parent.top
                font.pixelSize: parent.height /20
                color: Style.isDark ?Style.white : Style.black
            }
        }


    }
}

