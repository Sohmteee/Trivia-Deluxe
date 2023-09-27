import 'package:flutter/material.dart';

class LevelProvider extends ChangeNotifier {
  int _completedLevel = 0;
  get completedLevel => _completedLevel;

  void incrementCompletedLevel() {
    debugPrint("Completed Level: $completedLevel");
    if (completedLevel < 3) {
      _completedLevel++;
    } else {
      _completedLevel = 0;
    }
    notifyListeners();
  }

  void resetCompletedLevel() {
    _completedLevel = 0;
  }
}
