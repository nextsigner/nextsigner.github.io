import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import Qt.labs.settings 1.1
import "Funcs.js" as JS

Rectangle{
    id: r
    width: r.parent.width
    height: r.parent.height
    color: apps.backgroundColor
    border.width: 1
    border.color: apps.fontColor
    anchors.centerIn: parent
    //property string parentState: panelRemoto
    //    onParentStateChanged: {
    //        if(panelRemoto.state==='show')prs.state='show'
    //    }
    Settings{
        id: prs
        fileName: unik.getPath(4)+'/panleRemoto.cfg'
        property string state: 'show'
        property int currentViewIndex: 0
        onStateChanged: panelRemoto.state=state
    }
    SwipeView{
        id: view
        currentIndex: prs.currentViewIndex
        onCurrentIndexChanged: prs.currentViewIndex=currentIndex
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
                    width: r.width-app.fs
                    anchors.horizontalCenter: parent.horizontalCenter
                    textFormat: Text.RichText
                    wrapMode: Text.WordWrap
                    onLinkActivated: Qt.openUrlExternally(link)
                }
                Text{
                    text: 'De momento solo hay información de Plutón, Saturno y otros incompletos.\nPodes colaborar enviando información al correo nextsigner@gmail.com'
                    font.pixelSize: app.fs*0.35
                    color: 'white'
                    width: r.width-app.fs
                    wrapMode: Text.WordWrap
                    anchors.horizontalCenter: parent.horizontalCenter
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
                    text: 'Obtener Información'
                    width: implicitContentWidth+app.fs*0.5
                    height: app.fs*0.6
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        let s1=app.planetasRes[cbPlanetas.currentIndex]
                        let s2=app.objSignsNames[cbSign.currentIndex]
                        let s3=cbCasas.currentIndex+1
                        app.uSon=s1+'_'+s2+'_'+s3
                        console.log('uSon: '+app.uSon)
                        JS.showIW()
                    }
                }
            }
        }
        Item{
            width: r.width
            height: r.height
            Flickable{
                width: r.width
                height: r.height
                contentHeight: txt2.contentHeight
                Column{
                    spacing: app.fs*0.5
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: app.fs*0.5
                    Text{
                        text: '<b>Controles</b>'
                        font.pixelSize: app.fs*0.5
                        color: apps.fontColor
                        width: parent.width-app.fs*0.5
                        anchors.horizontalCenter: parent.horizontalCenter
                        textFormat: Text.RichText
                        wrapMode: Text.WordWrap
                        onLinkActivated: Qt.openUrlExternally(link)
                    }
                    Row{
                        spacing: app.fs*0.25
                        anchors.horizontalCenter: parent.horizontalCenter
                        XText{text: 'Ver Lineas de Grados';anchors.verticalCenter: parent.verticalCenter}
                        CheckBox{
                            checked: apps.showNumberLines
                            anchors.verticalCenter: parent.verticalCenter
                            onCheckStateChanged: apps.showNumberLines=checked
                        }
                    }
                    Row{
                        spacing: app.fs*0.25
                        anchors.horizontalCenter: parent.horizontalCenter
                        XText{text: 'Ver Ejes de Casas';anchors.verticalCenter: parent.verticalCenter}
                        CheckBox{
                            checked: apps.showHousesAxis
                            anchors.verticalCenter: parent.verticalCenter
                            onCheckStateChanged: apps.showHousesAxis=checked
                        }
                    }
                    Column{
                        spacing: app.fs*0.25
                        anchors.horizontalCenter: parent.horizontalCenter
                        XText{text: 'Ancho del Ejes de Casas';anchors.horizontalCenter: parent.horizontalCenter}
                        SpinBox{
                            stepSize: 2.0
                            value: apps.widthHousesAxis
                            onValueChanged: {
                                if(value<3||value>12){
                                    apps.widthHousesAxis=1.0
                                }else{
                                    apps.widthHousesAxis=value
                                }
                            }
                        }
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
        Item{
            width: r.width
            height: r.height
            Flickable{
                width: r.width
                height: r.height
                contentHeight: txt2.contentHeight
                Text{
                    id: txt2
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
    Row{
        anchors.top: parent.top
        anchors.topMargin: app.fs*0.15
        anchors.left: parent.left
        anchors.leftMargin: app.fs*0.15
        spacing:app.fs*0.15
        Rectangle{
            width: app.fs*0.5
            height: width
            radius: width*0.15
            border.width: 1
            anchors.verticalCenter: parent.verticalCenter
            Text{text: 'X';font.pixelSize: parent.width*0.8;anchors.centerIn: parent}
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    prs.state='hide'
                }
            }
        }
        Repeater{
            model: 3
            Rectangle{
                visible: index===0&&view.currentIndex>0||index===2&&view.currentIndex<view.count-1
                width: index!==1?app.fs*0.5:r.width-app.fs
                height: index!==1?width:app.fs*0.5
                radius: width*0.15
                border.width: 1
                //opacity: index!==1?0.5:1.0
                anchors.verticalCenter: parent.verticalCenter
                Text{text: index===0?'<':'>';font.pixelSize: parent.width*0.8;anchors.centerIn: parent}
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(index===0){
                            view.currentIndex--
                        }else{
                            view.currentIndex++
                        }
                    }
                }
            }
        }
    }
    Timer{
        running: panelRemoto.state==='show'
        repeat: true
        interval: 1000
        onTriggered: prs.state=panelRemoto.state
    }
    Component.onCompleted: {
        //console.log('PanelRemoto Cfg path: '+unik.getPath(4))
        panelRemoto.state=prs.state

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
<h2>¿Cómo puedo apoyar  este proyecto?</h2>
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

        t='<br/>
<h1>Aviso del Programador</h1>
<h2>¿Qué estoy progrmando en la aplicación actualmente?</h2>
<ul>
    <li>Optimizando el script Python para calcular las velocidades de los planetas y así poder identificar o detectar cual está retrógrado.</li>
<li>Estoy agregando una rueda zodiacal extra para mostrar las revoluciones solares conjuntamente con la carta natal.</li>
<li>Agregando información sobre el porcentáje de los elementos fuego, tierra, aire y agua en la GUI o Interfaz Gráfica de Usuario.</li>
</ul>
<h2>¿Que se agregará a esta aplicación?</h2>
<p>Actualmente usted está utilizando Zool en su versión '+version+'. Las modificaciones mencionadas serán agregadas a la versión 0.4</p>
<h2>¿Ha encontrado alguna falla o desea aportar alguna idea?</h2>
<p>Puede comunicarse directamente conmigo a las siguientes vías de comunicación.</p>
<ul>
    <li><b>Grupo de Facebook: </b> <a href="https://www.facebook.com/groups/386512166139820" style="color: '+apps.fontColor+';">Aplicación Astrológica Zool</a></li>
    <li><b>Correo Electrónico: </b> <a href="mailto:nextsigner@gmail.com" style="color: '+apps.fontColor+';">nextsigner@gmail.com</a></li>
    <li><b>Whatsapp: </b> +54 11 3802 4370</li>
</ul>
<br/><br/>
'
        txt2.text=t
    }
}
