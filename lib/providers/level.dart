import 'package:flutter/material.dart';
import 'package:trivia/data/box.dart';

class LevelProvider extends ChangeNotifier {
  int _completedStage = 0;
  int _level = box.get("level") ?? 1;
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
    box.put("level", level);
    notifyListeners();
  }

  void resetCompletedStage() {
    _completedStage = 0;
    notifyListeners();
  }
}
