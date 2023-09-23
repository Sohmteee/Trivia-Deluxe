import 'package:flutter/material.dart';

class LoadingProvider extends ChangeNotifier{
  int _loadingValue = 0;

  int get loadingValue => _loadingValue;

  void incrementLoadingValue() {
    for (int i = 0; i < 100; i++) {
      Future.delayed(const Duration(milliseconds: 200), () {
        _loadingValue++;
        debugPrint(_loadingValue.toString());
        notifyListeners();
        return _loadingValue;
      });
    }
  }
}