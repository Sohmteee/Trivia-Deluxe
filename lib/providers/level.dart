import 'package:flutter/material.dart';

class LevelProvider extends ChangeNotifier {
  int completedLevel = 0;

  void incrementCompletedLevel() {
    if (completedLevel < 3) {
      completedLevel++;
    } else {
      completedLevel = 0;
    }
    notifyListeners();
  }
}
