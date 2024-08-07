import QtQuick
import com.company.PlayerController
import com.company.AudioSearchModel
import com.company.AudioController

Rectangle {
  id: mainPlayerController
  property bool hidden: true

  height: parent.height * 1.8
  width: parent.width * 0.60

  z: -1

  gradient: Gradient {
    GradientStop {
      position: 0.0
      color: "#1e1e1e"
    }

    GradientStop {
      position: 1.0
      color: "black"
    }
  }

  AudioInfoBox {
    id: songInfo

    anchors {
      left: parent.left
      verticalCenter: parent.verticalCenter
      margins: 20
    }
  }

  ImageButton {
    id: playListIcon

    anchors {
      right: parent.right
      top: parent.top
      margins: 10
    }

    height: parent.height * .20
    fillMode: Image.PreserveAspectFit

    source: "assets/icons/playlist.png"

    visible: searchPanel.hidden
    onClicked: playlistPanel.hidden = !playlistPanel.hidden
  }

  ImageButton {
    id: fullscreenIcon

    anchors {
      right: playListIcon.left
      top: parent.top
      margins: 10
      rightMargin: 20
    }

    height: parent.height * .18
    fillMode: Image.PreserveAspectFit

    source: "assets/icons/fullscreen.png"

    onClicked: {
      fullscreenVideoBox.isHidden = !fullscreenVideoBox.isHidden
    }
  }

  Row {
    id: buttonsRow
    anchors {
      right: parent.right
      verticalCenter: parent.verticalCenter
      rightMargin: 150
    }

    spacing: 50

    enabled: !!PlayerController.currentSong
    opacity: enabled ? 1 : 0.3

    ImageButton {
      id: previousButton

      width: 20
      height: 20

      source: "assets/icons/previous.png"
      onClicked: PlayerController.switchToPreviousSong()
    }

    ImageButton {
      id: playPauseButton

      width: 20
      height: 20

      source: PlayerController.playing ? "assets/icons/pause.png" : "assets/icons/play.png"
      onClicked: PlayerController.playPause()
    }

    ImageButton {
      id: nextButton

      width: 20
      height: 20

      source: "assets/icons/next.png"

      onClicked: PlayerController.switchToNextSong()
    }
  }

  SearchPanel {
    id: searchPanel

    anchors {
      left: parent.left
      right: parent.right
    }

    height: rightScreen.height

    y: hidden ? parent.height : parent.height - height
  }

  VideoPlayerFullscreenWindow {
    id: fullscreenVideoBox

    anchors {
      bottom: parent.bottom
    }

    x: isHidden ? parent.width : parent.width - width
  }

  PlaylistPanel {
    id: playlistPanel

    anchors {
      bottom: parent.top
      bottomMargin: -1
    }

    x: hidden ? parent.width : parent.width - width

    onSearchRequested: {
      searchPanel.hidden = false
    }
  }

  Behavior on y {
    PropertyAnimation {
      easing.type: Easing.InOutQuad
      duration: 300
    }
  }
}
