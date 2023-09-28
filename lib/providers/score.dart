import 'package:flutter/material.dart';

class ScoreProvider extends ChangeNotifier {
  int _score = 0;
  int get score => _score;

  void updatedScore(int newScore) {
    if (newScore <= 5) {
      _score += 1;
    } else if (newScore <= 10) {
      _score += 2;
    } else if (newScore <= 15) {
      _score += 3;
    } else if (newScore <= 20) {
      _score += 4;
    } else if (newScore <= 25) {
      _score += 5;
    } else if (newScore <= 30) {
      _score += 6;
    }
    debugPrint("Curent Score: $score");
    notifyListeners();
  }

  void resetScore() {
    _score = 0;
    notifyListeners();
  }
}
