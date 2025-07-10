import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Qt5Compat.GraphicalEffects

Popup {
    id: popup
    width: parent.width * 0.65
    height: parent.height * 0.6

    x: (parent.width - width) / 2
    y: (parent.height - height) / 2

    background: Rectangle {
        anchors.fill: parent
        radius: 12
        color: Qt.rgba(0, 0, 0, 0.9)
    }

    contentItem: Rectangle {
        anchors.fill: parent
        color: "black"

        // === First Section ===
        Rectangle {
            id: first
            anchors.top: parent.top
            width: parent.width
            height: parent.height / 3
            color: "black"

            ListModel {
                id: firstModel
                ListElement { label: "Front Defrost" }
                ListElement { label: "Rear Defrost" }
                ListElement { label: "Left Seat" }
                ListElement { label: "Heated Steering" }
                ListElement { label: "Wipers" }
            }

            property var imageLists: [
                [ "qrc:/LaunchpadIcons/front-defrost.svg", "qrc:/settings_Icon/front-defrost1.png", "qrc:/settings_Icon/front-defrost2.png", "qrc:/settings_Icon/front-defrost3.png" ],
                [ "qrc:/LaunchpadIcons/rear-defrost.svg", "qrc:/settings_Icon/rear-defrost1.png", "qrc:/settings_Icon/rear-defrost2.png", "qrc:/settings_Icon/rear-defrost3.png" ],
                [ "qrc:/Images/seat-warmer.svg", "qrc:/settings_Icon/seat-warmer1.png", "qrc:/settings_Icon/seat-warmer2.png", "qrc:/settings_Icon/seat-warmer3.png" ],
                [ "qrc:/LaunchpadIcons/steering-wheel-warmer.svg", "qrc:/settings_Icon/steering-wheel-warmer1.png", "qrc:/settings_Icon/steering-wheel-warmer2.png" ],
                [ "qrc:/LaunchpadIcons/wiper.svg" ]
            ]

            Row {
                anchors.fill: parent
                anchors.margins: parent.width * 0.03
                spacing: parent.width * 0.02

                Repeater {
                    model: firstModel
                    Item {
                        width: first.width / firstModel.count * 0.8
                        height: first.height * 0.8

                        property int imageIndex: 0
                        property var images: first.imageLists[index]

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                if (images.length > 1) {
                                    imageIndex = (imageIndex + 1) % images.length
                                }
                            }
                        }

                        Column {
                            anchors.fill: parent
                            spacing: parent.height * 0.04

                            Image {
                                source: images[imageIndex]
                                width: parent.width * 0.45
                                height: parent.height * 0.35
                                fillMode: Image.PreserveAspectFit
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            Text {
                                text: model.label
                                color: "white"
                                font.pixelSize: first.height * 0.1
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }
                    }
                }
            }
        }

        // === Separator ===
        Rectangle {
            width: parent.width
            height: 2
            color: "#666"
            anchors.top: first.bottom
        }

        // === Second Section (Map etc.) ===
        Rectangle {
            id: second
            anchors.top: first.bottom
            anchors.topMargin: parent.height / 10
            width: parent.width
            height: parent.height / 3
            color: "black"

            ListModel {
                id: secondModel
                ListElement { icon: "qrc:/LaunchpadIcons/dashcam.svg"; label: "Dashcam" }
                ListElement { icon: "qrc:/LaunchpadIcons/calendar.svg"; label: "Calendar" }
                ListElement { icon: "qrc:/LaunchpadIcons/messages.svg"; label: "Messages" }
                ListElement { icon: "qrc:/LaunchpadIcons/Gmap.png"; label: "Map" }
                ListElement { icon: "qrc:/LaunchpadIcons/spotify.svg"; label: "Spotify" }
            }

            Row {
                anchors.fill: parent
                anchors.margins: parent.width * 0.03
                spacing: parent.width * 0.02

                Repeater {
                    model: secondModel
                    Item {
                        width: second.width / secondModel.count * 0.8
                        height: second.height * 0.8

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                if (label === "Map") {
                                    currentindexvalue1 = 1;
                                    currentindexvalue2 = 0;
                                    currentindexvalue3 = 0;
                                } else if (label === "Dashcam") {
                                    currentindexvalue1 = 1;
                                    currentindexvalue2 = 1;
                                    currentindexvalue3 = 0;
                                } else if (label === "Calendar") {
                                    currentindexvalue1 = 1;
                                    currentindexvalue2 = 2;
                                    currentindexvalue3 = 0;
                                } else if (label === "Spotify") {
                                    currentindexvalue1 = 1;
                                    currentindexvalue2 = 3;
                                    currentindexvalue3 = 0;
                                } else if (label === "Messages") {
                                    currentindexvalue1 = 1;
                                    currentindexvalue2 = 4;
                                    currentindexvalue3 = 0;
                                }
                                popup.close();
                            }
                        }

                        Column {
                            width: parent.width
                            height: parent.height
                            spacing: parent.height * 0.04

                            Image {
                                source: icon
                                width: parent.width * 0.45
                                height: parent.height * 0.35
                                fillMode: Image.PreserveAspectFit
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            Text {
                                text: label
                                color: "white"
                                font.pixelSize: second.height * 0.1
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }
                    }
                }
            }
        }

        // === Third Section (Radio etc.) ===
        Rectangle {
            id: third
            anchors.top: second.bottom
            anchors.topMargin: parent.height / -10
            width: parent.width
            height: parent.height / 3
            color: "black"

            ListModel {
                id: thirdModel
                ListElement { icon: "qrc:/LaunchpadIcons/FM.png"; label: "Radio" }
                ListElement { icon: "qrc:/LaunchpadIcons/youtube.png"; label: "Youtube" }
                ListElement { icon: "qrc:/LaunchpadIcons/podcast.png"; label: "Podcast" }
                ListElement { icon: "qrc:/LaunchpadIcons/tunein.svg"; label: "TuneIn" }
                ListElement { icon: "qrc:/LaunchpadIcons/music.svg"; label: "Music" }
            }

            Row {
                anchors.fill: parent
                anchors.margins: parent.width * 0.03
                spacing: parent.width * 0.02

                Repeater {
                    model: thirdModel
                    Item {
                        width: third.width / thirdModel.count * 0.8
                        height: third.height * 0.8

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                if (label === "Radio") {
                                    currentindexvalue1 = 1;
                                    currentindexvalue2 = 5;
                                    currentindexvalue3 = 0;
                                } else if (label === "Music") {
                                    currentindexvalue1 = 1;
                                    currentindexvalue2 = 6;
                                    currentindexvalue3 = 0;
                                }else if (label === "Youtube") {
                                    currentindexvalue1 = 1;
                                    currentindexvalue2 = 7;
                                    currentindexvalue3 = 0;
                                }

                                popup.close();
                            }

                            Column {
                                width: third.width / thirdModel.count * 0.8
                                height: third.height * 0.8
                                spacing: parent.height * 0.04

                                Image {
                                    source: icon
                                    width: parent.width * 0.45
                                    height: parent.height * 0.35
                                    fillMode: Image.PreserveAspectFit
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }

                                Text {
                                    text: label
                                    color: "white"
                                    font.pixelSize: third.height * 0.1
                                    horizontalAlignment: Text.AlignHCenter
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
