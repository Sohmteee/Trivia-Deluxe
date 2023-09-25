import 'package:flutter/material.dart';

class AudioProvider extends ChangeNotifier {
  double volume = 1;

  setVolume(double newVolume) {
    volume = newVolume;
    notifyListeners();
  }
}
