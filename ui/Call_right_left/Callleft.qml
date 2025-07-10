import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.3

Rectangle {
    color: "lightgray"
    width: 400
    height: 400

    ListModel {
        id: contactModel
    }

    Column {
        spacing: 10
        anchors {
            left: parent.left
            leftMargin: 10
            top: parent.top
            topMargin: 10
        }

        Text {
            text: "Contacts"
            font.bold: true
            font.pointSize: 24
        }

        Button {
            text: "+"
            width: 40
            height: 40
            onClicked: {
                addContactDialog.visible = true
            }
        }

        Repeater {
            model: contactModel
            delegate: Rectangle {
                width: contentItem.implicitWidth + 20 // Adjust padding
                height: 40
                color: index % 2 === 0 ? "lightblue" : "lightgray"
                border.color: "black"

                Text {
                    id: contentItem
                    anchors.centerIn: parent
                    text: model.name + " - " + model.number
                }
            }
        }
    }

    Dialog {
        id: addContactDialog
        title: "Add Contact"
        visible: false
        width: 200
        height: 150
        x: (parent.width - width) // Center the dialog horizontally
        y: (parent.height - height *5.5) // Center the dialog vertically

        Rectangle {
            width: addContactDialog.width
            height: addContactDialog.height
            color: "transparent"

            ColumnLayout {
                spacing: 10
                Layout.alignment: Qt.AlignRight // Align the column to the right

                Row {
                    spacing: 10
                    Text {
                        text: "Name:"
                        width: 50
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    TextInput {
                        id: nameInput
                        width: 150
                    }
                }

                Row {
                    spacing: 10
                    Text {
                        text: "Number:"
                        width: 50
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    TextInput {
                        id: numberInput
                        width: 150
                        validator: IntValidator {}
                    }
                }

                Row {
                    spacing: 10
                    Button {
                        text: "Save"
                        onClicked: {
                            if (nameInput.text !== "" && numberInput.text !== "") {
                                if (contactModel.count < 10) {
                                    contactModel.append({name: nameInput.text, number: numberInput.text})
                                    nameInput.text = "" // Clear input fields after saving
                                    numberInput.text = ""
                                    addContactDialog.visible = false;
                                } else {
                                    console.log("Maximum contacts limit reached.")
                                }
                            }
                        }
                    }
                    Button {
                        text: "Cancel"
                        onClicked: {
                            nameInput.text = "" // Clear input fields on cancel
                            numberInput.text = ""
                            addContactDialog.visible = false;
                        }
                        width: 60 // Adjust the width of the cancel button
                    }
                }
            }
        }
    }
}

