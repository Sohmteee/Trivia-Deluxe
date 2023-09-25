import 'package:flutter/material.dart';
import 'package:trivia/data/controllers.dart';

class AudioProvider extends ChangeNotifier {
  double musicVolume = .5;
  bool music = true;
  bool soundEffects = true;

  toggleMusic(bool value) {
    music = value;
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
