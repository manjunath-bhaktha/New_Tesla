import QtQuick 2.9
import QtQuick.Controls 2.5

Rectangle {
    anchors.fill: parent
     color: "#eaeaea"

    property int selectedRow1: 0
    property int selectedRow2: 0
    property int selectedRow3: 0
    property int selectedRow4Col0: -1
    property int selectedRow4Col1: -1
    property bool isRow5AutoSelected: false

    Rectangle {
        id: controls
        width: parent.width * 0.95
        height: parent.height * 0.95
         color: "#eaeaea"
        anchors.centerIn: parent

        Column {
            anchors.fill: parent
            spacing: 20
            padding: 10

            // Row 1
            Row {
                width: parent.width
                height: parent.height * 0.12
                spacing: 0

                Repeater {
                    model: ["Off", "Parking", "Headlights", "Auto"]
                    delegate: Rectangle {
                        width: parent.width / 5.7
                        height: parent.height
                        color: selectedRow1 === index ?  "white" :"#d3d3d3"
                        border.color: "#cccccc"
                        border.width: 1

                        MouseArea {
                            anchors.fill: parent
                            onClicked: selectedRow1 = index
                        }

                        Text {
                            anchors.centerIn: parent
                            text: modelData
                            font.pixelSize: Math.max(10, parent.height * 0.1)

                        }
                    }
                }

                Rectangle {
                    width: parent.width * 0.02
                    height: parent.height
                    color: "transparent"
                }

                Rectangle {
                    width: parent.width / 5.7
                    height: parent.height
                    color: selectedRow1 === 4 ? "#007bff" : "white"
                    border.color: "#cccccc"
                    border.width: 1

                    MouseArea {
                        anchors.fill: parent
                        onClicked: selectedRow1 = 4
                    }

                    Text {
                        anchors.centerIn: parent
                        text: "Auto (Fog)"
                        font.pointSize: parent.height / 10
                        color: selectedRow1 === 4 ? "white" : "black"
                    }
                }
            }

            // Row 2
            Row {
                width: controls.width * 0.9
                height: parent.height * 0.12
                spacing: 0

                Repeater {
                    model: ["Fold Mirrors", "Child Lock", "Window Lock", "Glovebox"]
                    delegate: Rectangle {
                        width: parent.width / 4
                        height: parent.height
                        color: selectedRow2 === index ? "white" : "#d3d3d3"
                        border.color: "#cccccc"
                        border.width: 1

                        MouseArea {
                            anchors.fill: parent
                            onClicked: selectedRow2 = index
                        }

                        Text {
                            anchors.centerIn: parent
                            text: modelData
                            font.pixelSize: Math.max(10, parent.height * 0.1)
                        }
                    }
                }
            }

            // Row 3
            Row {
                width: controls.width * 0.9
                height: parent.height * 0.12
                spacing: 0

                Repeater {
                    model: ["Off", "Auto", "|", "||", "|||", "Auto"]
                    delegate: Rectangle {
                        width: parent.width / 6
                        height: parent.height
                        color: selectedRow3 === index ? "white" : "#d3d3d3"
                        border.color: "#cccccc"
                        border.width: 1

                        MouseArea {
                            anchors.fill: parent
                            onClicked: selectedRow3 = index
                        }

                        Text {
                            anchors.centerIn: parent
                            text: modelData
                            font.pixelSize: Math.max(10, parent.height * 0.1)
                        }
                    }
                }
            }

            // Row 4 (2 Columns)
            Row {
                width: parent.width
                height: parent.height * 0.35
                spacing: 30

                Repeater {
                    model: 2
                    delegate: Column {
                        width: parent.width / 2.7
                        height: parent.height
                        spacing: 0

                        property int colIndex: index
                        property var colData: colIndex === 0 ? ["Mirrors", "Steering"] : ["Recording", "Sentry"]

                        Repeater {
                            model: colData
                            delegate: Rectangle {
                                width: parent.width
                                height: parent.height / 2
                                color: (colIndex === 0 && selectedRow4Col0 === index) || (colIndex === 1 && selectedRow4Col1 === index)
                                       ? "#d3d3d3" : "white"
                                border.color: "#cccccc"
                                border.width: 1

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        if (colIndex === 0)
                                            selectedRow4Col0 = index
                                        else
                                            selectedRow4Col1 = index
                                    }
                                }

                                Text {
                                    anchors.centerIn: parent
                                    text: modelData
                                    font.pixelSize: Math.max(10, parent.height * 0.1)
                                }
                            }
                        }
                    }
                }
            }

            // Row 5 (Slider and Auto)
            Row {
                width: controls.width * 0.9
                height: parent.height * 0.09
                spacing: 0

                Rectangle {
                    width: parent.width * 0.82
                    height: parent.height
                    color: "white"
                    border.color: "#cccccc"
                    border.width: 1

                    Slider {
                        anchors.centerIn: parent
                        width: parent.width * 0.9
                        height: parent.height / 2
                        value: 0.5
                    }
                }

                Rectangle {
                    width: parent.width * 0.03
                    height: parent.height
                    color: "transparent"
                }

                Rectangle {
                    width: parent.width * 0.15
                    height: parent.height
                    color: isRow5AutoSelected ? "#d3d3d3" : "#007bff"
                    border.color: "#007bff"
                    border.width: 1

                    MouseArea {
                        anchors.fill: parent
                        onClicked: isRow5AutoSelected = !isRow5AutoSelected
                    }

                    Text {
                        anchors.centerIn: parent
                        text: "Auto"
                        color: isRow5AutoSelected ? "black" : "white"
                        font.bold: true
                        font.pixelSize: Math.max(10, parent.height * 0.1)
                    }
                }
            }
        }
    }
}
