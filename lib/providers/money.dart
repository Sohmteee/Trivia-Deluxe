import 'package:flutter/material.dart';

class MoneyProvider extends ChangeNotifier {
  int _cash = 0;
  int _coins = 10;

  int get cash => _cash;
  int get coins => _coins;

  increaseCash(int value) {
    if (cash + value <= 5000) {
      _cash += value;
    }

    notifyListeners();
  }

  decreaseCash(int value) {
    if (cash - value >= 0) {
      _cash -= value;
    }

    notifyListeners();
  }

  increaseCoins(int value) {
    if (coins + value <= 5000) {
      _coins += value;
    }

    notifyListeners();
  }

  decreaseCoins(int value) {
    if (coins - value >= 0) {
      _coins -= value;
    }

    notifyListeners();
  }
}
