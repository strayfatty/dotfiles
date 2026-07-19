pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import qs.bar.modules
import qs.config
import qs.widgets

Variants {
    model: Quickshell.screens

    PanelWindow { // qmllint disable uncreatable-type
        id: panel

        property bool drawerOpen: false
        required property var modelData

        color: "transparent"
        implicitHeight: Theme.panelHeight
        screen: modelData

        anchors {
            left: true
            right: true
            top: true
        }

        // qmllint disable
        margins {
            top: 2
        }

        // qmllint enable

        ClockWidget {
            id: clockWidget
            anchors {
                bottom: parent.bottom
                left: parent.left
                leftMargin: 5
                top: parent.top
            }
        }

        SubmapIndicator {
            anchors {
                bottom: parent.bottom
                left: clockWidget.right
                leftMargin: 10
                top: parent.top
            }
        }

        Workspaces {
            anchors.centerIn: parent
            height: parent.height
            screen: panel.screen
        }

        PanelWindow { // qmllint disable uncreatable-type
            id: drawerWindow

            property real reveal: panel.drawerOpen ? 1 : 0

            color: "transparent"
            exclusiveZone: 0
            implicitWidth: 360
            screen: panel.screen
            visible: panel.drawerOpen || reveal > 0

            // qmllint enable

            Behavior on reveal {
                NumberAnimation {
                    duration: Theme.animationDuration
                    easing.bezierCurve: [0.5, 0.5, 0.75, 1, 1, 1]
                    easing.type: Easing.BezierSpline
                }
            }

            anchors {
                bottom: true
                left: true
                top: true
            }

            // qmllint disable
            margins {
                bottom: 4
                left: 4
                top: 4
            }

            Rectangle {
                color: Theme.background
                radius: 16
                width: parent.width
                x: (drawerWindow.reveal - 1) * width

                anchors {
                    bottom: parent.bottom
                    top: parent.top
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: panel.drawerOpen = false
                }
            }
        }
    }
}
