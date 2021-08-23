import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0

Window{
    id: r
    visible: true
    width: Screen.width*0.35
    height: Screen.height*0.5
    x: (Screen.width-width)*0.5
    title: 'Bienvenido a Zool - Novedades'
    color: 'black'
    onClosing: {
        apps.newClosed=true
    }
    Flickable{
        width: r.width
        height: r.height
        contentHeight: txt.contentHeight
        Text{
            id: txt
            font.pixelSize: app.fs*0.5
            color: 'white'
            width: r.width-100
            anchors.horizontalCenter: parent.horizontalCenter
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
            onLinkActivated: Qt.openUrlExternally(link)
        }
    }
    Component.onCompleted: {
        let t='<h1>Ayuda de Zool</h1>
<h2>Hoy 23/08/2021 12:46hs de Argentina estoy completando este manual</h2>
<br/><br/>
'
        txt.text=t
    }
}
