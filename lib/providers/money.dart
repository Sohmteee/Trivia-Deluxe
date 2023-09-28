import 'package:flutter/material.dart';
import 'package:trivia/data/box.dart';

class MoneyProvider extends ChangeNotifier {
  int _cash = box.get("cash") ?? 5000;
  int _previousCoins = box.get("previousCoins") ?? 0;
  int _coins = box.get("coins") ?? 50;

  int get cash => _cash;
  int get previousCoins => _previousCoins;
  int get coins => _coins;

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
  1,0000 cash = 5,0000 naira

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
}
