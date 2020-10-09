import QtQuick 2.0
import "../configs.js" as CONFIGS

Rectangle {
    property var game
    // color: '#000000'
    color: '#00000000'
    width: parent.width * 0.34 - 1
    height: supportimg.height + (supportimg.source != '' ? 20 : 0)

    Image {
        id: supportimg
        width: parent.width - 20
        anchors {
            right: parent.right
            bottom: parent.bottom

            rightMargin: 10
            bottomMargin: 10
        }
        verticalAlignment: Image.AlignBottom

        asynchronous: true
        source: game && game.assets.cartridge ? game.assets.cartridge : ""
        fillMode: Image.PreserveAspectFit
    }
}
