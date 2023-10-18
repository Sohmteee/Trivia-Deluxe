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

1. Complete 5 levels without failing: "Steady Progress"
2. Complete 10 levels without failing: "Leveling Up"
3. Complete 20 levels without failing: "Tenacious Triumph"
4. Complete 50 levels without failing: "Masterful Streak"
5. Complete 100 levels without failing: "Unstoppable Champion"

6. Earn 50 coins: "Coin Collector"
7. Earn 100 coins: "Coin Hoarder"
8. Earn 200 coins: "Gold Gatherer"
9. Earn 500 coins: "Treasure Hunter"
10. Earn 1000 coins: "Coin Millionaire"

11. Answer 5 questions correctly in a row: "Trivia Beginner"
12. Answer 10 questions correctly in a row: "Trivia Expert"
13. Answer 20 questions correctly in a row: "Brainiac"
14. Answer 50 questions correctly in a row: "Trivia Grandmaster"
15. Answer 100 questions correctly in a row: "Trivia Maestro"

16. First in leaderboard: "Leaderboard Champion"
17. Top 3 in leaderboard: "Top Ranker"
18. Top 5 in leaderboard: "High Achiever"
19. Top 10 in leaderboard: ""

21. Collect all achievements: "Ultimate Achiever"



 */
