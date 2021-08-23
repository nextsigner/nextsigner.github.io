import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0

Window{
    id: r
    visible: true
    width: Screen.width*0.35
    height: Screen.height*0.5
    x: (Screen.width-width)*0.5
    title: 'Ayuda de Zool'
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

<h2>Crear Mapa Natal</h2>
<p>Ir al Menú->Archivo->Nuevo. En el lateral izquierdo aparecerá un panel en donde hay que llenar los campos con los datos requeridos. Los datos son:</p>
<ul>
    <li>Nombre del consultante (así se llamará el archivo o documento)</li>
    <li>Fecha de nacimiento.</li>
    <li>Hora de nacimiento.</li>
    <li>GMT (cantidad de horas de diferencia entre la hora de la ciudad de nacimiento, cantidad negativa o positiva, hasta el meridiano de Greenwich o meridiano cero.)</li>
    <li>Lugar de nacimiento. (Ciudad, provincia y/o Region y país. Por ejemplo: Florida Buenos Aires Argentina)</li>
</ul>

<br/><br/>
'
        txt.text=t
    }
}
