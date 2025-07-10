import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import "../Header"
import "../Footer"
import "../LeftScreen"
import "../GyroScreen"
import "../SecondRightScreen"


Rectangle {
    id: rectangle
    clip: true

    property bool showRectangle: false

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

    SecondRightScreen{
        id: rightScreen

        StackLayout {
            id: stackLayout1

            anchors.fill: rightScreen
            currentIndex: currentindexvalue2



            Loader{
                source: "qrc:/ui/GyroScreen/Map.qml"
            }
            Loader{
                source: "qrc:/ui/GyroScreen/Cam.qml"
            }
            Loader{
                source: "qrc:/ui/GyroScreen/Calender.qml"
            }
            Loader{
                source: "qrc:/ui/GyroScreen/Spotify.qml"
            }
            Loader{
                source: "qrc:/ui/GyroScreen/Message.qml"
            }

            Loader{
                source: "qrc:/ui/GyroScreen/Radio.qml"
            }
            Loader{
                source: "qrc:/ui/GyroScreen/Music.qml"
            }

            Loader{
                source: "qrc:/ui/GyroScreen/Youtube.qml"
            }

        }

    }

    LeftScreen{
        id: leftScreen

        StackLayout {
            id: stackLayout2
            anchors.fill: leftScreen
            currentIndex: currentindexvalue3


            Loader{
                source: "qrc:/ui/LeftScreen/Speed_Car.qml"

            }






        }
    }

}
