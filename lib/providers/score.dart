import 'package:flutter/material.dart';

class ScoreProvider extends ChangeNotifier {
  int _reward = 0;
  int get reward => _reward;

  void updatedScore(int newReward) {
    if (newReward <= 5) {
      _reward += 1;
    } else if (newReward <= 10) {
      _reward += 2;
    } else if (newReward <= 15) {
      _reward += 3;
    } else if (newReward <= 20) {
      _reward += 4;
    } else if (newReward <= 25) {
      _reward += 5;
    } else if (newReward <= 30) {
      _reward += 6;
    }
    debugPrint("Curent Score: $reward");
    notifyListeners();
  }

  void resetScore() {
    _reward = 0;
    notifyListeners();
  }
}
