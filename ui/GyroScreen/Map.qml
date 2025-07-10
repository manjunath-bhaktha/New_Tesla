import QtQuick 2.0
import QtLocation 5.12
import QtQuick.Layouts 1.3
import QtPositioning 5.12
import Style 1.0
import QtWebEngine 1.8

Rectangle {
    id: map
 color: Style.isDark ? Style.lightblack : Style.lightwhite
    anchors.fill: parent
    Text {

        text: qsTr("MAP")
        anchors.centerIn: parent
        color: Style.isDark ?Style.white : Style.black

    }

//    Plugin {
//        id: mapPlugin
//        name: "osm"
//    }

//    Map {
//        anchors.fill: parent
//        plugin: mapPlugin
//        center: QtPositioning.coordinate(12.9716, 77.5946)
//        zoomLevel: 40
//        }




    WebEngineView {
        anchors.fill: parent
        url: "https://www.google.com/maps"
    }


}
