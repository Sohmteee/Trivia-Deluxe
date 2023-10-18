import 'package:flutter/material.dart';

class StageProvider extends ChangeNotifier {
  int _completedStage = 0;
  get completedStage => _completedStage;

  void incrementCompletedStage() {
    if (completedStage < 3) {
      _completedStage++;
    }
    notifyListeners();
  }

  void resetCompletedStage() {
    _completedStage = 0;
    notifyListeners();
  }
}

/* 
Achievements

1. Complete 3 levels without failing
2. Complete 5 levels without failing
3. Complete 10 levels without failing
5. Complete 20 levels without failing
6. Complete 50 levels without failing
7. Complete 100 levels without failing

8. Earn 50 coins
9. Earn 100 coins
10. Earn 200 coins
11. Earn 500 coins
12. Earn 1000 coins

13. 

 */
