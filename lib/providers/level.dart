import 'package:flutter/material.dart';

class LevelProvider extends ChangeNotifier {
  int _completedLevel = 0;
  get 

  void incrementCompletedLevel() {
    if (completedLevel < 3) {
      completedLevel++;
    } else {
      completedLevel = 0;
    }
    notifyListeners();
  }

  void resetCompletedLevel() {
    completedLevel = 0;
  }
}
