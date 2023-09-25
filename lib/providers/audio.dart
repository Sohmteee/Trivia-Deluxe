import 'package:flutter/material.dart';
import 'package:trivia/data/controllers.dart';

class AudioProvider extends ChangeNotifier {
  double volume = 1;

  setVolume(double newVolume) {
    volume = newVolume;
    player.setVolume(newVolume);
    notifyListeners();
  }
}
