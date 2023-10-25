import 'package:flutter/material.dart';
import 'package:trivia/data/box.dart';

class StreaksProvider extends ChangeNotifier {
  final permanentLevelStreakList = [5, 10, 20, 50, 100];
  final permanentCoinStreakList = [100, 200, 500, 1000, 2000];
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
            "collected": false,
            "progress": 0,
            "limit": 5,
            "reward": 10,
          },
          {
            "title": "Leveling Up",
            "subtitle": "Complete 10 levels without failing",
            "status": false,
            "collected": false,
            "progress": 0,
            "limit": 10,
            "reward": 20,
          },
          {
            "title": "Tenacious Triumph",
            "subtitle": "Complete 20 levels without failing",
            "status": false,
            "collected": false,
            "progress": 0,
            "limit": 20,
            "reward": 30,
          },
          {
            "title": "Masterful Streak",
            "subtitle": "Complete 50 levels without failing",
            "status": false,
            "collected": false,
            "progress": 0,
            "limit": 50,
            "reward": 40,
          },
          {
            "title": "Unstoppable Champion",
            "subtitle": "Complete 100 levels without failing",
            "status": false,
            "collected": false,
            "progress": 0,
            "limit": 100,
            "reward": 50,
          },
        ],
      },
      {
        "title": "Coin Streaks",
        "image": "assets/images/coins.png",
        "streaks": [
          {
            "title": "Coin Collector",
            "subtitle": "Earn 100 coins",
            "status": false,
            "collected": false,
            "progress": 0,
            "limit": 100,
            "reward": 10,
          },
          {
            "title": "Coin Hoarder",
            "subtitle": "Earn 200 coins",
            "status": false,
            "collected": false,
            "progress": 0,
            "limit": 200,
            "reward": 20,
          },
          {
            "title": "Gold Gatherer",
            "subtitle": "Earn 500 coins",
            "status": false,
            "collected": false,
            "progress": 0,
            "limit": 500,
            "reward": 30,
          },
          {
            "title": "Treasure Hunter",
            "subtitle": "Earn 1000 coins",
            "status": false,
            "collected": false,
            "progress": 0,
            "limit": 1000,
            "reward": 40,
          },
          {
            "title": "Coin Millionaire",
            "subtitle": "Earn 2000 coins",
            "status": false,
            "collected": false,
            "progress": 0,
            "limit": 2000,
            "reward": 50,
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
            "collected": false,
            "progress": 0,
            "limit": 5,
            "reward": 10,
          },
          {
            "title": "Trivia Expert",
            "subtitle": "Answer 10 questions correctly in a row",
            "status": false,
            "collected": false,
            "progress": 0,
            "limit": 10,
            "reward": 20,
          },
          {
            "title": "Brainiac",
            "subtitle": "Answer 20 questions correctly in a row",
            "status": false,
            "collected": false,
            "progress": 0,
            "limit": 20,
            "reward": 30,
          },
          {
            "title": "Trivia Grandmaster",
            "subtitle": "Answer 50 questions correctly in a row",
            "status": false,
            "collected": false,
            "progress": 0,
            "limit": 50,
            "reward": 40,
          },
          {
            "title": "Trivia Maestro",
            "subtitle": "Answer 100 questions correctly in a row",
            "status": false,
            "collected": false,
            "progress": 0,
            "limit": 100,
            "reward": 50,
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
            "collected": false,
            "progress": 0,
            "limit": 1,
            "reward": 10,
          },
          {
            "title": "Top Ranker",
            "subtitle": "Rank top 5 on the leaderboard",
            "status": false,
            "collected": false,
            "progress": 0,
            "limit": 1,
            "reward": 20,
          },
          {
            "title": "Master Ranker",
            "subtitle": "Rank top 3 on the leaderboard",
            "status": false,
            "collected": false,
            "progress": 0,
            "limit": 1,
            "reward": 50,
          },
          {
            "title": "Leaderboard Champion",
            "subtitle": "Rank first on the leaderboard",
            "status": false,
            "collected": false,
            "progress": 0,
            "limit": 1,
            "reward": 100,
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
            "collected": false,
            "progress": 0,
            "limit": 19,
            "reward": 200,
          },
        ],
      },
    ],
  );

  List collectableRewards = [];

  int levelStreak = box.get("levelStreak", defaultValue: 0),
      permanentLevelStreak = box.get("permanentLevelStreak", defaultValue: 0);
  int coinStreak = box.get("coinStreak", defaultValue: 50),
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
            "collected": false,
            "progress": permanentLevelStreak >= 5
                ? 5
                : levelStreak >= 5
                    ? 5
                    : levelStreak,
            "limit": 5,
            "reward": 10,
          },
          {
            "title": "Leveling Up",
            "subtitle": "Complete 10 levels without failing",
            "status": permanentLevelStreak >= 10,
            "collected": false,
            "progress": permanentLevelStreak >= 10
                ? 10
                : levelStreak >= 10
                    ? 10
                    : levelStreak,
            "limit": 10,
            "reward": 20,
          },
          {
            "title": "Tenacious Triumph",
            "subtitle": "Complete 20 levels without failing",
            "status": permanentLevelStreak >= 20,
            "collected": false,
            "progress": permanentLevelStreak >= 20
                ? 20
                : levelStreak >= 20
                    ? 20
                    : levelStreak,
            "limit": 20,
            "reward": 30,
          },
          {
            "title": "Masterful Streak",
            "subtitle": "Complete 50 levels without failing",
            "status": permanentLevelStreak >= 50,
            "collected": false,
            "progress": permanentLevelStreak >= 50
                ? 50
                : levelStreak >= 50
                    ? 50
                    : levelStreak,
            "limit": 50,
            "reward": 40,
          },
          {
            "title": "Unstoppable Champion",
            "subtitle": "Complete 100 levels without failing",
            "status": permanentLevelStreak >= 100,
            "collected": false,
            "progress": permanentLevelStreak >= 100
                ? 100
                : levelStreak >= 100
                    ? 100
                    : levelStreak,
            "limit": 100,
            "reward": 50,
          },
        ],
      },
      {
        "title": "Coin Streaks",
        "image": "assets/images/coins.png",
        "streaks": [
          {
            "title": "Coin Collector",
            "subtitle": "Earn 100 coins",
            "status": permanentCoinStreak >= 100,
            "collected": false,
            "progress": permanentCoinStreak >= 100
                ? 100
                : coinStreak >= 100
                    ? 100
                    : coinStreak,
            "limit": 100,
            "reward": 10,
          },
          {
            "title": "Coin Hoarder",
            "subtitle": "Earn 200 coins",
            "status": permanentCoinStreak >= 200,
            "collected": false,
            "progress": permanentCoinStreak >= 200
                ? 200
                : coinStreak >= 200
                    ? 200
                    : coinStreak,
            "limit": 200,
            "reward": 20,
          },
          {
            "title": "Gold Gatherer",
            "subtitle": "Earn 500 coins",
            "status": permanentCoinStreak >= 500,
            "collected": false,
            "progress": permanentCoinStreak >= 500
                ? 500
                : coinStreak >= 500
                    ? 500
                    : coinStreak,
            "limit": 500,
            "reward": 30,
          },
          {
            "title": "Treasure Hunter",
            "subtitle": "Earn 1000 coins",
            "status": permanentCoinStreak >= 1000,
            "collected": false,
            "progress": permanentCoinStreak >= 1000
                ? 1000
                : coinStreak >= 1000
                    ? 1000
                    : coinStreak,
            "limit": 1000,
            "reward": 40,
          },
          {
            "title": "Coin Millionaire",
            "subtitle": "Earn 2000 coins",
            "status": permanentCoinStreak >= 2000,
            "collected": false,
            "progress": permanentCoinStreak >= 2000
                ? 2000
                : coinStreak >= 2000
                    ? 2000
                    : coinStreak,
            "limit": 2000,
            "reward": 50,
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
            "collected": false,
            "progress": permanentTriviaStreak >= 5
                ? 5
                : triviaStreak >= 5
                    ? 5
                    : triviaStreak,
            "limit": 5,
            "reward": 10,
          },
          {
            "title": "Trivia Expert",
            "subtitle": "Answer 10 questions correctly in a row",
            "status": permanentTriviaStreak >= 10,
            "collected": false,
            "progress": permanentTriviaStreak >= 10
                ? 10
                : triviaStreak >= 10
                    ? 10
                    : triviaStreak,
            "limit": 10,
            "reward": 20,
          },
          {
            "title": "Brainiac",
            "subtitle": "Answer 20 questions correctly in a row",
            "status": permanentTriviaStreak >= 20,
            "collected": false,
            "progress": permanentTriviaStreak >= 20
                ? 20
                : triviaStreak >= 20
                    ? 20
                    : triviaStreak,
            "limit": 20,
            "reward": 30,
          },
          {
            "title": "Trivia Grandmaster",
            "subtitle": "Answer 50 questions correctly in a row",
            "status": permanentTriviaStreak >= 50,
            "collected": false,
            "progress": permanentTriviaStreak >= 50
                ? 50
                : triviaStreak >= 50
                    ? 50
                    : triviaStreak,
            "limit": 50,
            "reward": 40,
          },
          {
            "title": "Trivia Maestro",
            "subtitle": "Answer 100 questions correctly in a row",
            "status": permanentTriviaStreak >= 100,
            "collected": false,
            "progress": permanentTriviaStreak >= 100
                ? 100
                : triviaStreak >= 100
                    ? 100
                    : triviaStreak,
            "limit": 100,
            "reward": 50,
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
            "collected": false,
            "progress": permanentLeaderboardStreak == 10
                ? 1
                : leaderboardStreak == 10
                    ? 1
                    : 0,
            "limit": 1,
            "reward": 10,
          },
          {
            "title": "Top Ranker",
            "subtitle": "Rank top 5 on the leaderboard",
            "status": permanentLeaderboardStreak == 5,
            "collected": false,
            "progress": permanentLeaderboardStreak == 5
                ? 1
                : leaderboardStreak == 5
                    ? 1
                    : 0,
            "limit": 1,
            "reward": 20,
          },
          {
            "title": "Master Ranker",
            "subtitle": "Rank top 3 on the leaderboard",
            "status": permanentLeaderboardStreak == 3,
            "collected": false,
            "progress": permanentLeaderboardStreak == 3
                ? 1
                : leaderboardStreak == 3
                    ? 1
                    : 0,
            "limit": 1,
            "reward": 50,
          },
          {
            "title": "Leaderboard Champion",
            "subtitle": "Rank first on the leaderboard",
            "status": permanentLeaderboardStreak == 1,
            "collected": false,
            "progress": permanentLeaderboardStreak == 1
                ? 1
                : leaderboardStreak == 1
                    ? 1
                    : 0,
            "limit": 1,
            "reward": 100,
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
            "collected": false,
            "progress": ultimateStreak >= 19
                ? 19
                : ultimateStreak >= 19
                    ? 19
                    : ultimateStreak,
            "limit": 19,
            "reward": 200,
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
    updateUltimateStreak();
    notifyListeners();
  }

  void updateCoinStreak(int coins) {
    coinStreak = coins;
    box.put("coinStreak", coinStreak);

    if (coinStreak > permanentCoinStreak) {
      if (coinStreak >= 100) {
        permanentCoinStreak = 100;
      }
      if (coinStreak >= 200) {
        permanentCoinStreak = 200;
      }
      if (coinStreak >= 500) {
        permanentCoinStreak = 500;
      }
      if (coinStreak >= 1000) {
        permanentCoinStreak = 1000;
      }
      if (coinStreak >= 2000) {
        permanentCoinStreak = 2000;
      }

      box.put("permanentCoinStreak", permanentCoinStreak);
    }

    updateStreaksData();
    updateUltimateStreak();
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
    updateUltimateStreak();
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
    updateUltimateStreak();
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

  void checkCollectableReward() {
    for (var streak in streaks) {
      for (var subStreak in streak["streaks"]) {
        if (subStreak["status"] == true && subStreak["collected"] == false) {
          collectableRewards.add(subStreak);
          notifyListeners();
        }
      }
    }
  }
}
