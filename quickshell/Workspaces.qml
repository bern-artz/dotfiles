import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

pragma ComponentBehavior: Bound

RowLayout {
  id: wsView

  property var bar

  anchors.centerIn: parent
  spacing: 6

  opacity: hovered ? 1 : 0

  Behavior on opacity {
      NumberAnimation {
          duration: 150
      }
  }

  Repeater {
        model: 10

      Rectangle {
          id: wsButton

          required property int index

          property var ws: Hyprland.workspaces.values.find(
              w => w.id === (index + 1)
          )

          property bool isActive:
              Hyprland.focusedWorkspace?.id === (index + 1)

          implicitWidth: label.implicitWidth + 14
          implicitHeight: 22
          radius: 6

          color: isActive
              ? "#6272a4"
              : (ws ? "#121218" : "transparent")

          Behavior on color {
              ColorAnimation {
                  duration: 150
              }
          }

          Text {
              id: label

              anchors.centerIn: parent

              text: wsButton.index + 1

              color: wsButton.isActive
                  ? "#f8f8f2"
                  : (wsButton.ws ? "#6272a4" : "#f5c2e7")

              font {
                  family: "SF Mono"
                  pixelSize: 14
                  weight: 500
              }
          }

      MouseArea {
        anchors.fill: parent
        z: 999

        onClicked: {
          console.log("CLICK MASUK")
        }
      }

    }

  }

}
