import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Controls 2.14
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts 1.3
import Style 1.0

Rectangle {
    id: home
    anchors.fill: parent
    visible:false
    property bool isFirstImage: true
    property bool isSecondImage: true

    Image {
        id: bg
        source: Style.isDark
                        ? "qrc:/Images/background_image.png"
                        : "qrc:/Images/background_image_light.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop

        Text {
            id: frunk
            text: qsTr("Frunk \nOpen")
            font.pixelSize: parent.height/60
            color: Style.isDark ? Style.white:Style.black
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: parent.height/-6
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: parent.height/-2.6
        }

        Image {
            id: lock
            source: Style.isDark
                    ? "qrc:/Images/lock.svg"
                    : "qrc:/Images/lock dark.svg"
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: parent.height/-3.3
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: parent.height/60
            height: parent.height/20
            width: parent.width/30
        }

        Image {
            id: charging
            source: Style.isDark
                    ? "qrc:/Images/scale.svg"
                    : "qrc:/settings_Icon/Charging.svg"
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: parent.height/-15
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: parent.height/2
            height: parent.height/30
            width: parent.width/50
        }

        Text {
            id: trunk
            text: qsTr("Trunk \nOpen")
            font.pixelSize: parent.height/60
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: parent.height/-4.5
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: parent.height/2.45
             color: Style.isDark ? Style.white:Style.black
        }


    }

    Image {

        source: "qrc:/Images/dummyMap.png"
        anchors.top: parent.top
        anchors.left: parent.left
        height: parent.height/2.5
        fillMode: Image.PreserveAspectFit
        rotation: 180
        width: parent.width/3
        z:1

    }

    Rectangle {
        id: nav
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: parent.height/3
        anchors.bottomMargin: parent.height/10
        height: parent.height/7
        width: parent.width/4
        color: "white"
        radius: 10
        border.color: "#D3D3D3"

        Rectangle {
            id:ttop
            anchors.top: parent.top
            width: parent.width *0.9
            height: parent.height/2.3
            anchors.topMargin:parent.height/14
            anchors.left: parent.left
            anchors.leftMargin: parent.height/8



            Image {
                id: search
                source: "qrc:/Images/search.svg"
                anchors.left: parent.left
                height: parent.height/2
                width: parent.width/6
                anchors.leftMargin: parent.height/4
                anchors.verticalCenter: parent.verticalCenter
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: navtext
                text: qsTr("Navigate")
                anchors.left: search.right
                anchors.leftMargin: parent.height/8
                font.pixelSize: parent.height/3
                anchors.verticalCenter: parent.verticalCenter
                color: "#828282"
            }
        }

        Rectangle{
            height:1.2
            width:parent.width
            color:"gray"
            anchors.centerIn: parent
            opacity: 0.5
        }

        Rectangle {
            anchors.bottom: parent.bottom
            width: parent.width * 0.94
            height: parent.height/2.5
            anchors.bottomMargin:parent.height/16
            anchors.left: parent.left
            anchors.leftMargin: parent.height/9

            Rectangle{
                height:parent.height
                width:1.2
                color:"gray"
                anchors.centerIn: parent
                z:1
                opacity: 0.5
            }


            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width/2
                height: parent.height
                anchors.left: parent.left


                Image {
                    id: homeimg
                    source: "qrc:/Images/home.png"
                    anchors.left: parent.left
                    height: parent.height/2
                    width: parent.width/6
                    anchors.leftMargin: parent.height/2
                    anchors.verticalCenter: parent.verticalCenter
                    fillMode: Image.PreserveAspectFit
                }


                Text {
                    id: txt
                    text: qsTr("Home")
                    anchors.left: homeimg.right
                    anchors.leftMargin: parent.height/4
                    font.pixelSize: parent.height/2.5
                    anchors.verticalCenter: parent.verticalCenter
                    color: "grey"
                    opacity: 0.9
                }
            }

            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width/2
                height: parent.height
                anchors.right: parent.right


                Image {
                    id: work
                    source: "qrc:/Images/work.png"
                    anchors.left: parent.left
                    height: parent.height/2
                    width: parent.width/6
                    anchors.leftMargin: parent.height/2
                    anchors.verticalCenter: parent.verticalCenter
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: txt2
                    text: qsTr("Work")
                    anchors.left: work.right
                    anchors.leftMargin: parent.height/4
                    font.pixelSize: parent.height/2.5
                    anchors.verticalCenter: parent.verticalCenter
                    color: "grey"
                    opacity: 0.9
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                currentindexvalue1=1;
                currentindexvalue2=0;
                currentindexvalue3=0;
            }
        }
    }

    Rectangle {
        id: music
        anchors.bottom: parent.bottom
        anchors.left: nav.right
        anchors.leftMargin: parent.height / 40
        anchors.bottomMargin: parent.height / 10
        height: parent.height / 7
        width: parent.width / 2.8
        radius: 10
        border.color: "#D3D3D3"


        Rectangle {
            id: slider
            height: 2
            width: parent.width * 0.85
            color: "#D3D3D3"
            radius: height / 2
            anchors.top: album.bottom
            anchors.left: album.right
            opacity: 0.8

            property real progressValue: 0.4

            Rectangle {
                id: progress
                height: parent.height
                width: parent.width * slider.progressValue
                color: "#333"
                radius: height / 2
            }

            Rectangle {
                id: handle
                width: 10
                height: 10
                radius: width / 2
                color: "white"
                border.color: "#333"
                border.width: 1
                anchors.verticalCenter: parent.verticalCenter
                x: progress.width - handle.width / 2

                MouseArea {
                    anchors.fill: parent
                    drag.target: handle
                    drag.axis: Drag.XAxis
                    drag.minimumX: 0
                    drag.maximumX: slider.width - handle.width
                    onReleased: {
                        slider.progressValue = handle.x / slider.width;
                    }
                }
            }

            Timer {
                id: progressTimer
                interval: 1000  // Update every second
                running: true
                repeat: true
                onTriggered: {
                    if (slider.progressValue < 1) {
                        slider.progressValue += 0.02;
                    } else {
                        progressTimer.stop();
                    }
                }
            }
        }



        Image {
            id: album
            source: "qrc:/music_icons/TheWeekndAfterHours.png"
            anchors.top: parent.top
            height: parent.height/2
            width:parent.width/8
            anchors.left: parent.left


        }

        Text {
            id:texts
            text: "After Hours"
            font.pixelSize: parent.height/7
            font.bold: true
            color: "#333"
            anchors.left:album.right
            anchors.leftMargin: parent.height/5
            anchors.top: parent.top
            anchors.topMargin: parent.height/12


            Text {
                text: "The Weekend"
                font.pixelSize: parent.height/1.5
                color: "#666"
                anchors.top:parent.bottom
                anchors.topMargin: parent.height/6
            }


        }

                Image {
                    id: loop
                    anchors.right: parent.right
                    anchors.rightMargin: parent.height/6
                    source: "qrc:/Images/loop.png"
                    fillMode: Image.PreserveAspectFit
                    width: parent.width / 12
                    height: parent.height / 5
                    anchors.top: parent.top
                    anchors.topMargin: parent.height/7
                    opacity: 0.5


                }

                Image {
                    id: shuffle
                    source: "qrc:/Images/Shuffle.png"
                    fillMode: Image.PreserveAspectFit
                    width: parent.width / 12
                    height: parent.height / 5
                    anchors.right: loop.right
                    anchors.rightMargin: parent.height *0.9
                    anchors.top: parent.top
                    anchors.topMargin: parent.height/7
                    opacity: 0.5

                }
                Image {
                    id: fav
                    source: isSecondImage ? "qrc:/Images/favorite_red.png" :"qrc:/Images/fav.png"
                    fillMode: Image.PreserveAspectFit
                    width: parent.width / 12
                    height: parent.height / 5
                    anchors.right: shuffle.left
                    anchors.rightMargin: parent.height *0.5
                    anchors.top: parent.top
                    anchors.topMargin: parent.height/7


                    MouseArea{
                        anchors.fill:parent
                        onClicked: {
                            isSecondImage = !isSecondImage
                        }
                    }
                }




                Row {
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: parent.width * 0.06
                    height: parent.height / 2
                    spacing: parent.width * 0.12

                    Image {
                        id: previous
                        source: "qrc:/Images/previous.png"
                        fillMode: Image.PreserveAspectFit
                        width: parent.height * 0.35
                        height: parent.height * 0.35
                        anchors.verticalCenter: parent.verticalCenter
                        smooth: true
                        opacity: 0.5
                    }

                    Image {
                        id: play
                        source: isFirstImage ? "qrc:/Images/play.png" : "qrc:/Images/pause.png"
                        fillMode: Image.PreserveAspectFit
                        width: parent.height * 0.35
                        height: parent.height * 0.35
                        anchors.verticalCenter: parent.verticalCenter
                        opacity: 0.5


                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                isFirstImage = !isFirstImage
                            }
                        }
                    }

                    Image {
                        id: next
                        source: "qrc:/Images/next.png"
                        fillMode: Image.PreserveAspectFit
                        width: parent.height * 0.35
                        height: parent.height * 0.35
                        anchors.verticalCenter: parent.verticalCenter
                        opacity: 0.5

                    }

                    Image {
                        id: add
                        source: "qrc:/Images/add.png"
                        fillMode: Image.PreserveAspectFit
                        width: parent.height * 0.35
                        height: parent.height * 0.35
                        anchors.verticalCenter: parent.verticalCenter
                        opacity: 0.5
                    }

                    Image {
                        id: adjust
                        source: "qrc:/Images/adjust.png"
                        fillMode: Image.PreserveAspectFit
                        width: parent.height * 0.35
                        height: parent.height * 0.35
                        anchors.verticalCenter: parent.verticalCenter
                        opacity: 0.5
                    }

                    Image {
                        id: searchs
                        source: "qrc:/Images/search.png"
                        fillMode: Image.PreserveAspectFit
                        width: parent.height * 0.35
                        height: parent.height * 0.35
                        anchors.verticalCenter: parent.verticalCenter
                        opacity: 0.5
                    }
                }

            }


            Rectangle {
                id: swipe
                width: parent.width / 8
                height: parent.height
                color: "transparent"
                opacity: 0
                anchors.right: parent.right
                anchors.top: parent.top
                z: 100
                visible: true

                MouseArea {
                    id: swipeArea
                    anchors.fill: parent
                    property real startY: 0
                    property real distance: 0
                    drag.axis: Drag.YAxis

                    onPressed: {
                        starty = mouse.y
                    }

                    onReleased: {
                        if (distance > parent.width * 0.25) {
                            currentindexvalue1=1;
                            currentindexvalue2=0;
                            currentindexvalue3=0;


                        }
                        distance = 0
                    }

                    onPositionChanged: {
                        distance = mouse.y - startY
                    }
                }
            }




        }



