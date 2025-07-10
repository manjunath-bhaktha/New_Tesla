pragma Singleton
import QtQuick 2.9

QtObject {
    // Colors
    readonly property color black: "#000000"
    readonly property color white: "#FFFFFF"
     readonly property color grey: "#eaeaea"
     readonly property color lightblack:"#161717"
      readonly property color lightwhite: "#F5F4F3"
   readonly property color swhite: "#bcbdbd"
    readonly property color sblack: "#4d4f4f"
    readonly property color bgwhite:  "#fbfbfa"
    readonly property color bgblack:  "#414141"



    // Theme management
    property bool isDark: false
    property string theme: isDark ? "dark" : "light"

    onIsDarkChanged: console.log("Theme changed:", theme)


    property bool isAutopilot: false
    property string state: isAutopilot ? "on" : "off"

    onIsAutopilotChanged: console.log("Autopilot is :", state)



}
