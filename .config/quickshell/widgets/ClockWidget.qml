import QtQuick
import qs.components
import qs.config
import qs.services

HoverItem {
    id: root

    implicitWidth: label.implicitWidth + 30

    Rectangle {
        anchors.fill: parent
        color: Theme.background
        radius: height / 2
    }

    HoverText {
        id: label

        anchors.centerIn: parent
        text: `${Qt.formatDateTime(ClockService.date, "HH:mm")}`
    }
}
