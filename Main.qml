import QtQuick
import "ui/BottomBar"
import "ui/RightScreen"
import "ui/LeftScreen"

Window {
  id: root
  width: 1280
  height: 720
  visible: true
  title: qsTr("Tesla Infotainment")

  LeftScreen {
    id: leftScreen
  }

  RightScreen {
    id: rightScreen
  }

  BottomBar {
    id: bottomBar
  }
}