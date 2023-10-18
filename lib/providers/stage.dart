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

Complete 3 levels without failing: "Steady Progress"

Complete 5 levels without failing: "Leveling Up"

Complete 10 levels without failing: "Tenacious Triumph"

Complete 20 levels without failing: "Masterful Streak"

Complete 50 levels without failing: "Unstoppable Champion"

Complete 100 levels without failing: "Flawless Conqueror"

Earn 50 coins: "Coin Collector"

Earn 100 coins: "Coin Hoarder"

Earn 200 coins: "Gold Gatherer"

Earn 500 coins: "Treasure Hunter"

Earn 1000 coins: "Coin Millionaire"

Answer 3 questions correctly in a row: "Trivia Beginner"

Answer 5 questions correctly in a row: "Quiz Expert"

Answer 10 questions correctly in a row: "Brainiac"

Answer 20 questions correctly in a row: "Quiz Virtuoso"

Answer 50 questions correctly in a row: "Quiz Grandmaster"

Answer 100 questions correctly in a row: "Trivia Maestro"

First in leaderboard: "Leaderboard Champion"

Top 3 in leaderboard: "Top Ranker"

Top 5 in leaderboard: "High Achiever"

Top 10 in leaderboard: "Competitive Contender"



 */
