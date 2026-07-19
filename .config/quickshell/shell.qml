pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Hyprland

ShellRoot {
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    Variants {
        model: Quickshell.screens

        PanelWindow { // qmllint disable uncreatable-type
            id: panel

            required property var modelData
            property bool showingDate: false
            readonly property var hyprlandMonitor: Hyprland.monitorFor(screen)
            readonly property var workspaceIds: {
                if (screen.name === "DP-1")
                    return [1, 2, 3, 4, 5, 9, 10]
                if (screen.name === "DP-3")
                    return [6]
                return []
            }

            screen: modelData
            color: "transparent"
            implicitHeight: 24

            anchors {
                top: true
                left: true
                right: true
            }

            // qmllint disable
            margins {
                top: 2
            }
            // qmllint enable

            Rectangle {
                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    left: parent.left
                    leftMargin: 5
                }

                implicitWidth: timeLabel.implicitWidth + 20
                radius: height / 2
                color: "#0f1416"

                Text {
                    id: timeLabel

                    anchors.centerIn: parent
                    anchors.verticalCenterOffset: 1
                    text: ` ${Qt.formatDateTime(clock.date, panel.showingDate ? "ddd, MMMM dd" : "HH:mm")} `
                    color: "#85d2e7"
                    font.family: "Hack Nerd Font Mono"
                    font.pixelSize: 14
                    font.weight: Font.DemiBold
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: panel.showingDate = !panel.showingDate
                }
            }

            Rectangle {
                anchors.centerIn: parent
                implicitWidth: workspaceRow.implicitWidth + 16
                height: parent.height
                radius: height / 2
                color: "#0f1416"
                visible: panel.workspaceIds.length > 0

                Row {
                    id: workspaceRow

                    anchors.centerIn: parent
                    spacing: 6

                    Repeater {
                        model: panel.workspaceIds

                        Rectangle {
                            id: workspaceDot

                            required property int modelData
                            readonly property int workspaceId: modelData
                            readonly property bool active: panel.hyprlandMonitor !== null
                                && panel.hyprlandMonitor.activeWorkspace !== null
                                && panel.hyprlandMonitor.activeWorkspace.id === workspaceId
                            readonly property bool focused: Hyprland.focusedWorkspace !== null
                                && Hyprland.focusedWorkspace.id === workspaceId

                            width: active ? 32 : 16
                            height: 16
                            radius: width / 2
                            color: workspaceMouse.containsMouse
                                ? "#b2cbd3"
                                : focused ? "#85d2e7" : "#1d343a"

                            Behavior on width {
                                NumberAnimation {
                                    duration: 194
                                    easing.type: Easing.BezierSpline
                                    easing.bezierCurve: [0.5, 0.5, 0.75, 1, 1, 1]
                                }
                            }

                            Behavior on color {
                                ColorAnimation {
                                    duration: 300
                                }
                            }

                            MouseArea {
                                id: workspaceMouse

                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: Hyprland.dispatch(
                                    `hl.dsp.focus({ workspace = "${workspaceDot.workspaceId}" })`
                                )
                            }
                        }
                    }
                }
            }
        }
    }
}
