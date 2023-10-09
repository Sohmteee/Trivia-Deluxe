import 'package:flutter/material.dart';
import 'package:trivia/data/box.dart';

class ScoreProvider extends ChangeNotifier {
  int _score = box.get("score") ?? 0;
  int get score => _score;

  void updateScore(int newScore) {
    _score += newScore;
    box.put("score", score);
    debugPrint("Curent Score: $score");
    notifyListeners();
  }

  void resetScore() {
    _score = 0;
    box.put("score", score);
  }
}
