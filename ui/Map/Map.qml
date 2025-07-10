import QtQuick 2.0
import QtLocation 5.12
import QtPositioning 5.12

Rectangle{
    id: map
    color: "transparent"
    anchors{
        fill: parent

    }
    Plugin{
        id: mapPlugin
        name: "osm"
    }

    Map{
        anchors.fill:parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(12.9158242,77.6317164)
        zoomLevel: 14
    }
    width: parent.width
}
