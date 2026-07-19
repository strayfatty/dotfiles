pragma Singleton

import Quickshell

Singleton {
    readonly property alias date: clock.date

    SystemClock {
        id: clock

        precision: SystemClock.Minutes
    }
}
