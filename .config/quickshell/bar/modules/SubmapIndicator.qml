import QtQuick
import qs.components
import qs.config
import qs.services

Pill {
    implicitWidth: submapLabel.implicitWidth + 24
    visible: HyprlandState.currentSubmap === "clean"

    Text {
        id: submapLabel

        anchors.centerIn: parent
        anchors.verticalCenterOffset: 1
        color: Theme.foreground
        font.family: Theme.fontFamily
        font.pixelSize: 14
        font.weight: Font.DemiBold
        text: "KEYS OFF"
    }
}
