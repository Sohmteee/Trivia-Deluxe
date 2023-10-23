import 'package:flutter/material.dart';

List<Map<String, dynamic>> streaks = [
  {
    "title": "Level Streaks",
    "image": "assets/images/level.png",
    "streaks": [
      {
        : {
          "title": "","subtitle": "Complete 5 levels without failing",
          "status": false,
          "progress": 0,
          "limit": 5,
        }
      },
      {
        : {
          "title": "","subtitle": "Complete 10 levels without failing",
          "status": false,
          "progress": 0,
          "limit": 10,
        }
      },
      {
        : {
          "title": "","subtitle": "Complete 20 levels without failing",
          "status": false,
          "progress": 0,
          "limit": 20,
        }
      },
      {
        : {
          "title": "","subtitle": "Complete 50 levels without failing",
          "status": false,
          "progress": 0,
          "limit": 50,
        }
      },
      {
        : {
          "title": "","subtitle": "Complete 100 levels without failing",
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
        : {
          "title": "","subtitle": "Earn 50 coins",
          "status": false,
          "progress": 0,
          "limit": 50,
        }
      },
      {
        : {
          "title": "","subtitle": "Earn 100 coins",
          "status": false,
          "progress": 0,
          "limit": 100,
        }
      },
      {
        : {
          "title": "","subtitle": "Earn 200 coins",
          "status": false,
          "progress": 0,
          "limit": 200,
        }
      },
      {
        : {
          "title": "","subtitle": "Earn 500 coins",
          "status": false,
          "progress": 0,
          "limit": 500,
        }
      },
      {
        : {
          "title": "","subtitle": "Earn 1000 coins",
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
        : {
          "title": "","subtitle": "Answer 5 questions correctly in a row",
          "status": false,
          "progress": 0,
          "limit": 5,
        }
      },
      {
        : {
          "title": "","subtitle": "Answer 10 questions correctly in a row",
          "status": false,
          "progress": 0,
          "limit": 10,
        }
      },
      {
: {
          "title": "","subtitle": "Answer 20 questions correctly in a row",
          "status": false,
          "progress": 0,
          "limit": 20,
        }
      },
      {
        : {
          "title": "","subtitle": "Answer 50 questions correctly in a row",
          "status": false,
          "progress": 0,
          "limit": 50,
        }
      },
      {
        : {
          "title": "","subtitle": "Answer 100 questions correctly in a row",
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
: {
          "title": "","subtitle": "Rank top 10 on the leaderboard",
          "status": false,
          "progress": 0,
          "limit": 1,
        },
      },
      {
        : {
          "title": "","subtitle": "Rank top 5 on the leaderboard",
          "status": false,
          "progress": 0,
          "limit": 1,
        },
      },
      {
        : {
          "title": "","subtitle": "Rank top 3 on the leaderboard",
          "status": false,
          "progress": 0,
          "limit": 1,
        },
      },
      {
        : {
          "title": "","subtitle": "Rank first on the leaderboard",
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
        : {
          "title": "","subtitle": "Finish all streaks",
          "status": false,
          "progress": 0,
          "limit": 19,
        },
      },
    }
  },
];

class StreaksProvider extends ChangeNotifier {}
