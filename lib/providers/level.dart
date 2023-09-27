import 'package:flutter/material.dart';
import 'package:trivia/data/box.dart';

class LevelProvider extends ChangeNotifier {
  int _completedLevel = box.get("completedLevel") ?? 0;
  get completedLevel => _completedLevel;

  void incrementCompletedLevel() {
    debugPrint("Completed Level: $completedLevel");
    if (completedLevel < 3) {
      _completedLevel++;
      box.put("completedLevel", _completedLevel);
    }
    debugPrint("New Completed Level: $completedLevel");
    notifyListeners();
  }

  void resetCompletedLevel() {
    _completedLevel = 0;
    box.put("completedLevel", _completedLevel);
    notifyListeners();
  }
}
