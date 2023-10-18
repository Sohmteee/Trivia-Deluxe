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

1. Complete 3 levels without failing: "Steady Progress"
2. Complete 5 levels without failing: "Leveling Up"
3. Complete 10 levels without failing: "Tenacious Triumph"
4. Complete 20 levels without failing: "Masterful Streak"
5. Complete 50 levels without failing: "Unstoppable Champion"
6. Complete 100 levels without failing: "Flawless Conqueror"
7. Earn 50 coins: "Coin Collector"
8. Earn 100 coins: "Coin Hoarder"
9. Earn 200 coins: "Gold Gatherer"
10. Earn 500 coins: "Treasure Hunter"
11. Earn 1000 coins: "Coin Millionaire"
12. Answer 3 questions correctly in a row: "Trivia Beginner"
13. Answer 5 questions correctly in a row: "Quiz Expert"
14. Answer 10 questions correctly in a row: "Brainiac"
15. Answer 20 questions correctly in a row: "Quiz Virtuoso"
16. Answer 50 questions correctly in a row: "Quiz Grandmaster"
17. Answer 100 questions correctly in a row: "Trivia Maestro"
18. First in leaderboard: "Leaderboard Champion"
19. Top 3 in leaderboard: "Top Ranker"
20. Top 5 in leaderboard: "High Achiever"
21. Top 10 in leaderboard: "Competitive Contender"



 */
