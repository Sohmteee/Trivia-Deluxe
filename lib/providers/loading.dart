import 'package:flutter/material.dart';

class LoadingProvider extends ChangeNotifier {
  int _loadingValue = 0;

  int get loadingValue => _loadingValue;

  void incrementLoadingValue() {
    while (_loadingValue < 100) {
      Future.delayed(const Duration(milliseconds: 200), () {
        if (_loadingValue == 50) {
          Future.delayed(const Duration(milliseconds: 500), () {
            _loadingValue = 80;
            notifyListeners();
          });
        } else {
          _loadingValue++;
          notifyListeners();
        }
      });
    }
  }
}
