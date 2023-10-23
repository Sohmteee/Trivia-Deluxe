import 'package:flutter/material.dart';
import 'package:trivia/data/box.dart';

class StreaksProvider extends ChangeNotifier {
  final permanentLevelStreakList = [5, 10, 20, 50, 100];
  final permanentCoinStreakList = [50, 100, 200, 500, 1000];
  final permanentTriviaStreakList = [5, 10, 20, 50, 100];
  final permanentLeaderboardStreakList = [0, 10, 5, 3, 1];

  int count = 0;

  List streaks = box.get(
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

  void updateStreaksData() {
    streaks = [
      {
        "title": "Level Streaks",
        "image": "assets/images/level.png",
        "streaks": [
          {
            "title": "Steady Progress",
            "subtitle": "Complete 5 levels without failing",
            "status": permanentLevelStreak >= 5,
            "progress": permanentLevelStreak >= 5 ? 5 : levelStreak,
            "limit": 5,
          },
          {
            "title": "Leveling Up",
            "subtitle": "Complete 10 levels without failing",
            "status": permanentLevelStreak >= 10,
            "progress": permanentLevelStreak >= 10 ? 10 : levelStreak,
            "limit": 10,
          },
          {
            "title": "Tenacious Triumph",
            "subtitle": "Complete 20 levels without failing",
            "status": permanentLevelStreak >= 20,
            "progress": permanentLevelStreak >= 20 ? 20 : levelStreak,
            "limit": 20,
          },
          {
            "title": "Masterful Streak",
            "subtitle": "Complete 50 levels without failing",
            "status": permanentLevelStreak >= 50,
            "progress": permanentLevelStreak >= 50 ? 50 : levelStreak,
            "limit": 50,
          },
          {
            "title": "Unstoppable Champion",
            "subtitle": "Complete 100 levels without failing",
            "status": permanentLevelStreak >= 100,
            "progress": permanentLevelStreak >= 100 ? 100 : levelStreak,
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
            "status": permanentCoinStreak >= 50,
            "progress": permanentCoinStreak >= 50 ? 50 : coinStreak,
            "limit": 50,
          },
          {
            "title": "Coin Hoarder",
            "subtitle": "Earn 100 coins",
            "status": permanentCoinStreak >= 100,
            "progress": permanentCoinStreak >= 100 ? 100 : coinStreak,
            "limit": 100,
          },
          {
            "title": "Gold Gatherer",
            "subtitle": "Earn 200 coins",
            "status": permanentCoinStreak >= 200,
            "progress": permanentCoinStreak >= 200 ? 200 : coinStreak,
            "limit": 200,
          },
          {
            "title": "Treasure Hunter",
            "subtitle": "Earn 500 coins",
            "status": permanentCoinStreak >= 500,
            "progress": permanentCoinStreak >= 500 ? 500 : coinStreak,
            "limit": 500,
          },
          {
            "title": "Coin Millionaire",
            "subtitle": "Earn 1000 coins",
            "status": permanentCoinStreak >= 1000,
            "progress": permanentCoinStreak >= 1000 ? 1000 : coinStreak,
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
            "status": permanentTriviaStreak >= 5,
            "progress": permanentTriviaStreak >= 5 ? 5 : triviaStreak,
            "limit": 5,
          },
          {
            "title": "Trivia Expert",
            "subtitle": "Answer 10 questions correctly in a row",
            "status": permanentTriviaStreak >= 10,
            "progress": permanentTriviaStreak >= 10 ? 10 : triviaStreak,
            "limit": 10,
          },
          {
            "title": "Brainiac",
            "subtitle": "Answer 20 questions correctly in a row",
            "status": permanentTriviaStreak >= 20,
            "progress": permanentTriviaStreak >= 20 ? 20 : triviaStreak,
            "limit": 20,
          },
          {
            "title": "Trivia Grandmaster",
            "subtitle": "Answer 50 questions correctly in a row",
            "status": permanentTriviaStreak >= 50,
            "progress": permanentTriviaStreak >= 50 ? 50 : triviaStreak,
            "limit": 50,
          },
          {
            "title": "Trivia Maestro",
            "subtitle": "Answer 100 questions correctly in a row",
            "status": permanentTriviaStreak >= 100,
            "progress": permanentTriviaStreak >= 100 ? 100 : triviaStreak,
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
            "status": permanentLeaderboardStreak == 10,
            "progress": permanentLeaderboardStreak == 10
                ? 1
                : leaderboardStreak == 10
                    ? 1
                    : 0,
            "limit": 1,
          },
          {
            "title": "Top Ranker",
            "subtitle": "Rank top 5 on the leaderboard",
            "status": permanentLeaderboardStreak == 5,
            "progress": permanentLeaderboardStreak == 5
                ? 1
                : leaderboardStreak == 5
                    ? 1
                    : 0,
            "limit": 1,
          },
          {
            "title": "Master Ranker",
            "subtitle": "Rank top 3 on the leaderboard",
            "status": permanentLeaderboardStreak == 3,
            "progress": permanentLeaderboardStreak == 3
                ? 1
                : leaderboardStreak == 3
                    ? 1
                    : 0,
            "limit": 1,
          },
          {
            "title": "Leaderboard Champion",
            "subtitle": "Rank first on the leaderboard",
            "status": permanentLeaderboardStreak == 1,
            "progress": permanentLeaderboardStreak == 1
                ? 1
                : leaderboardStreak == 1
                    ? 1
                    : 0,
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
            "status": ultimateStreak >= 19,
            "progress": ultimateStreak >= 19 ? 19 : ultimateStreak,
            "limit": 19,
          },
        ],
      },
    ];
    box.put("streaks", streaks);
    notifyListeners();
  }

  void updateLevelStreak(bool correct) {
    if (correct) {
      levelStreak += 1;
      box.put("levelStreak", levelStreak);

      if (levelStreak > permanentLevelStreak &&
          permanentLevelStreakList.contains(levelStreak)) {
        permanentLevelStreak = levelStreak;
        box.put("permanentLevelStreak", permanentLevelStreak);
      }
    } else {
      levelStreak = 0;
      box.put("levelStreak", levelStreak);
    }

    updateStreaksData();
    notifyListeners();
  }

  void updateCoinStreak(int coins) {
    coinStreak = coins;
    box.put("coinStreak", coinStreak);

    if (coinStreak > permanentCoinStreak &&
        permanentCoinStreakList.contains(coinStreak)) {
      permanentCoinStreak = coinStreak;
      box.put("permanentCoinStreak", permanentCoinStreak);
    }

    updateStreaksData();
    notifyListeners();
  }

  void updateTriviaStreak(bool correct) {
    if (correct) {
      triviaStreak += 1;
      box.put("triviaStreak", triviaStreak);

      if (triviaStreak > permanentTriviaStreak &&
          permanentTriviaStreakList.contains(triviaStreak)) {
        permanentTriviaStreak = triviaStreak;
        box.put("permanentTriviaStreak", permanentTriviaStreak);
      }
    } else {
      triviaStreak = 0;
      box.put("triviaStreak", triviaStreak);
    }

    updateStreaksData();
    notifyListeners();
  }

  void updateLeaderboardStreak(bool correct) {
    int index = permanentLeaderboardStreakList.indexOf(leaderboardStreak);


    if (correct) {
      leaderboardStreak = permanentLeaderboardStreakList[index + 1];
      box.put("leaderboardStreak", leaderboardStreak);

      if (leaderboardStreak > permanentLeaderboardStreak &&
          permanentLeaderboardStreakList.contains(leaderboardStreak)) {
        permanentLeaderboardStreak = leaderboardStreak;
        box.put("permanentLeaderboardStreak", permanentLeaderboardStreak);
      }
    } else {
      leaderboardStreak = leaderboardStreak == 0
          ? 0
          : permanentLeaderboardStreakList[index - 1];
      box.put("leaderboardStreak", leaderboardStreak);
    }

    updateStreaksData();
    notifyListeners();
  }

  void updateUltimateStreak() {
    int totalStreaksFinished = 0;

    for (var streak in streaks) {
      for (var subStreak in streak["streaks"]) {
        if (subStreak["status"] == true) {
          totalStreaksFinished += 1;
        }
      }
    }

    ultimateStreak = totalStreaksFinished;
    box.put("ultimateStreak", ultimateStreak);

    updateStreaksData();
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
