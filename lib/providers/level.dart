import 'package:flutter/material.dart';

class LevelProvider extends ChangeNotifier {
  int _completedStage = 0;
  get completedLevel => _completedStage;

  void incrementCompletedStage() {
    if (completedLevel < 3) {
      _completedStage++;
    }
    notifyListeners();
  }

  void resetCompletedLevel() {
    _completedStage = 0;
    notifyListeners();
  }
}
