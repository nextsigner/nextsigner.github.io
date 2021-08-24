import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
import "Funcs.js" as JS

Rectangle{
    id: r
    width: r.parent.width
    height: r.parent.height
    color: apps.backgroundColor
    border.width: 1
    border.color: apps.fontColor
    anchors.centerIn: parent
    SwipeView{
        id: view
        currentIndex: 0
        anchors.fill: parent
        //width: r.width
        //height: r.height
        Item{
            id:xShowIW
            width: r.width
            height: r.height
            Column{
                id: col
                spacing: app.fs*0.25
                anchors.centerIn: parent
                Text{
                    text: '<b>Repositorio Quirón</b>'
                    font.pixelSize: app.fs*0.5
                    color: 'white'
                    width: r.width-100
                    anchors.horizontalCenter: parent.horizontalCenter
                    textFormat: Text.RichText
                    wrapMode: Text.WordWrap
                    onLinkActivated: Qt.openUrlExternally(link)
                }
                ComboBox{
                    id: cbPlanetas
                    model: app.planetas
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                ComboBox{
                    id: cbSign
                    model: app.signos
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                ComboBox{
                    id: cbCasas
                    model: ['Casa 1', 'Casa 2', 'Casa 3', 'Casa 4', 'Casa 5', 'Casa 6', 'Casa 7', 'Casa 8', 'Casa 9', 'Casa 10', 'Casa 11', 'Casa 12']
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Button{
                    text: 'Info'
                    width: app.fs*3
                    height: app.fs*0.6
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        let s1=app.planetasRes[cbPlanetas.currentIndex]
                        let s2=app.objSignsNames[cbSign.currentIndex]
                        let s3=cbCasas.currentIndex
                        app.uSon=s1+'_'+s2+'_'+s3
                        console.log('uSon: '+app.uSon)
                        JS.showIW()
                    }
                }
            }
        }
        Item{
            id:xShowIW2
            width: r.width
            height: r.height
            Flickable{
                width: r.width
                height: r.height
                contentHeight: txt.contentHeight
                Text{
                    id: txt
                    font.pixelSize: app.fs*0.35
                    color: apps.fontColor
                    width: parent.width-app.fs*0.5
                    anchors.horizontalCenter: parent.horizontalCenter
                    textFormat: Text.RichText
                    wrapMode: Text.WordWrap
                    onLinkActivated: Qt.openUrlExternally(link)
                }
            }
        }
    }
    PageIndicator {
        id: indicator
        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Component.onCompleted: {
        r.parent.clip=true
        let t='<br/>
<h2>Tengo una idea para aportar, ¿Cómo solicito su implementación?</h2>
<p>Si tenés alguna idea sobre alguna herramienta, comando, función o característica para agregar a este panel y a la aplicación, comunicate directamente con el programador de la aplicación.</p>
<p>Para comunicarte con el programador, estas son las vías de comunicación:</p>
<ul>
    <li><b>Grupo de Facebook: </b> <a href="https://www.facebook.com/groups/386512166139820" style="color: '+apps.fontColor+';">Aplicación Astrológica Zool</a></li>
    <li><b>Correo Electrónico: </b> <a href="mailto:nextsigner@gmail.com" style="color: '+apps.fontColor+';">nextsigner@gmail.com</a></li>
    <li><b>Whatsapp: </b> +54 11 3802 4370</li>
</ul>

<br/><br/>
<h2>¿Cómo puedo apoyar  este pproyecto?</h2>
<p>Si queres apoyar el desarrollo de esta aplicación, tenés, aquí tenés una lista de opciones.</p>
<ul>
    <li><b>Utilizando y Probando esta aplicación: </b> <a href="https://www.facebook.com/groups/386512166139820" style="color: '+apps.fontColor+';">Avisar sobre un error o comentar</a></li>
    <li><b>Aportando información al Repositorio Quirón: </b> <a href="https://github.com/nextsigner/quiron" style="color: '+apps.fontColor+';">Ir al Repositorio Quirón</a></li>
    <li><b>Enviar dinero por PapPal: </b> <a href="https://paypal.me/lucentrica" style="color: '+apps.fontColor+';">https://paypal.me/lucentrica</a></li>
    <li><b>Enviar dinero por Ualá MasterCard: </b> CVU: Alias NEXTSIGNER.UALA</li>
</ul>
<br/><br/>
'
        txt.text=t
    }
}
