import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import "../Launchpad"

Rectangle {
    id: footer
    height: parent.height / 12
    width: parent.width
    color: "black"

    signal expandMusicClicked()

    property real leftTemp: 22.0
    property real rightTemp: 16.0

    Image {
        id: car
        source: "qrc:/Images/model3icon.svg"
        width: footer.height * 0.5
        height: footer.height * 0.5
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        anchors.leftMargin: parent.height

        MouseArea {
            hoverEnabled: true
            anchors.fill: parent
            onClicked: {
                settingsPop.visible = true;
            }
        }
    }

    RowLayout {
        id: leftControls
        anchors.left: car.right
        anchors.leftMargin: parent.width / 12
        anchors.verticalCenter: parent.verticalCenter
        spacing: parent.height / 2.7

        // Steering Wheel Warmer
        Item {
            Layout.preferredWidth: footer.height * 0.6
            Layout.preferredHeight: footer.height * 0.6
            Layout.alignment: Qt.AlignVCenter

            property int imageIndex: 0
            property var images: [
                "qrc:/LaunchpadIcons/steering-wheel-warmer.svg",
                "qrc:/settings_Icon/steering-wheel-warmer1.png",
                "qrc:/settings_Icon/steering-wheel-warmer2.png"
            ]

            Image {
                id: steeringImage
                anchors.fill: parent
                source: parent.images[parent.imageIndex]
                fillMode: Image.PreserveAspectFit
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.imageIndex = (parent.imageIndex + 1) % parent.images.length;
                }
            }
        }

        // Seat Warmer
        Item {
            Layout.preferredWidth: footer.height * 0.6
            Layout.preferredHeight: footer.height * 0.6
            Layout.alignment: Qt.AlignVCenter

            property int imageIndex: 0
            property var images: [
                "qrc:/LaunchpadIcons/seat-warmer.svg",
                "qrc:/settings_Icon/seat-warmer1.png",
                "qrc:/settings_Icon/seat-warmer2.png",
                "qrc:/settings_Icon/seat-warmer3.png"
            ]

            Image {
                id: seatImage
                anchors.fill: parent
                source: parent.images[parent.imageIndex]
                fillMode: Image.PreserveAspectFit
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.imageIndex = (parent.imageIndex + 1) % parent.images.length;
                }
            }
        }

        Item {
            Layout.preferredWidth: footer.height * 0.6
            Layout.preferredHeight: footer.height * 0.6
            Layout.alignment: Qt.AlignVCenter

            property int imageIndex: 0
            property var images: [
                "qrc:/LaunchpadIcons/front-defrost.svg",
                "qrc:/settings_Icon/front-defrost1.png",
                "qrc:/settings_Icon/front-defrost2.png",
                "qrc:/settings_Icon/front-defrost3.png"
            ]

            Image {
                id: frontdfrost
                anchors.fill: parent
                source: parent.images[parent.imageIndex]
                fillMode: Image.PreserveAspectFit
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    parent.imageIndex = (parent.imageIndex + 1) % parent.images.length;
                }
            }
        }
    }



    Image {
        id: menu
        source: "qrc:/Images/expand music.svg"
        width: footer.height * 0.6
        height: footer.height * 0.6
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset:parent.height
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            onClicked: footer.expandMusicClicked()
        }
    }

    RowLayout {
        id:apps
        anchors.right:menu.left
        anchors.rightMargin: parent.width /30
        anchors.verticalCenter: parent.verticalCenter
        spacing: 30

        Image {
            source: "qrc:/LaunchpadIcons/calendar.svg"
            Layout.preferredWidth: footer.height * 0.6
            Layout.preferredHeight: footer.height * 0.6
            fillMode: Image.PreserveAspectFit

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    currentindexvalue1 = 1;
                    currentindexvalue2 = 2;
                    currentindexvalue3 = 0;

                }
            }
        }

        Image {
            source: "qrc:/LaunchpadIcons/dashcam.svg"
            Layout.preferredWidth: footer.height * 0.6
            Layout.preferredHeight: footer.height * 0.6
            fillMode: Image.PreserveAspectFit

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    currentindexvalue1 = 1;
                    currentindexvalue2 = 1;
                    currentindexvalue3 = 0;

                }
            }
        }

    Image {
        source: "qrc:/LaunchpadIcons/spotify.svg"
        Layout.preferredWidth: footer.height * 0.6
        Layout.preferredHeight: footer.height * 0.6
        fillMode: Image.PreserveAspectFit

        MouseArea{
            anchors.fill: parent
            onClicked: {
                currentindexvalue1 = 1;
                currentindexvalue2 = 3;
                currentindexvalue3 = 0;

            }
        }
    }
    }

    RowLayout {
        id: rightControls
        anchors.right: volume.left
        anchors.rightMargin: parent.width / 8
        anchors.verticalCenter: parent.verticalCenter
        spacing: 10

        Image {
            source: "qrc:/Images/right-arrow.svg"
            Layout.preferredWidth: footer.height * 0.5
            Layout.preferredHeight: footer.height * 0.5
            fillMode: Image.PreserveAspectFit

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (rightTemp > 12) rightTemp -= 0.5;
                }
            }
        }

        Text {
            textFormat: Text.RichText
            text: {
                let parts = Number(rightTemp).toFixed(1).split(".");
                return `<span style="color:white; font-weight:bold; font-size:${footer.height * 0.5}px">${parts[0]}.<span style="font-size:${footer.height * 0.4}px">${parts[1]}</span>°</span>`;
            }
            Layout.alignment: Qt.AlignVCenter

            MouseArea {
                hoverEnabled: true
                anchors.fill: parent
                onClicked: {
                    ac.visible = true;
                }
            }
        }


        Image {
            source: "qrc:/Images/left-arrow.svg"
            Layout.preferredWidth: footer.height * 0.5
            Layout.preferredHeight: footer.height * 0.5
            fillMode: Image.PreserveAspectFit

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (rightTemp < 29) rightTemp += 0.5;
                }
            }
        }
    }

    Image {
        id: volume
        source: "qrc:/Images/volume.svg"
        width: footer.height * 0.5
        height: footer.height * 0.5
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectFit
        anchors.rightMargin: parent.height

        MouseArea {
            hoverEnabled: true
            anchors.fill: parent
            onClicked: {
                volumePop.visible = true;
            }
        }
    }
}
