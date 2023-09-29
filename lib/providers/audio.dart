import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:trivia/data/box.dart';
import 'package:trivia/data/controllers.dart';

class AudioProvider extends ChangeNotifier {
  double musicVolume = box.get("musicVolume") ?? 1;
  bool music = box.get("music") ?? true;
  bool soundEffects = box.get("soundEffects") ?? false;

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
    // player.setVolume(value == false ? 0 : musicVolume);
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
    tapPlayer.setVolume(newVolume);
    correctPlayer.setVolume(newVolume);
    wrongPlayer.setVolume(newVolume);
    unavailablePlayer.setVolume(newVolume);
    victoryPlayer.setVolume(newVolume);
    levelPlayer.setVolume(newVolume);
    coinUpPlayer.setVolume(newVolume);
    coinDownPlayer.setVolume(newVolume);
    redeemPlayer.setVolume(newVolume);

    if (newVolume == 0) {
      music = false;
      box.put("music", false);
    }
    notifyListeners();
  }
}
