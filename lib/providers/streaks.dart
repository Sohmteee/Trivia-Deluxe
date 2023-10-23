import 'package:flutter/material.dart';

List<Map<String, dynamic>> streaks = [
  {
    "title": "Level Streaks",
    "image": "assets/images/level.png",
    "streaks": [
      {
        : {
          "title": "Steady Progress","subtitle": "Complete 5 levels without failing",
          "status": false,
          "progress": 0,
          "limit": 5,
        }
      },
      {
        : {
          "title": "Leveling Up","subtitle": "Complete 10 levels without failing",
          "status": false,
          "progress": 0,
          "limit": 10,
        }
      },
      {
        : {
          "title": "Tenacious Triumph","subtitle": "Complete 20 levels without failing",
          "status": false,
          "progress": 0,
          "limit": 20,
        }
      },
      {
        : {
          "title": "Masterful Streak","subtitle": "Complete 50 levels without failing",
          "status": false,
          "progress": 0,
          "limit": 50,
        }
      },
      {
        : {
          "title": "Unstoppable Champion","subtitle": "Complete 100 levels without failing",
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
          "title": "Coin Collector","subtitle": "Earn 50 coins",
          "status": false,
          "progress": 0,
          "limit": 50,
        
      },
      {
          "title": "Coin Hoarder","subtitle": "Earn 100 coins",
          "status": false,
          "progress": 0,
          "limit": 100,
        
      },
      {
          "title": "Gold Gatherer","subtitle": "Earn 200 coins",
          "status": false,
          "progress": 0,
          "limit": 200,
        
      },
      {
          "title": "Treasure Hunter","subtitle": "Earn 500 coins",
          "status": false,
          "progress": 0,
          "limit": 500,
        
      },
      {
          "title": "Coin Millionaire","subtitle": "Earn 1000 coins",
          "status": false,
          "progress": 0,
          "limit": 1000,
        
      },
    ],
  },
  {
    "title": "Trivia Streaks",
    "image": "assets/images/answer.png",
    "streaks": {
      {
          "title": "Trivia Beginner","subtitle": "Answer 5 questions correctly in a row",
          "status": false,
          "progress": 0,
          "limit": 5,
        
      },
      {
          "title": "Trivia Expert","subtitle": "Answer 10 questions correctly in a row",
          "status": false,
          "progress": 0,
          "limit": 10,
        
      },
      {
          "title":         "Brainiac","subtitle": "Answer 20 questions correctly in a row",
          "status": false,
          "progress": 0,
          "limit": 20,
        
      },
      {
          "title": "Trivia Grandmaster","subtitle": "Answer 50 questions correctly in a row",
          "status": false,
          "progress": 0,
          "limit": 50,
        
      },
      {
        
          "title": "Trivia Maestro","subtitle": "Answer 100 questions correctly in a row",
          "status": false,
          "progress": 0,
          "limit": 100,
        
      },
    },
  },
  {
    "title": "Leaderboard Streaks",
    "image": "assets/images/rank.png",
    "streaks": {
      {

          "title":         "Achiever","subtitle": "Rank top 10 on the leaderboard",
          "status": false,
          "progress": 0,
          "limit": 1,
        
      },
      {
        
          "title": "Top Ranker","subtitle": "Rank top 5 on the leaderboard",
          "status": false,
          "progress": 0,
          "limit": 1,
        
      },
      {
        
          "title": "Master Ranker","subtitle": "Rank top 3 on the leaderboard",
          "status": false,
          "progress": 0,
          "limit": 1,
        
      },
      {
        
          "title": "Leaderboard Champion","subtitle": "Rank first on the leaderboard",
          "status": false,
          "progress": 0,
          "limit": 1,
        
      },
    },
  },
  {
    "title": "Ultimate Achievement",
    "image": "assets/images/goal.png",
    "streaks": {
      {
        
          "title": "Ultimate Achiever","subtitle": "Finish all streaks",
          "status": false,
          "progress": 0,
          "limit": 19,
        
      },
    }
  },
];

class StreaksProvider extends ChangeNotifier {}
