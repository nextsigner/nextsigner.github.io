import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0

Window{
    id: r
    visible: true
    width: Screen.width*0.35
    height: Screen.height*0.5
    x: (Screen.width-width)*0.5
    title: 'Bienvenido a Zool - Novedades'
    color: 'black'
    Flickable{
        width: r.width
        height: r.height
        contentHeight: txt.contentHeight
        Text{
            id: txt
            font.pixelSize: app.fs
            color: 'white'
            width: r.width-100
            anchors.horizontalCenter: parent.horizontalCenter
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
            onLinkActivated: Qt.openUrlExternally(link)
        }
    }
    Component.onCompleted: {
        let t='<h1>Novedades sobre Zool</h1>
<h2>Importante</h2>
<p><b>Aviso:</b> Esta aplicación en estos momentos solo está disponible para ser utilizada para pruebas.</p>

<p>Esta aplicación <b>NO</b> está terminada. Debido a esto, no uses esta aplicación para gestionar o guardar cartas natales que sean importantes para tí.</p>

<p>En las próximas versiones de esta aplicación ya no se mostrarán estos mensajes de aviso.</p>

<p>Para más información, ayuda o consultas sobre cómo utilizar esta aplicación, se ha creado un grupo de facebook al que puedes unirte como usuario. Pertenecer a este grupo te permitirá recibir asistencia, ayuda directa y allí podras hacer sugerencias y/o recomendaciones de manera directa al programador de la aplicación.</p>

<p><b>Enlace para <b>Unirse</b> al Grupo de Facebook: </b> <a href="https://www.facebook.com/groups/386512166139820/" style="color:yellow">Aplicación de Astrología Zool</a></p>

<p>Esta aplicación es posible gracias a:</p>
<ul>
    <li>Ricardo Martín Pizarro (Programador)</li>
    <li>Nicolás Martín Pizarro</li>
    <li>Natalia Soledad Pintos</li>
    <li>Nora Castrejón</li>
</ul>
<p>Tambien puedes contactarte por las siguientes vías de comunicación:</p>
<ul>
    <li><b>Whatsapp: </b>+54 11 3802 4370</li>
    <li><b>E-Mail: </b>nextsigner@gmail.com</li>
</ul>
<br/><br/>
'
        txt.text=t
    }
}
