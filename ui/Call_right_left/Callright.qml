import QtQuick 2.14
import QtQuick.Controls 2.14

Rectangle {
    anchors.fill: parent

    Text {
        id: call
        //text: qsTr("calling")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Column {
        anchors.centerIn: parent
        spacing: 10

        TextField {
            id: displayField
            width: parent.width
            readOnly: true
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        // Rows with buttons
        Row {
            spacing: 5
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                text: "1"
                font.pixelSize: 45
                onClicked: dialNumber(1)
            }

            Button {
                text: "2"
                font.pixelSize: 45
                onClicked: dialNumber(2)
            }

            Button {
                text: "3"
                font.pixelSize: 45
                onClicked: dialNumber(3)
            }
        }

        Row {
            spacing: 5
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                text: "4"
                font.pixelSize: 45
                onClicked: dialNumber(4)
            }

            Button {
                text: "5"
                font.pixelSize: 45
                onClicked: dialNumber(5)
            }

            Button {
                text: "6"
                font.pixelSize: 45
                onClicked: dialNumber(6)
            }
        }

        Row {
            spacing: 5
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                text: "7"
                font.pixelSize: 45
                onClicked: dialNumber(7)
            }

            Button {
                text: "8"
                font.pixelSize: 45
                onClicked: dialNumber(8)
            }

            Button {
                text: "9"
                font.pixelSize: 45
                onClicked: dialNumber(9)
            }
        }

        Row {
            spacing: 5
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                text: "←" // Backspace button
                font.pixelSize: 45
                onClicked: backspace()
            }

            Button {
                text: "0"
                font.pixelSize: 45
                onClicked: dialNumber(0)
            }
        }
        Row {
            spacing: 5
            anchors.horizontalCenter: parent.horizontalCenter

            Item {
                width: 50 // Adjust width as needed for the image button
                height: 50 // Adjust height as needed for the image button

                MouseArea {
                    anchors.fill: parent // Cover the entire Item
                    onClicked: {
                        console.log("Image button clicked")
                    }
                }

                Image {
                    anchors.fill: parent // Fill the entire Item
                    source: "qrc:/images/call.png" // Set the image source
                }
            }
        }
    }

    function dialNumber(number) {
        displayField.text += number;
    }

    function backspace() {
        if (displayField.text.length > 0) {
            displayField.text = displayField.text.slice(0, displayField.text.length - 1);
        }
    }

}
