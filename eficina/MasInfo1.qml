import QtQuick 2.9
import QtQuick.Controls 2.2

Rectangle {
    id: r
    anchors.fill: parent
    Text {
        id: txt1
        text: '<b>Mas Info 1</b>'
        font.pixelSize: app.fs*2
        anchors.centerIn: parent
    }
    Component.onCompleted:  {
        r.parent.loaded()
    }
}
