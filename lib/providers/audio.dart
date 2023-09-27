import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:trivia/data/controllers.dart';

class AudioProvider extends ChangeNotifier {
  double musicVolume = 1;
  bool music = true;
  bool soundEffects = false;

  toggleMusic(bool value) async {
    music = value;
    if (value) {
      String bgAudio = "audio/bg-music.mp3";
      await bgPlayer.setSource(AssetSource(bgAudio));
      await bgPlayer.resume();
    } else {
      bgPlayer.stop();
    }
    // player.setVolume(value == false ? 0 : musicVolume);
    notifyListeners();
  }

  toggleSoundEffects(bool value) {
    soundEffects = value;
    notifyListeners();
  }

  setMusicVolume(double newVolume) {
    musicVolume = newVolume;
    bgPlayer.setVolume(newVolume);
    if (newVolume == 0) {
      music = false;
    }
    notifyListeners();
  }
}
