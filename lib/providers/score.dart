import 'package:flutter/material.dart';

class ScoreProvider extends ChangeNotifier {
  int _score = 0;
  int get score => _score;

  void updatedScore(int newScore) {
    debugPrint("Score: $newScore");
    if (newScore <= 5) {
      _score += 1;
    } else if (newScore <= 10) {
      _score += 1;
    } else if (newScore <= 15) {
      _score += 1;
    } else if (newScore <= 20) {
      _score += 1;
    } else if (newScore <= 25) {
      _score += 1;
    } else if (newScore <= 5) {
      _score += 1;
    }
    debugPrint("Curent Score: $score");
    notifyListeners();
  }

  void resetScore() {
    _score = 0;
    notifyListeners();
  }
}
