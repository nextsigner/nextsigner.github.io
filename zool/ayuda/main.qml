import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0

Window{
    id: r
    visible: true
    width: Screen.width*0.35
    height: Screen.height*0.75
    x: (Screen.width-width)*0.5
    y:app.fs*3
    visibility: "Maximized"
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
    Shortcut{
        sequence: 'Esc'
        onActivated: r.close()
    }
    Component.onCompleted: {
        let t='<h1>Ayuda de Zool</h1>
<h2>Crear Mapa Natal</h2>
<p>Ir al Menú->Archivo->Nuevo. En el lateral izquierdo aparecerá un panel en donde hay que llenar los campos con los datos requeridos. Los datos son:</p>
<ul>
    <li>Nombre del consultante (así se llamará el archivo o documento)</li>
    <li>Fecha de nacimiento.</li>
    <li>Hora de nacimiento.</li>
    <li>GMT (cantidad de horas de diferencia entre la hora de la ciudad de nacimiento, cantidad negativa o positiva, hasta el meridiano de Greenwich o meridiano cero.)</li>
    <li>Lugar de nacimiento. (Ciudad, provincia y/o Region y país. Por ejemplo: Florida Buenos Aires Argentina)</li>
</ul>

<p>El archivo se creará por defecto en la carpeta "Documentos". Ejemplo: "C:/Users/ns/Documents And Settings/Zool/nombreDeNuevoArchivo.json".</p>
<p><b>Nota: </b> Para ver el panel de crear carta natal desde el teclado presiones las teclas "Ctrl" y "N" simultáneamente.</p>

<h2>Abrir Mapa Natal</h2>
<p>Ir al Menú->Archivo->Abrir. En el lateral izquierdo aparecerá un panel en donde hay un campo de texto para introducir el nombre del archivo o documento a abrir. Una vez escrito los primeros caractéres del nombre del archivo buscado, aparecerá debajo una lista de archivos encontrados.</p>
<p>La búsqueda de los archivo se realizará por defecto en la carpeta "Documentos". Ejemplo: "C:/Users/ns/Documents And Settings/Zool/*.json".</p>
<p><b>Nota: </b> Para ver el panel de buscar carta natal desde el teclado presiones las teclas "Ctrl" y "F" simultáneamente.</p>

<h2>Lista de Funciones por medio de Combinación de Teclas</h2>
<ul>

    <li>
        <b>Ctrl+<Número entre 0 y 9>: </b>Seleccionar cuerpo: 0=Sol, 1=Luna, 2=Mercurio, 3=Venus, 4=Marte, 5=Júpiter, 6=Saturno, 7=Urano, 8=Neptuno, 9=Plutón.
    </li>

    <li>
        <b>Ctrl+*: </b>Seleccionar Ascendente.
    </li>

    <li>
        <b>Ctrl+/: </b>Seleccionar Medio Cielo.
    </li>

    <li>
        <b>Espacio: </b>Cambiar desde signos a imágenes de planetas.
    </li>

    <li>
        <b>Ctrl+Shift+d: </b>Mostrar / Ocultar Decanatos.
    </li>

    <li>
        <b>Ctrl+Shift+l: </b>Mostrar / Ocultar Líneas de grados.
    </li>

    <li>
        <b>Ctrl+Shift+r: </b>Grabar posición de Zoom y posición de la carta.
    </li>

</ul>

<br/><br/>
<h4>Contacto</h4>
<p>Esta aplicación aún está en etapa de desarrollo. Si necesitas más ayuda o információn me puedes contactar al correo nextsigner@gmail.com o a el Whatsapp +5491138024370</p>
<br/><br/>

<br/><br/>
<h4>Última actualización 6/2/2022</h4>
<br/><br/>
'
        txt.text=t
    }
}
