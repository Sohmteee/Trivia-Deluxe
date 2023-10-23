import 'package:flutter/material.dart';

Map streaks = {
  "Level Streaks": {
    "image": "",
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
  "Coin Streaks": {
    "image": "",
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
  "Trivia Streaks": {
    "image": "",
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
        "": {
          "subtitle": "Answer 50 questions correctly in a row",
          "status": false,
          "progress": 0,
          "limit": 50,
        }
      },
      {
        "": {
          "subtitle": "Answer 100 questions correctly in a row",
          "status": false,
          "progress": 0,
          "limit": 100,
        }
      },
    },
  },
  "Leaderboard Streaks": {
    "image": "",
    "streaks": {
      {
        "Rank top 10 on the leaderboard": {
          "subtitle": "",
          "status": false,
          "progress": 0,
          "limit": 1,
        },
      },
      {
        "Rank top 5 on the leaderboard": {
          "subtitle": "",
          "status": false,
          "progress": 0,
          "limit": 1,
        },
      },
      {
        "Rank top 3 on the leaderboard": {
          "subtitle": "",
          "status": false,
          "progress": 0,
          "limit": 1,
        },
      },
      {
        "Rank first on the leaderboard": {
          "subtitle": "",
          "status": false,
          "progress": 0,
          "limit": 1,
        },
      },
    },
  },
  "Ultimate Achievement": {
    "image": "",
    "streaks": {
      {
        "Finish all streaks": {
          "subtitle": "",
          "status": false,
          "progress": 0,
          "limit": 19,
        },
      },
    }
  }
};

class StreaksProvider extends ChangeNotifier {}
