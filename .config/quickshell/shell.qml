pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

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
        }
    }
}
