import Quickshell.Hyprland
import QtQuick

Item {
    anchors.centerIn: parent
    id: root

    property bool showing: false
    property int workspace: Hyprland.focusedWorkspace?.id ?? 1

    Timer {
        id: hideTimer
        interval: 700
        repeat: false

        onTriggered: root.showing = false
    }

    Connections {
        target: Hyprland

        function onFocusedWorkspaceChanged() {
            root.workspace = Hyprland.focusedWorkspace?.id ?? 1
            root.showing = true

            hideTimer.restart()
        }
    }

    Rectangle {
        anchors.centerIn: parent

        width: 150
        height: 40
        bottomLeftRadius: 10
        bottomRightRadius: 10

        color: "#1e1e2e"

        opacity: root.showing ? 1 : 0
        scale: root.showing ? 1 : 0.8

        Behavior on opacity {
            NumberAnimation {
                duration: 150
            }
        }

        Behavior on scale {
            NumberAnimation {
                duration: 180
                easing.type: Easing.OutCubic
            }
        }

        Text {
            anchors.centerIn: parent

            text: root.workspace
            color: "#cdd6f4"

            font.pixelSize: 28
            font.bold: true
        }
    }
}