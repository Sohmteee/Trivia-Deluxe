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
};

class StreaksProvider extends ChangeNotifier {}
