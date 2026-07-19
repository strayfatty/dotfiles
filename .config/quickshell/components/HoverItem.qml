import QtQuick

Item {
    id: root

    default property alias content: inner.data
    readonly property alias hovered: ma.containsMouse

    signal clicked

    MouseArea {
        id: ma

        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true

        onClicked: root.clicked()
    }

    Item {
        id: inner

        readonly property alias hovered: root.hovered

        anchors.fill: parent
    }
}
