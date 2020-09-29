import QtQuick 2.0
import "qrc:/qmlutils" as PegasusUtils
import "../constants.js" as CONSTANTS

Rectangle {
	property var game
	// color: '#000000'
	color: '#00000000'
	width: 150
	height: 150

	Image {
		id: supportimg
		width: parent.width
		height: width
		anchors {
			right: parent.right
			bottom: parent.bottom
		}

		asynchronous: true
		// currently pegasus does not send the support attribute
		source: ((game && game.assets.screenshot.includes('/media/screenshot/')) ? game.assets.screenshot.replace('/media/screenshot/', '/media/support/') : "")
		fillMode: Image.PreserveAspectFit
	}

	// Text {
	// 	text: parent.parent.width + ' ' + parent.parent.right + '|' + parent.parent.height + ' ' + parent.parent.bottom
	// 	color: CONSTANTS.FOREGROUND_LIGHT
	// 	width: parent.width
	// 	wrapMode: Text.WordWrap
	// }
}
