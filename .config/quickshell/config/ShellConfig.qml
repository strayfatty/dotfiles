pragma Singleton

import Quickshell

Singleton {
    function workspaceForMonitor(name) {
        if (name === "DP-1") {
            return [1, 2, 3, 4, 5, 9, 10];
        }

        if (name === "DP-3") {
            return [6];
        }

        return [];
    }
}
