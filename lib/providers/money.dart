import 'package:flutter/material.dart';
import 'package:trivia/data/box.dart';

class MoneyProvider extends ChangeNotifier {
  int _cash = box.get("cash") ?? 0;
  int _previousCoins = box.get("previousCoins") ?? 0;
  int _coins = box.get("coins") ?? 10;

  int get cash => _cash;
  int get previousCoins => _previousCoins;
  int get coins => _coins;

  increaseCash(int value) {
    if (cash + value <= 5000) {
      _cash += value;
      box.put("cash", value);
    }

    notifyListeners();
  }

  decreaseCash(int value) {
    if (cash - value >= 0) {
      _cash -= value;
      box.put("cash", value);
    }

    notifyListeners();
  }

  increaseCoins(int value) {
    if (coins + value <= 5000) {
      _previousCoins = coins;
      _coins += value;
      box.put("coins", value);
      box.put("previousCoins", coins);
    }

    notifyListeners();
  }

  decreaseCoins(int value) {
    if (coins - value >= 0) {
      _previousCoins = coins;
      _coins -= value;
      box.put("coins", value);
      box.put("previousCoins", coins);
    }

    notifyListeners();
  }
}
