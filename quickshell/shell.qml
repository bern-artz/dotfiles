import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io

ShellRoot {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData

            screen: modelData
            width: 1920
            height: 40
            color: "transparent"
            anchors.top: true

            margins {
                top: 0
            }

            Bar {
            }

        }

    }

}
