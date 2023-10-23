import 'package:flutter/material.dart';
import 'package:trivia/data/box.dart';

class MoneyProvider extends ChangeNotifier {
  int _cash = box.get("cash", defaultValue:5000);
  int _previousCoins = box.get("previousCoins", defaultValue:0);
  int _coins = box.get("coins", defaultValue:50);

  int get cash => _cash;
  int get previousCoins => _previousCoins;
  int get coins => _coins;

  int _reward = 0;
  int get reward => _reward;

  /* 
  10 coins = 100 cash
  20 coins = 200 cash
  50 coins = 500 cash
  100 coins = 1,000 cash
  200 coins = 2,000 cash
  500 coins = 5,000 cash

  100 cash = 500 naira
  200 cash = 1,000 naira
  500 cash = 2500 naira
  1,000 cash = 5,000 naira
  2,000 cash = 1,0000 naira
  5,000 cash = 25,000 naira
  10,000 cash = 50,000 naira

   */

  increaseCash(int value) {
    if (cash + value <= 5000) {
      _cash += value;
      box.put("cash", cash);
    }

    notifyListeners();
  }

  decreaseCash(int value) {
    if (cash - value >= 0) {
      _cash -= value;
      box.put("cash", cash);
    }

    notifyListeners();
  }

  increaseCoins(int value) {
    if (coins + value <= 5000) {
      _previousCoins = coins;
      _coins += value;
      box.put("coins", coins);
      box.put("previousCoins", previousCoins);
    }

    notifyListeners();
  }

  decreaseCoins(int value) {
    if (coins - value >= 0) {
      _previousCoins = coins;
      _coins -= value;
      box.put("coins", coins);
      box.put("previousCoins", previousCoins);
    }

    notifyListeners();
  }

  void updateReward(int newReward) {
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
    debugPrint("Curent Reward: $reward");
    notifyListeners();
  }

  resetCoins() {
    _previousCoins = 0;
    _coins = 50;
    box.put("previousCoins", previousCoins);
    box.put("coins", coins);
  }

  void resetReward() {
    _reward = 0;
    notifyListeners();
  }
}
