import 'package:flutter/material.dart';
import 'package:trivia/data/box.dart';

class ScoreProvider extends ChangeNotifier {
  // Formula: number of corect answers / number of total answers * 100 / average time per question

  int _coinScore = box.get("coinScore", defaultValue: 0);
  int get coinScore => _coinScore;
  int score = 

  void increaseCoinScore(int newCoinScore) {
    _coinScore += newCoinScore;
    box.put("coinScore", coinScore);

    debugPrint("Curent Coin Score: $coinScore");
    notifyListeners();
  }

  void decreaseCoinScore(int newCoinScore) {
    _coinScore -= newCoinScore;
    box.put("coinScore", coinScore);

    debugPrint("Curent Coin Score: $coinScore");
    notifyListeners();
  }

  void resetCoinScore() {
    _coinScore = 0;
    box.put("coinScore", coinScore);
  }
}
