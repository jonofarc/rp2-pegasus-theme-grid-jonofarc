import QtQuick 2.6
import "../configs.js" as CONFIGS
import "../constants.js" as CONSTANTS
import "../layer_filter"

FocusScope {
    id: root

    property alias panelColor: panel.color
    property color textColor: CONFIGS.getForegroundColour(api)

    width: parent.parent.width * 0.4
    //content.width
    height: content.height

    Rectangle {
        id: panel
        color: CONFIGS.getMainColour(api)
        anchors.fill: parent
    }

    Column {
        id: content

        property int normalTextSize: CONSTANTS.FONT_SIZE
        property int selectedIndex: 0
        padding: vpx(20)
        spacing: vpx(8)

        width: parent.width

        Text {
            id: header
            text: "Settings"
            color: root.textColor
            font.bold: true
            font.pixelSize: vpx(26)
            height: font.pixelSize * 1.5
        }

        ComboBox {
            id: itemColour
            focus: true
            fontSize: content.normalTextSize
            label: "Colour"
            textColor: root.textColor
            model: CONSTANTS.AVAILABLE_COLOURS
            value: api.memory.get(CONSTANTS.MAIN_COLOUR)
            onValueChange: updateColour()

            KeyNavigation.up: itemLastOpen
            KeyNavigation.down: itemFavorites
        }

        CheckBox {
            id: itemFavorites
            text: "Enable favorite list"
            textColor: root.textColor
            fontSize: content.normalTextSize

            KeyNavigation.down: itemAndroid
            KeyNavigation.up: itemColour

            // checked: api.memory.get('enableFavorites')
            // nextCheckState: function() {
            //     api.memory.set('enableFavorites', (checkState === Qt.Checked))
            // }
        }

        CheckBox {
            id: itemAndroid
            text: "Enable all apps list"
            textColor: root.textColor
            fontSize: content.normalTextSize

            KeyNavigation.up: itemFavorites
            KeyNavigation.down: itemListAll

            // checked: api.memory.get('enableAndroidApps')
            // onClicked: api.memory.set('enableAndroidApps', (checkState === Qt.Checked))
            // nextCheckState: function() {
            //     api.memory.set('enableAndroidApps', (checkState === Qt.Checked))
            // }
        }

        CheckBox {
            id: itemListAll
            text: "Enable Android app list"
            textColor: root.textColor
            fontSize: content.normalTextSize

            KeyNavigation.up: itemAndroid
            KeyNavigation.down: itemAutopplay
        }

        CheckBox {
            id: itemAutopplay
            text: "Enable video autoplay"
            textColor: root.textColor
            fontSize: content.normalTextSize

            KeyNavigation.up: itemListAll
            KeyNavigation.down: itemLastOpen
        }

        CheckBox {
            id: itemLastOpen
            text: "Keep last open"
            textColor: root.textColor
            fontSize: content.normalTextSize

            KeyNavigation.up: itemAutopplay
            KeyNavigation.down: itemColour

            // checked: api.memory.get('enableAndroidApps')
            // onClicked: api.memory.set('enableAndroidApps', (checkState === Qt.Checked))
            // nextCheckState: function() {
            //     api.memory.set('enableAndroidApps', (checkState === Qt.Checked))
            // }
        }
    }

    function updateColour() {
        // console.log('updateColour', itemColour.value)
        api.memory.set(CONSTANTS.MAIN_COLOUR, itemColour.value)
    }
}
