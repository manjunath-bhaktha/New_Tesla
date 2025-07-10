import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.3
import "ui/Header"
import "ui/Footer"
import "ui/Page"
import "ui/Launchpad"
import "ui/SecondRightScreen"
import"ui/LeftScreen"

ApplicationWindow {
    id: window
    visible: true
    visibility: "FullScreen"
    width: 1920
    height: 1200

    property int currentindexvalue1: 0
    property int currentindexvalue2: 0
    property int currentindexvalue3: 0

    StackLayout {
        id: stackLayout
        anchors.fill: parent
        currentIndex: currentindexvalue1

        Home {
            id: home
            width: stackLayout.width
            height: stackLayout.height

        }

        SecondPage {
            id: second
            width: stackLayout.width
            height: stackLayout.height
        }
    }


    Header {
        id: header
    }

    Footer {
        id: footer
        anchors.bottom: parent.bottom
        width: parent.width

        onExpandMusicClicked: {
            launchPad.visible = !launchPad.visible
        }

    }

    AcPop{
        id:ac
        visible: false
    }

    VolumePop{
        id:volumePop
         visible: false
    }


    LaunchPad {
        id: launchPad
        visible: false

    }

    SettingsPop{
        id:settingsPop
        visible: false
    }


    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active

            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }

        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
