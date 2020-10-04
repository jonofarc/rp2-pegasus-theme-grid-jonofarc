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
        source: game && game.assets.cartridge ? game.assets.cartridge : ""
        fillMode: Image.PreserveAspectFit
    }
}
