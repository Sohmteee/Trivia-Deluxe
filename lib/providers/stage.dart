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

1. Complete 3 levels without failing - Novice Success
2. Complete 5 levels without failing - Steady Progress
3. Complete 10 levels without failing - Intermediate Master
5. Complete 20 levels without failing - Expert
6. Complete 50 levels without failing - Grand Master
7. Complete 100 levels without failing - Legendary Hero

8. Earn 50 coins - Coin Collector
9. Earn 100 coins - Big Spender
10. Earn 200 coins - 
11. Earn 500 coins - 
12. Earn 1000 coins - 

13. Answer 3 questions correctly in a row - 
14. Answer 5 questions correctly in a row - 
15. Answer 10 questions correctly in a row - 
16. Answer 20 questions correctly in a row - 
17. Answer 50 questions correctly in a row - 
18. Answer 100 questions correctly in a row - 

19. First in leaderboard - 
20. Top 3 in leaderboard - 
21. Top 5 in leaderboard - 
22. Top 10 in leaderboard - 



 */
