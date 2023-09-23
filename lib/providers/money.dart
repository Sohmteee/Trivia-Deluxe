import 'package:flutter/material.dart';

class MoneyProvider extends ChangeNotifier{
  int _cash = 1280;
  int _coins = 60;

  int get cash => _cash;
  int get coins => _coins;

  increaseCash(int value) {
    if (cash + value)
  }

}