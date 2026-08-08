import QtQuick

Rectangle {
    id: bar

    property bool workspaceView: false
    property bool hovered: false

    anchors.centerIn: parent
    width: hovered ? 800 : 150
    height: 40
    scale: bar.hovered ? 1 : 1
    opacity: hovered ? 1 : 1
    bottomLeftRadius: 10
    bottomRightRadius: 10
    color: "#1e1e2e"

    Workspaces {
        bar: root
    }

    Clock {
    }

    WorkspacesPopup {
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: bar.hovered = true
        onExited: bar.hovered = false
    }

    Behavior on width {
        NumberAnimation {
            duration: 200
            easing.type: Easing.OutCubic
        }

    }

    Behavior on height {
        NumberAnimation {
            duration: 200
            easing.type: Easing.OutCubic
        }

    }

}
