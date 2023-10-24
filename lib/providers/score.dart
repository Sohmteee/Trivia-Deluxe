import 'package:flutter/material.dart';
import 'package:trivia/data/box.dart';

class ScoreProvider extends ChangeNotifier {
  // Formula: number of corect answers / number of total answers * 100 / average time per question

  int _coinScore = box.get("coinScore", defaultValue: 0);
  int get coinScore => _coinScore;

  void increaseScore(int newScore) {
    _coinScore += newScore;
    box.put("coinScore", coinScore);

    debugPrint("Curent Score: $coinScore");
    notifyListeners();
  }

  void decreaseScore(int newScore) {
    _coinScore -= newScore;
    box.put("coinScore", coinScore);

    debugPrint("Curent Score: $coinScore");
    notifyListeners();
  }

  void resetScore() {
    _coinScore = 0;
    box.put("coinScore", coinScore);
  }
}
