import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0

Rectangle{
    id: r
    visible: true
    width: r.parent?parent.width:Screen.width*0.35
    height: r.parent?parent.height:Screen.height*0.5
    x: (Screen.width-width)*0.5
    //title: 'Ayuda de Zool'
    color: 'black'
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
        let t='<h1>Panel Remoto</h1>
<h2>En este panel, pronto comenzaremos a agregar distintas herramientas y funciones para realizar más cálculos en la rueda zoodiacal.</h2>
<br/><br/>
'
        txt.text=t
    }
}
