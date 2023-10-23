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
        "": {
          "subtitle": "Earn 50 coins",
          "status": false,
          "progress": 0,
          "limit": 50,
        }
      },
      {
        "": {
          "subtitle": "Earn 100 coins",
          "status": false,
          "progress": 0,
          "limit": 100,
        }
      },
      {
        "": {
          "subtitle": "",
          "status": false,
          "progress": 0,
          "limit": 200,
        }
      },
      {
        "Earn 500 coins": {
          "subtitle": "",
          "status": false,
          "progress": 0,
          "limit": 500,
        }
      },
      {
        "Earn 1000 coins": {
          "subtitle": "",
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
        "Answer 5 questions correctly in a row": {
          "subtitle": "",
          "status": false,
          "progress": 0,
          "limit": 5,
        }
      },
      {
        "Answer 10 questions correctly in a row": {
          "subtitle": "",
          "status": false,
          "progress": 0,
          "limit": 10,
        }
      },
      {
        "Answer 20 questions correctly in a row": {
          "subtitle": "",
          "status": false,
          "progress": 0,
          "limit": 20,
        }
      },
      {
        "Answer 50 questions correctly in a row": {
          "subtitle": "",
          "status": false,
          "progress": 0,
          "limit": 50,
        }
      },
      {
        "Answer 100 questions correctly in a row": {
          "subtitle": "",
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
