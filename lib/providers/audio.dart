import 'package:flutter/material.dart';
import 'package:trivia/data/controllers.dart';

class AudioProvider extends ChangeNotifier {
  double musicVolume = .5;
  bool music = true;
  bool soundEffects = true;

  toggleMusic(bool value) {
    music = value;
    if (value) {
    String bgAudio = "audio/bg-music.mp3";
    await player.setSource(AssetSource(bgAudio));
    await player.resume();
    } else {
      player.stop();
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
    player.setVolume(newVolume);
    if (newVolume == 0) {
      music = false;
    }
    notifyListeners();
  }
}
