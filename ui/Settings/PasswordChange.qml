import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Style 1.0


Rectangle {
    id: passwordChange
    anchors {
        top: parent.top
        bottom: parent.bottom
        right: parent.right
        left: parent.left
    }
    color:Style.background

    Rectangle{
        id:password
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left:parent.left
        height: parent.height * 0.2
        color:"transparent"

        Text {
            id: text1
            text: qsTr("Password")
            font.bold: true
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin:parent.height / 3
            font.pixelSize: parent.height /5
        }

        Rectangle {
            id:changepass
            anchors.top: password.bottom
            anchors.right: parent.right
            anchors.left:parent.left
            height:parent.height * 0.7
            color: "transparent"

            Text {
                id:currentpass
                text: qsTr("Current Password:")
                anchors.top: changepass.top
                anchors.left: changepass.left
                font.pixelSize: changepass .height /5
                anchors.leftMargin: changepass.height /1.5
            }
            TextField {
                id: currentPasswordInput
                anchors.top: currentpass.bottom
                anchors.left: changepass.left
                placeholderText: "Enter current password"
                font.pixelSize: currentPasswordInput.height /3
                anchors.leftMargin: changepass.height /1.5
                anchors.topMargin:  changepass.height /8
                height:currentpass.height * 1.6
                width:currentpass.width

            }

        }
        Rectangle {
            id:newpass
            anchors.top: changepass.bottom
            anchors.right: parent.right
            anchors.left:parent.left
            height:parent.height * 0.7
            color: "transparent"

            Text {
                id:newpasstxt
                text: qsTr("New Password:")
                anchors.top: newpass.top
                anchors.left: newpass.left
                font.pixelSize: newpass .height /5
                anchors.leftMargin:newpass.height /1.5
            }
            TextField {
                id: newPasswordInput
                anchors.top: newpasstxt.bottom
                anchors.left: newpass.left
                placeholderText: "Enter New Password"
                font.pixelSize: newPasswordInput.height /3
                anchors.leftMargin:newpass.height /1.5
                anchors.topMargin:  newpass.height /8
                height:currentpass.height * 1.6
                width:currentpass.width
                echoMode:TextInput.Password

            }

        }

        Rectangle {
            id:confirm
            anchors.top: newpass.bottom
            anchors.right: parent.right
            anchors.left:parent.left
            height:parent.height * 0.7
            color: "transparent"

            Text {
                id:confirmtxt
                text: qsTr("Confirm Password:")
                anchors.top: confirm.top
                anchors.left: confirm.left
                font.pixelSize: confirm .height /5
                anchors.leftMargin:confirm.height /1.5
            }
            TextField {
                id: confirmNewPasswordInput
                anchors.top: confirmtxt.bottom
                anchors.left: confirm.left
                placeholderText: "Enter New Password"
                font.pixelSize: confirmNewPasswordInput.height/3
                anchors.leftMargin:confirm.height /1.5
                anchors.topMargin:  confirm.height /8
                height:currentpass.height * 1.6
                width:currentpass.width
                echoMode:TextInput.Password

            }

        }
        Rectangle {
            id:submit
            anchors.top: confirm.bottom
            anchors.right: parent.right
            anchors.left:parent.left
            height:parent.height * 0.4
            color: "transparent"

            Button {
                id:change
                text: "Change Password"
                anchors.bottom: submit.bottom
                anchors.left: clear.left
                font.pixelSize:change.height /3
                anchors.leftMargin:submit.height /0.2
                height:submit.height /1.3
                width:submit.width /6
                onClicked: {

                }
            }
            Button {
                id:clear
                text: "Clear"
                anchors.bottom: submit.bottom
                anchors.left: submit.left
                font.pixelSize:clear.height /3
                anchors.leftMargin:submit.height /1.5
                height:submit.height /1.3
                width:submit.width /6
                onClicked: {
                    currentPasswordInput.text="";
                    newPasswordInput.text="";
                    confirmNewPasswordInput.text="";

                }


            }
        }
    }
}
