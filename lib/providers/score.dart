import 'package:flutter/material.dart';

class ScoreProvider extends ChangeNotifier {
  int _score = 0;
  int get score => _score;

    void updateScore(int newScore) {
    score 
    debugPrint("Curent Score: $score");
    notifyListeners();
  }


}
