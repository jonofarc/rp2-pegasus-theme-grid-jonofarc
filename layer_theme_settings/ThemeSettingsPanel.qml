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
            checked: api.memory.get(CONSTANTS.ENABLE_FAVORITES)
            onCheckedChange: updateFavorites()

            KeyNavigation.up: itemColour
            KeyNavigation.down: itemListAll
        }

        CheckBox {
            id: itemListAll
            text: "Enable all apps list"
            textColor: root.textColor
            fontSize: content.normalTextSize
            checked: api.memory.get(CONSTANTS.ENABLE_LIST_ALL)
            onCheckedChange: updateListAll()

            KeyNavigation.up: itemFavorites
            KeyNavigation.down: itemAndroid
        }

        CheckBox {
            id: itemAndroid
            text: "Enable Android app list"
            textColor: root.textColor
            fontSize: content.normalTextSize
            checked: api.memory.get(CONSTANTS.ENABLE_ANDROID)
            onCheckedChange: updateAndroid()

            KeyNavigation.up: itemListAll
            KeyNavigation.down: itemAutoplay
        }

        CheckBox {
            id: itemAutoplay
            text: "Enable video autoplay"
            textColor: root.textColor
            fontSize: content.normalTextSize
            checked: api.memory.get(CONSTANTS.ENABLE_AUTOPLAY)
            onCheckedChange: updateAutoplay()

            KeyNavigation.up: itemAndroid
            KeyNavigation.down: itemLastOpen
        }

        CheckBox {
            id: itemLastOpen
            text: "Keep last open"
            textColor: root.textColor
            fontSize: content.normalTextSize

            KeyNavigation.up: itemAutoplay
            KeyNavigation.down: itemColour
        }
    }

    function updateColour() {
        api.memory.set(CONSTANTS.MAIN_COLOUR, itemColour.value)
    }
    function updateAutoplay() {
        api.memory.set(CONSTANTS.ENABLE_AUTOPLAY, itemAutoplay.checked)
    }
    function updateFavorites() {
        api.memory.set(CONSTANTS.ENABLE_FAVORITES, itemFavorites.checked)
    }
    function updateListAll() {
        api.memory.set(CONSTANTS.ENABLE_LIST_ALL, itemListAll.checked)
    }
    function updateAndroid() {
        api.memory.set(CONSTANTS.ENABLE_ANDROID, itemAndroid.checked)
    }
}