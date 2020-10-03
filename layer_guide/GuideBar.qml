import QtQuick 2.0
// import "../configs.js" as CONFIGS
// keep colours static for now ;D

Rectangle {
    color: "#88111111"
    height: 34

    ButtonHint {
        id: square
        hint: 'Game menu'
        icon: 2
        anchors {
            left: parent.left
        }
    }

    ButtonHint {
        id: triangle
        hint: 'Filter'
        icon: 3
        anchors {
            left: square.right
        }
    }

    ButtonHint {
        id: cross
        hint: 'Settings'
        icon: 0
        anchors {
            left: triangle.right
        }
    }

    ButtonHint {
        id: circle
        hint: 'Run game'
        icon: 1
        anchors {
            right: parent.right
        }
    }
}
