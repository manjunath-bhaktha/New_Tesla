import QtQuick 2.0
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

Rectangle{
    anchors.fill: parent
    color: "light blue"
    property int music_status: 0
    Image {
        id: bg
        source: "qrc:/images/mountain.jpeg"
        anchors.fill: parent
        opacity: 0.5
    }
    Rectangle{
        id:imageplacement
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
        }
        height: parent.height * 0.5
        color: "transparent"

        Rectangle{
            id: music_image
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            //anchors.bottomMargin: parent.height/12
            height: parent.height * 0.8
            width: height
            color: "transparent"
            clip: true
            radius: 45

            Image {
                id: music_icon
                source: "qrc:/images/mountain.jpeg"
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Rectangle {
                        width: music_image.width
                        height: music_image.height
                        radius: 45
                        color: "white"
                    }
                }



            }


        }
        Rectangle{
            id: likeimageplacement
            anchors.left: music_image.right
            height: music_image.height
            anchors.top: music_image.top
            width: imageplacement.width/8
            color: "transparent"
            Image {
                id: like
                source: "qrc:/images/music_love.png"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                clip: true

                Rectangle {
                    id:liked
                    width: parent.width
                    height: parent.height
                    color: "red"

                    layer.enabled: true
                    layer.effect: OpacityMask {
                        maskSource: Image {
                            source: "qrc:/images/music_love.png"
                        }
                    }
                    visible: false

                    // Add any additional properties or child items as needed
                }

                MouseArea{
                    anchors.fill: like
                    onClicked: {
                        liked.visible=!liked.visible
                    }
                }

            }
        }
    }

    Rectangle{
        id:namedescription
        anchors{
            top: imageplacement.bottom
            left: parent.left
            right: parent.right
        }
        height: parent.height * 0.1
        color: "transparent"
        Text {
            id: musicNameText
            text: qsTr("Madhu Pakaroo")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            font.pixelSize: parent.height/2.5
        }
        Rectangle{
            id:descriptionRectangle
            width: parent.width/2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: musicNameText.bottom
            color: "green"

        }

        Text {
            id: musicArtists
            text: "Vineeth Sreenivasan, Devu Khan Manganiyar, Varshangalkku Shesham"
            width: parent.width/2
            font.pixelSize: musicNameText.font.pixelSize/2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: musicNameText.bottom
        }


    }

    Rectangle{
        id:musicControls
        anchors{
            top: namedescription.bottom
            left: parent.left
            right: parent.right
        }
        height: parent.height * 0.1
        color: "transparent"


        Image {

            id: playStatusIcon
            source: music_status===0?  "qrc:/images/music_play.png" : "qrc:/images/music_pause.png"
            anchors{
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
            height: parent.height
            width: height

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    music_status=!music_status
                }

            }
        }

        Image {
            id: musicPrevious
            source: "qrc:/images/music_previous.png"
            anchors{
                right: playStatusIcon.left
                rightMargin: height/2
            }
            height: parent.height
            width: height
        }
        Image {
            id: musicShuffle
            source: "qrc:/images/music_shuffle.png"
            anchors{
                right: musicPrevious.left
                rightMargin: height/2
            }
            height: parent.height
            width: height
        }

        Image {
            id: musicNext
            source: "qrc:/images/music_next.png"
            anchors{
                left: playStatusIcon.right
                leftMargin: height/2
            }
            height: parent.height
            width: height
        }

        Image {
            id: musicRepeat
            source: "qrc:/images/music_repeat.png"
            anchors{
                left: musicNext.right
                leftMargin: height/2
            }
            height: parent.height
            width: height
        }
    }
}


