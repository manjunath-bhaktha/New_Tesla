import QtQuick 2.9
import QtQuick.Controls 2.5
import QtMultimedia 5.15
import Style 1.0
import QtWebEngine 1.8

Rectangle {
    id: root
    anchors.fill: parent
    color: Style.isDark ? Style.lightblack : Style.lightwhite


    WebEngineView {
        anchors.fill: parent
       url: "https://www.youtube.com"
    }



}
