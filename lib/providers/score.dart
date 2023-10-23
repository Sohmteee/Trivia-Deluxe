import 'package:flutter/material.dart';
import 'package:trivia/data/box.dart';

class ScoreProvider extends ChangeNotifier {
  // Formula: number of corect answers / number of total answers * 100 / average time per question

  int _score = box.get("score", defaultValue: 0);
  int get score => _score;

  void increaseScore(int newScore) {
    _score += newScore;
    box.put("score", score);

    debugPrint("Curent Score: $score");
    notifyListeners();
  }

  void decreaseScore(int newScore) {
    _score -= newScore;
    box.put("score", score);

    debugPrint("Curent Score: $score");
    notifyListeners();
  }

  void resetScore() {
    _score = 0;
    box.put("score", score);
  }
}
