pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io

Singleton {
    id: root

    property string currentSubmap: "default"

    Process {
        command: ["hyprctl", "submap"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: root.currentSubmap = text.trim()
        }
    }

    Connections {
        function onRawEvent(event) {
            if (event.name === "submap")
                root.currentSubmap = event.data;
        }

        target: Hyprland
    }
}
