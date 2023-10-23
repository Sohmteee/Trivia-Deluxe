import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:trivia/data/box.dart';
import 'package:trivia/data/controllers.dart';

class AudioProvider extends ChangeNotifier {
  double musicVolume = box.get("musicVolume", defaultValue: 1.0);
  double effectsVolume = box.get("effectsVolume", defaultValue: .5);
  bool music = box.get("music", defaultValue: true);
  bool soundEffects = box.get("soundEffects", defaultValue: true);

  toggleMusic(bool value) async {
    music = value;
    box.put("music", value);

    if (value) {
      String bgAudio = "audio/bg-music.mp3";
      await bgPlayer.setSource(AssetSource(bgAudio));
      await bgPlayer.resume();
    } else {
      bgPlayer.stop();
    }
    notifyListeners();
  }

  toggleSoundEffects(bool value) {
    soundEffects = value;
    box.put("soundEffects", value);
    notifyListeners();
  }

  setMusicVolume(double newVolume) {
    musicVolume = newVolume;
    box.put("musicVolume", newVolume);

    bgPlayer.setVolume(newVolume);

    if (newVolume == 0) {
      music = false;
      box.put("music", false);
    }
    notifyListeners();
  }

  setEffectsVolume(double newVolume) {
    effectsVolume = newVolume;
    box.put("effectsVolume", newVolume);

    tapPlayer.setVolume(newVolume / 2);
    correctPlayer.setVolume(newVolume);
    wrongPlayer.setVolume(newVolume / 2);
    unavailablePlayer.setVolume(newVolume / 2);
    victoryPlayer.setVolume(newVolume);
    levelPlayer.setVolume(newVolume / 2);
    coinUpPlayer.setVolume(newVolume);
    coinDownPlayer.setVolume(newVolume);
    redeemPlayer.setVolume(newVolume);

    if (newVolume == 0) {
      soundEffects = false;
      box.put("soundEffects", false);
    }

    // notifyListeners();
  }
}
