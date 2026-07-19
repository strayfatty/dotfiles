pragma ComponentBehavior: Bound

import QtQuick
import Quickshell.Hyprland
import qs.components
import qs.config

Pill {
    id: root

    readonly property var monitor: Hyprland.monitorFor(screen)
    required property var screen
    readonly property var workspaceIds: ShellConfig.workspaceForMonitor(screen.name)

    implicitWidth: workspaceRow.implicitWidth + 16
    visible: workspaceIds.length > 0

    Row {
        id: workspaceRow

        anchors.centerIn: parent
        spacing: 6

        Repeater {
            model: root.workspaceIds

            Rectangle {
                id: workspaceDot

                readonly property bool active: root.monitor !== null && root.monitor.activeWorkspace !== null && root.monitor.activeWorkspace.id === workspaceId
                readonly property bool focused: Hyprland.focusedWorkspace !== null && Hyprland.focusedWorkspace.id === workspaceId
                required property int modelData
                readonly property int workspaceId: modelData

                color: workspaceMouse.containsMouse ? Theme.hovered : focused ? Theme.foreground : Theme.inactive
                height: 16
                radius: width / 2
                width: active ? 32 : 16

                Behavior on color {
                    ColorAnimation {
                        duration: 300
                    }
                }
                Behavior on width {
                    NumberAnimation {
                        duration: Theme.animationDuration
                        easing.bezierCurve: [0.5, 0.5, 0.75, 1, 1, 1]
                        easing.type: Easing.BezierSpline
                    }
                }

                MouseArea {
                    id: workspaceMouse

                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true

                    onClicked: Hyprland.dispatch(`hl.dsp.focus({ workspace = "${workspaceDot.workspaceId}" })`)
                }
            }
        }
    }
}
