import 'package:flutter/material.dart';

class ScoreProvider extends ChangeNotifier {
  int _score = 0;
  int get score => _score;

  void updatedScore(int newScore) {
    debugPrint("Score: $score");
    if (newScore > score) {
      _score = newScore;
    }
    notifyListeners();
  }

  void resetScore() {
    _score = 0;
    notifyListeners();
  }
}
