import 'package:flutter/material.dart';

class LevelProvider extends ChangeNotifier {
  int _completedLevel = 0;
  get completedLevel => _completedLevel;

  void incrementCompletedLevel() {
    if (completedLevel < 3) {
      _completedLevel++;
    }
    notifyListeners();
  }

  void resetCompletedLevel() {
    _completedLevel = 0;
    notifyListeners();
  }
}
