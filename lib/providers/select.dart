import 'package:flutter/material.dart';

class SelectProvider extends ChangeNotifier {
  int _pageIndex = 0;

  int get selected => _pageIndex;

  set selected(int value) {
    _pageIndex = value;
    notifyListeners();
  }
}
