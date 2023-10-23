import 'package:flutter/material.dart';

List streaks = [
  {
    "title": "Level Streaks",
    "image": "assets/images/level.png",
    "streaks": [
      {
        "Steady Progress": {
          "subtitle": "Complete 5 levels without failing",
          "status": false,
          "progress": 0,
          "limit": 5,
        }
      },
      {
        "Leveling Up": {
          "subtitle": "Complete 10 levels without failing",
          "status": false,
          "progress": 0,
          "limit": 10,
        }
      },
      {
        "Tenacious Triumph": {
          "subtitle": "Complete 20 levels without failing",
          "status": false,
          "progress": 0,
          "limit": 20,
        }
      },
      {
        "Masterful Streak": {
          "subtitle": "Complete 50 levels without failing",
          "status": false,
          "progress": 0,
          "limit": 50,
        }
      },
      {
        "Unstoppable Champion": {
          "subtitle": "Complete 100 levels without failing",
          "status": false,
          "progress": 0,
          "limit": 100,
        }
      },
    ],
  },
  {
    "title": "Coin Streaks",
    "image": "assets/images/coins.png",
    "streaks": [
      {
        "Coin Collector": {
          "subtitle": "Earn 50 coins",
          "status": false,
          "progress": 0,
          "limit": 50,
        }
      },
      {
        "Coin Hoarder": {
          "subtitle": "Earn 100 coins",
          "status": false,
          "progress": 0,
          "limit": 100,
        }
      },
      {
        "Gold Gatherer": {
          "subtitle": "Earn 200 coins",
          "status": false,
          "progress": 0,
          "limit": 200,
        }
      },
      {
        "Treasure Hunter": {
          "subtitle": "Earn 500 coins",
          "status": false,
          "progress": 0,
          "limit": 500,
        }
      },
      {
        "Coin Millionaire": {
          "subtitle": "Earn 1000 coins",
          "status": false,
          "progress": 0,
          "limit": 1000,
        }
      },
    ],
  },
  {
    "title": "Trivia Streaks",
    "image": "assets/images/answer.png",
    "streaks": {
      {
        "Trivia Beginner": {
          "subtitle": "Answer 5 questions correctly in a row",
          "status": false,
          "progress": 0,
          "limit": 5,
        }
      },
      {
        "Trivia Expert": {
          "subtitle": "Answer 10 questions correctly in a row",
          "status": false,
          "progress": 0,
          "limit": 10,
        }
      },
      {
        "Brainiac": {
          "subtitle": "Answer 20 questions correctly in a row",
          "status": false,
          "progress": 0,
          "limit": 20,
        }
      },
      {
        "Trivia Grandmaster": {
          "subtitle": "Answer 50 questions correctly in a row",
          "status": false,
          "progress": 0,
          "limit": 50,
        }
      },
      {
        "Trivia Maestro": {
          "subtitle": "Answer 100 questions correctly in a row",
          "status": false,
          "progress": 0,
          "limit": 100,
        }
      },
    },
  },
  {
    "title": "Leaderboard Streaks",
    "image": "assets/images/rank.png",
    "streaks": {
      {
        "Achiever": {
          "subtitle": "Rank top 10 on the leaderboard",
          "status": false,
          "progress": 0,
          "limit": 1,
        },
      },
      {
        "Top Ranker": {
          "subtitle": "Rank top 5 on the leaderboard",
          "status": false,
          "progress": 0,
          "limit": 1,
        },
      },
      {
        "Master Ranker": {
          "subtitle": "Rank top 3 on the leaderboard",
          "status": false,
          "progress": 0,
          "limit": 1,
        },
      },
      {
        "Leaderboard Champion": {
          "subtitle": "Rank first on the leaderboard",
          "status": false,
          "progress": 0,
          "limit": 1,
        },
      },
    },
  },
  {
    "title": "Ultimate Achievement",
    "image": "assets/images/goal.png",
    "streaks": {
      {
        "Ultimate Achiever": {
          "subtitle": "Finish all streaks",
          "status": false,
          "progress": 0,
          "limit": 19,
        },
      },
    }
  },
];

class StreaksProvider extends ChangeNotifier {}
