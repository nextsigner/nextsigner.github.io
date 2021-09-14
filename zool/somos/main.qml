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
        let t='<h1>Desarrolladores de Zool</h1>
<h2>Lista de Patrocinadores</h2>
<p>Lista de personas que colaboran con el proyecto Zool</p>
<p>Esta aplicación es desarrollada por:</p>
<ul>
    <li>Ricardo Martín Pizarro (Programador)</li>
    <li>Eitán Flores</li>
    <li>Juanchirris Ruiz</li>
</ul>
<p>Esta aplicación es posible gracias al apoyo y patrocinio de:</p>
<ul>
    <li>Nicolás Martín Pizarro</li>
    <li>Natalia Soledad Pintos</li>
    <li>Nora Castrejón</li>
</ul>
<p>Tambien puedes contactarte por las siguientes vías de comunicación:</p>
<ul>
    <li><b>Whatsapp: </b>+54 11 3802 4370</li>
    <li><b>E-Mail: </b>nextsigner@gmail.com</li>
</ul>

<h2>Tengo una idea para aportar, ¿Cómo solicito su implementación?</h2>
<p>Si tenés alguna idea sobre alguna herramienta, comando, función o característica para agregar a este panel y a la aplicación, comunicate directamente con el programador de la aplicación.</p>
<p>Para comunicarte con el programador, estas son las vías de comunicación:</p>
<ul>
    <li><b>Grupo de Facebook: </b> <a href="https://www.facebook.com/groups/386512166139820" style="color: '+apps.fontColor+';">Aplicación Astrológica Zool</a></li>
    <li><b>Correo Electrónico: </b> <a href="mailto:nextsigner@gmail.com" style="color: '+apps.fontColor+';">nextsigner@gmail.com</a></li>
    <li><b>Whatsapp: </b> +54 11 3802 4370</li>
</ul>

<h2>¿Cómo puedo apoyar  este proyecto?</h2>
<p>Si queres apoyar el desarrollo de esta aplicación, tenés, aquí tenés una lista de opciones.</p>
<ul>
    <li><b>Utilizando y Probando esta aplicación: </b> <a href="https://www.facebook.com/groups/386512166139820" style="color: '+apps.fontColor+';">Avisar sobre un error o comentar</a></li>
    <li><b>Aportando información al Repositorio Quirón: </b> <a href="https://github.com/nextsigner/quiron" style="color: '+apps.fontColor+';">Ir al Repositorio Quirón</a></li>
    <li><b>Enviar dinero por PapPal: </b> <a href="https://paypal.me/lucentrica" style="color: '+apps.fontColor+';">https://paypal.me/lucentrica</a></li>
    <li><b>Enviar dinero por Ualá MasterCard: </b> CVU: Alias NEXTSIGNER.UALA</li>
</ul>
<br/><br/>

<br/><br/>
'
        txt.text=t
    }
}
