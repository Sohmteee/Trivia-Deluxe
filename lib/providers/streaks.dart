import 'package:flutter/material.dart';
import 'package:trivia/data/box.dart';
import 'package:trivia/data/variables.dart';

class StreaksProvider extends ChangeNotifier {
  final permanentLevelStreakList = [5, 10, 20, 50, 100];
  final permanentCoinStreakList = [50, 100, 200, 500, 1000];
  final permanentTriviaStreakList = [5, 10, 20, 50, 100];
  final permanentLeaderboardStreakList = [1, 3, 5, 10];

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

  void updateStreakStatus(
      {required int streakIndex,
      required int subStreakIndex,
      required bool status}) {
    streaks[streakIndex]["streaks"][subStreakIndex]["status"] = status;
    notifyListeners();
  }

  void updateLevelStreak({int? level}) {
    levelStreak = level ?? levelStreak + 1;
    box.put("levelStreak", levelStreak);

    if (levelStreak > permanentLevelStreak &&
        permanentLevelStreakList.contains(levelStreak)) {
      permanentLevelStreak = levelStreak;
      box.put("permanentLevelStreak", permanentLevelStreak);
    }

    if (levelStreak >= 5) {
      updateStreakStatus(
          streakIndex: levelStreakIndex,
          subStreakIndex: steadyProgressIndex,
          status: true);
    } else if (levelStreak >= 10) {
      updateStreakStatus(
          streakIndex: levelStreakIndex,
          subStreakIndex: levelingUpIndex,
          status: true);
    } else if (levelStreak >= 20) {
      updateStreakStatus(
          streakIndex: levelStreakIndex,
          subStreakIndex: tenaciousTriumphIndex,
          status: true);
    } else if (levelStreak >= 50) {
      updateStreakStatus(
          streakIndex: levelStreakIndex,
          subStreakIndex: masterfulStreakIndex,
          status: true);
    } else if (levelStreak >= 100) {
      updateStreakStatus(
          streakIndex: levelStreakIndex,
          subStreakIndex: unstoppableChampionIndex,
          status: true);
    }
    notifyListeners();
  }

  void updateStreakProgress(
      {required int streakIndex, required int subStreakIndex, int? progress}) {
    streaks[streakIndex]["streaks"][subStreakIndex]["progress"] +=
        progress ?? 1;
    notifyListeners();
  }

  void resetStreakProgress(
      {required int streakIndex, required int subStreakIndex}) {
    streaks[streakIndex]["streaks"][subStreakIndex]["progress"] = 0;
    notifyListeners();
  }
}
