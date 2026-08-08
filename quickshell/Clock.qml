import QtQuick
import Quickshell

Item {
    opacity: hovered ? 0 : 1
    anchors.centerIn: parent

    Text {
        anchors.centerIn: parent
        text: Qt.formatDateTime(clock.date, "hh:mm")
        color: "#fee8b9"

        font {
            family: "SF Mono"
            letterSpacing: -0.5
            pixelSize: 22
            weight: 700
        }

        SystemClock {
            id: clock

            precision: SystemClock.Minutes
        }

    }

}
