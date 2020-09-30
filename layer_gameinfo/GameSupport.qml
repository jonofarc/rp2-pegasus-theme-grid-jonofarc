import QtQuick 2.0
import "../configs.js" as CONFIGS

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
	// 	text: (game && JSON.stringify(game))
	// 	color: CONFIGS.getForegroundColour(api)
	// 	width: parent.parent.width
	// 	height: 350
	// 	anchors {
	// 		right: parent.parent.right
	// 		bottom: parent.parent.bottom
	// 	}
	// 	wrapMode: Text.WordWrap
	// }
}
