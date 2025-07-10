import QtQuick 2.0
import Style 1.0
import QtQuick.Layouts 1.3
import QtWebEngine 1.8


Rectangle {
    id: spotify
    anchors.fill: parent
     color: Style.isDark ? Style.lightblack : Style.lightwhite



//    Image {
//        id: icon
//        width: parent.height/30
//        height: parent.height/30
//        source: "qrc:/LaunchpadIcons/spotify.svg"
//        anchors.leftMargin: parent.height/8
//        anchors.left: parent.left
//        anchors.top:parent.top
//        anchors.topMargin: parent.height/8
//        fillMode:Image.PreserveAspectFit
//    }


//    Text {
//        text: qsTr("Spotify ")
//        anchors.leftMargin: 18
//        anchors.left: icon.right
//        font.pixelSize: parent.height/40
//        anchors.top:parent.top
//        anchors.topMargin: parent.height/8
//        color: Style.isDark ?Style.white : Style.black

//    }


//    Image {
//        id: spoty
//        width: parent.height/30
//        height: parent.height/30
//        source: "qrc:/LaunchpadIcons/spotify.svg"
//        anchors.left:qrcode.right
//        anchors.leftMargin: parent.height/20
//        anchors.top:icon.bottom
//        anchors.topMargin: parent.height/6
//        fillMode:Image.PreserveAspectFit
//    }



//    Text {
//        id:txt
//        text: qsTr("Spotify")
//        anchors.leftMargin: parent.height/50
//        anchors.left: spoty.right
//        anchors.top:icon.bottom
//        anchors.topMargin: parent.height/6
//        font.pixelSize: parent.height/45
//        color: Style.isDark ?Style.white : Style.black


//    }

//    Image {
//        id: qrcode
//        source: "qrc:/Images/spotifyQR.png"
//        anchors.top:icon.bottom
//        anchors.topMargin: parent.height/7
//        anchors.leftMargin: parent.height/8
//        anchors.left: parent.left
//         fillMode:Image.PreserveAspectFit
//         height: parent.height/5
//         width: parent.width/5
//    }


//    Column {
//        anchors.topMargin: parent.height / 60
//        anchors.top: spoty.bottom
//        anchors.left: spoty.left
//        spacing: parent.height / 100

//        Text {
//            text: qsTr("Log in to your Spotify account")
//            font.pixelSize: parent.height /4.8
//            color: Style.isDark ?Style.white : Style.black

//        }
//        Text {
//            text: qsTr("Scan the Qr to start the log in process")
//            font.pixelSize: parent.height/4.8
//            opacity: 0.5
//            color: Style.isDark ?Style.white : Style.black

//        }

//        Text {
//            text: qsTr("Don't have an Account ?")
//            font.pixelSize: parent.height/4.8
//            color: "blue"

//        }
//    }


    WebEngineView {
        anchors.fill: parent
        url: "https://open.spotify.com"
    }


}
