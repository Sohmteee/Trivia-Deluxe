import 'package:flutter/material.dart';

Map streaks = {
  "Level Streaks": {
    "image": "",
    "streaks": [
      {
        "Complete 5 levels without failing": {
          "status": false,
          "progress": 0,
          "limit": 5,
        }
      },
      {
        "Complete 10 levels without failing": {
          "status": false,
          "progress": 0,
          "limit": 10,
        }
      },
      {
        "Complete 20 levels without failing": {
          "status": false,
          "progress": 0,
          "limit": 20,
        }
      },
      {
        "Complete 50 levels without failing": {
          "status": false,
          "progress": 0,
          "limit": 50,
        }
      },
      {
        "Complete 100 levels without failing": {
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
        "Earn 50 coins": {
          "status": false,
          "progress": 0,
          "limit": 50,
        }
      },
      {
        "Earn 100 coins": {
          "status": false,
          "progress": 0,
          "limit": 100,
        }
      },
      {
        "Earn 200 coins": {
          "status": false,
          "progress": 0,
          "limit": 200,
        }
      },
      {
        "Earn 500 coins": {
          "status": false,
          "progress": 0,
          "limit": 500,
        }
      },
      {
        "Earn 1000 coins": {
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
          "status": false,
          "progress": 0,
          "limit": 5,
        }
      },
      {
        "Answer 10 questions correctly in a row": {
          "status": false,
          "progress": 0,
          "limit": 10,
        }
      },
      {
        "Answer 20 questions correctly in a row": {
          "status": false,
          "progress": 0,
          "limit": 20,
        }
      },
      {
        "Answer 50 questions correctly in a row": {
          "status": false,
          "progress": 0,
          "limit": 50,
        }
      },
      {
        "Answer 100 questions correctly in a row": {
          "status": false,
          "progress": 0,
          "limit": 100,
        }
      },
    },
  },
  "Leaderboard Streaks": {
    "image":"",
    "streaks": 
      {
      "Rank top 10 on the leaderboard": {
        "status": false,
        "progress": 0,
        "limit": 1,
      }
    },
  }
};

class StreaksProvider extends ChangeNotifier {}
