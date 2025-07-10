import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.3
import Style 1.0
Rectangle {
    anchors.fill: parent
    color: Style.isDark ? Style.lightblack : Style.lightwhite

    property int currentIndex: -1
    property string selectedName: ""
    property string selectedSong: ""
    property string selectedImage: ""

    function updateDetails() {
        if (currentIndex >= 0) {
            let station = radioList.model.get(currentIndex)
            selectedName = station.name
            selectedSong = station.song
            selectedImage = station.imageUrl
        }
    }

    Rectangle {
        id: currenttrack
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.topMargin: parent.height * 0.1
        height: parent.height * 0.1
         color: Style.isDark ? Style.lightblack : Style.lightwhite

        Row {
            id: headerRow
            width: parent.width
            height: parent.height
            spacing: parent.width * 0.03
            anchors.verticalCenter: parent.verticalCenter
            padding: parent.height * 0.1

            // Station Image
            Image {
                id: currentImage
                source: selectedImage
                width: parent.height * 0.8
                height: parent.height * 0.8
                fillMode: Image.PreserveAspectFit
                visible: selectedImage !== ""
            }

            // Station Info and Playback Controls in one Row
            Row {
                id: contentRow
                spacing: parent.width * 0.05
                height: parent.height
                width: parent.width - currentImage.width - (parent.width * 0.1)

                // Info
                Column {
                    id: stationInfo
                    spacing: 4
                    width: contentRow.width * 0.6
                    anchors.verticalCenter: parent.verticalCenter

                    Text {
                        text: selectedSong !== "" ? selectedSong : "No Station Selected"
                        font.pixelSize: currenttrack.height * 0.25
                        font.bold: true
                        color: Style.isDark ?Style.white : Style.black
                        wrapMode: Text.Wrap

                    }

                    Text {
                        text: selectedName
                        font.pixelSize: currenttrack.height * 0.2
                        color: Style.isDark ?Style.white : Style.black
                        wrapMode: Text.Wrap

                    }
                }

                // Controls
                Row {
                    id: playbackControls
                    spacing: parent.width * 0.015
                    anchors.verticalCenter: parent.verticalCenter

                    // Previous Button
                    Rectangle {
                        width: currenttrack.height * 0.4
                        height: currenttrack.height * 0.4
                        color: "transparent"

                        Image {
                            anchors.centerIn: parent
                            source: "qrc:/Images/previous.png" // Replace with your actual image path
                            fillMode: Image.PreserveAspectFit
                            width: parent.width * 0.8
                            height: parent.height * 0.8
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("Previous clicked")
                                // Add your logic here
                            }
                        }
                    }

                    // Play/Pause Button
                    Rectangle {
                        width: currenttrack.height * 0.4
                        height: currenttrack.height * 0.4
                        color: "transparent"

                        Image {
                            anchors.centerIn: parent
                            source: "qrc:/Images/play.png" // Replace with your actual image path
                            fillMode: Image.PreserveAspectFit
                            width: parent.width * 0.8
                            height: parent.height * 0.8
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("Play/Pause clicked")
                                // Add your logic here
                            }
                        }
                    }

                    // Next Button
                    Rectangle {
                        width: currenttrack.height * 0.4
                        height: currenttrack.height * 0.4
                        color: "transparent"

                        Image {
                            anchors.centerIn: parent
                            source: "qrc:/Images/next.png" // Replace with your actual image path
                            fillMode: Image.PreserveAspectFit
                            width: parent.width * 0.8
                            height: parent.height * 0.8
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("Next clicked")
                                // Add your logic here
                            }
                        }
                    }
                }


            }
        }
    }

    Rectangle{
        anchors.bottom: topbar.top
        height:2
        width:parent.width
        color: "grey"
        opacity: 0.6
    }

    Rectangle {
        id: topbar
        anchors.top: currenttrack.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height / 14
         color: Style.isDark ? Style.lightblack : Style.lightwhite

        Text {
            text: "Radio"
            color: Style.isDark ?Style.white : Style.black
            font.bold: true
            font.pixelSize: parent.height / 4
            anchors.left: parent.left
            anchors.leftMargin: parent.height / 3
            anchors.verticalCenter: parent.verticalCenter

        }

        Row {
            spacing: 15
            anchors.centerIn: parent
            Repeater {
                model: [
                    { title: "Favorites" },
                    { title: "Station" },
                    { title: "Direct Tune" }
                ]
                Text {
                    text: modelData.title
                    font.pixelSize: topbar.height / 3.5
                    color: Style.isDark ?Style.white : Style.black

                }
            }
        }
    }

    Flickable {
        id: flickable
        anchors.top: topbar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        contentHeight: radioList.height
        clip: true


        ListView {
            id: radioList
            width: parent.width
            height: contentHeight

            model: ListModel {
                ListElement { name: "Radio City 91.1 FM"; category: "Varied"; song: "Classic Hits"; imageUrl: "qrc:/Radio_icons/91.1.jpg" }
                ListElement { name: "Radio Indigo 91.9 FM"; category: "Varied"; song: "Classic Hits"; imageUrl: "qrc:/Radio_icons/radio-indigo-919.jpg" }
                ListElement { name: "92.7 Big FM"; category: "Varied"; song: "Live News"; imageUrl: "qrc:/Radio_icons/92.7.png" }
                ListElement { name: "Red FM 93.5 FM"; category: "Varied"; song: "Sports Talk"; imageUrl: "qrc:/Radio_icons/93.5.jpg" }
                ListElement { name: "Radio One 94.3 FM"; category: "Varied"; song: "Live News"; imageUrl: "qrc:/Radio_icons/94.3.jpg" }
                ListElement { name: "vividBhrathi"; category: "News"; song: "Rock Legends"; imageUrl: "qrc:/Radio_icons/vividBhrathi.jpeg" }
            }
            interactive: true
            boundsBehavior: Flickable.StopAtBounds
            highlightMoveDuration: 200
            highlightFollowsCurrentItem: true

            delegate: Item {
                width: radioList.width
                height: 100

                Rectangle {
                    id: bgRect
                    width: parent.width
                    height: parent.height
                    color: Style.isDark ?Style.lightblack :Style.lightwhite

                    MouseArea {
                        id: hoveredArea
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            currentIndex = index
                            updateDetails()
                        }
                    }

                    Row {
                        anchors.fill: parent
                        anchors.leftMargin: 10
                        spacing: 15

                        Image {
                            source: imageUrl
                            width: 60
                            height: 60
                            fillMode: Image.PreserveAspectFit
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Column {
                            anchors.verticalCenter: parent.verticalCenter
                            Text {
                                text: name
                                color: Style.isDark ?Style.white : Style.black
                                font.bold: true
                                font.pixelSize: 16

                            }
                            Text {
                                text: category
                                color: "gray"
                                font.pixelSize: 14

                            }
                        }
                    }
                }
            }

            highlight: Rectangle {
                color: "#804000"
                radius: 5
            }
        }
    }
}
