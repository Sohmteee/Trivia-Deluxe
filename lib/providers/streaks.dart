import 'package:flutter/material.dart';

Map streaks = {
  "Level Streaks": [
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
  "Coin Streaks": [
    {
      "Earn 50 coins": {
        "status": false,
        "progress": 0,
        "limit": 50,
      }
    },
    {
      "Earn 50 coins": {
        "status": false,
        "progress": 0,
        "limit": 50,
      }
    },
    {
      "Earn 50 coins": {
        "status": false,
        "progress": 0,
        "limit": 50,
      }
    },
    {
      "Earn 50 coins": {
        "status": false,
        "progress": 0,
        "limit": 50,
      }
    },
    {
      "Earn 50 coins": {
        "status": false,
        "progress": 0,
        "limit": 50,
      }
    },
  ]
};

class StreaksProvider extends ChangeNotifier {}
