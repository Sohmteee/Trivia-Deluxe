import 'package:flutter/material.dart';

Map streaks = {
  "Level Streaks": [
    {
      "Complete 5 levels without failing" : {
        "status": false,
        "progress": 0,
        "limit": 5,
      },
    }
  ]

  ,
};

class StreaksProvider extends ChangeNotifier {}
