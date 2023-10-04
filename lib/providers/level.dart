import 'package:flutter/material.dart';

class LevelProvider extends ChangeNotifier {
  int _completedStage = 0;
  int _level = 1;
  get completedStage => _completedStage;
  get level => _level;

  void incrementCompletedStage() {
    if (completedStage < 3) {
      _completedStage++;
    }
    notifyListeners();
  }

  void incrementLevel() {
    _level++;
    notifyListeners();
  }

  void resetCompletedStage() {
    _completedStage = 0;
    notifyListeners();
  }
}
