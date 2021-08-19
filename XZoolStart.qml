import QtQuick 2.0
Rectangle{
	width: app.fs*10
	height: 100
	anchors.centerIn: parent
	Text{
		id: txt
		text: "Esta aplicación..."
		font.pixelSize: app.fs
	}
}
