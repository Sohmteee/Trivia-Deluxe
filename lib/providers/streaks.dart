import 'package:flutter/material.dart';
import 'package:trivia/data/box.dart';

class StreaksProvider extends ChangeNotifier {
  final levelStreakIndex = 0,
      coinStreakIndex = 1,
      triviaStreakIndex = 2,
      leaderboardStreakIndex = 3,
      ultimateStreakIndex = 4;

  final steadyProgressIndex = 0,
      levelingUpIndex = 1,
      tenaciousTriumphIndex = 2,
      masterfulStreakIndex = 3,
      unstoppableChampionIndex = 4;

  final coinCollectorIndex = 0, coinHoarderIndex = 1, goldGathererIndex = 2, treasureHunterIndex = 3, coinMillionaireIndex = 4;

  List<Map<String, dynamic>> streaks = box.get(
    "streaks",
    defaultValue: [
      {
        "title": "Level Streaks",
        "image": "assets/images/level.png",
        "streaks": [
          {
            "title": "Steady Progress",
            "subtitle": "Complete 5 levels without failing",
            "status": false,
            "progress": 0,
            "limit": 5,
          },
          {
            "title": "Leveling Up",
            "subtitle": "Complete 10 levels without failing",
            "status": false,
            "progress": 0,
            "limit": 10,
          },
          {
            "title": "Tenacious Triumph",
            "subtitle": "Complete 20 levels without failing",
            "status": false,
            "progress": 0,
            "limit": 20,
          },
          {
            "title": "Masterful Streak",
            "subtitle": "Complete 50 levels without failing",
            "status": false,
            "progress": 0,
            "limit": 50,
          },
          {
            "title": "Unstoppable Champion",
            "subtitle": "Complete 100 levels without failing",
            "status": false,
            "progress": 0,
            "limit": 100,
          },
        ],
      },
      {
        "title": "Coin Streaks",
        "image": "assets/images/coins.png",
        "streaks": [
          {
            "title": "Coin Collector",
            "subtitle": "Earn 50 coins",
            "status": false,
            "progress": 0,
            "limit": 50,
          },
          {
            "title": "Coin Hoarder",
            "subtitle": "Earn 100 coins",
            "status": false,
            "progress": 0,
            "limit": 100,
          },
          {
            "title": "Gold Gatherer",
            "subtitle": "Earn 200 coins",
            "status": false,
            "progress": 0,
            "limit": 200,
          },
          {
            "title": "Treasure Hunter",
            "subtitle": "Earn 500 coins",
            "status": false,
            "progress": 0,
            "limit": 500,
          },
          {
            "title": "Coin Millionaire",
            "subtitle": "Earn 1000 coins",
            "status": false,
            "progress": 0,
            "limit": 1000,
          },
        ],
      },
      {
        "title": "Trivia Streaks",
        "image": "assets/images/answer.png",
        "streaks": [
          {
            "title": "Trivia Beginner",
            "subtitle": "Answer 5 questions correctly in a row",
            "status": false,
            "progress": 0,
            "limit": 5,
          },
          {
            "title": "Trivia Expert",
            "subtitle": "Answer 10 questions correctly in a row",
            "status": false,
            "progress": 0,
            "limit": 10,
          },
          {
            "title": "Brainiac",
            "subtitle": "Answer 20 questions correctly in a row",
            "status": false,
            "progress": 0,
            "limit": 20,
          },
          {
            "title": "Trivia Grandmaster",
            "subtitle": "Answer 50 questions correctly in a row",
            "status": false,
            "progress": 0,
            "limit": 50,
          },
          {
            "title": "Trivia Maestro",
            "subtitle": "Answer 100 questions correctly in a row",
            "status": false,
            "progress": 0,
            "limit": 100,
          },
        ],
      },
      {
        "title": "Leaderboard Streaks",
        "image": "assets/images/rank.png",
        "streaks": [
          {
            "title": "Achiever",
            "subtitle": "Rank top 10 on the leaderboard",
            "status": false,
            "progress": 0,
            "limit": 1,
          },
          {
            "title": "Top Ranker",
            "subtitle": "Rank top 5 on the leaderboard",
            "status": false,
            "progress": 0,
            "limit": 1,
          },
          {
            "title": "Master Ranker",
            "subtitle": "Rank top 3 on the leaderboard",
            "status": false,
            "progress": 0,
            "limit": 1,
          },
          {
            "title": "Leaderboard Champion",
            "subtitle": "Rank first on the leaderboard",
            "status": false,
            "progress": 0,
            "limit": 1,
          },
        ],
      },
      {
        "title": "Ultimate Achievement",
        "image": "assets/images/goal.png",
        "streaks": [
          {
            "title": "Ultimate Achiever",
            "subtitle": "Finish all streaks",
            "status": false,
            "progress": 0,
            "limit": 19,
          },
        ],
      },
    ],
  );

  int levelStreak = box.get("levelStreak", defaultValue: 0),
      permanentLevelStreak = box.get("permanentLevelStreak", defaultValue: 0);
  int coinStreak = box.get("coinStreak", defaultValue: 0),
      permanentCoinStreak = box.get("permanentCoinStreak", defaultValue: 0);
  int triviaStreak = box.get("triviaStreak", defaultValue: 0),
      permanentTriviaStreak = box.get("permanentTriviaStreak", defaultValue: 0);
  int leaderboardStreak = box.get("leaderboardStreak", defaultValue: 0),
      permanentLeaderboardStreak =
          box.get("permanentLeaderboardStreak", defaultValue: 0);
  int ultimateStreak = box.get("ultimateStreak", defaultValue: 0);

  void updateStreakStatus(int index, int streakIndex) {
    streaks[index]["streaks"][streakIndex]["status"] = true;
    notifyListeners();
  }

  void updateStreakProgress(int index, int streakIndex) {
    streaks[index]["streaks"][streakIndex]["progress"] += 1;
    notifyListeners();
  }

  void resetStreakProgress(int index, int streakIndex) {
    streaks[index]["streaks"][streakIndex]["progress"] = 0;
    notifyListeners();
  }
}
