import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/main.dart';
import 'package:trivia/models/dialogs/average_time.dart';
import 'package:trivia/models/game_background.dart';
import 'package:trivia/providers/question.dart';
import 'package:trivia/providers/streaks.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class StreaksScreeen extends StatefulWidget {
  const StreaksScreeen({super.key});

  @override
  State<StreaksScreeen> createState() => _StreaksScreeenState();
}

/* 
Streaks

Level Streaks
1. Complete 5 levels without failing: "Steady Progress"
2. Complete 10 levels without failing: "Leveling Up"
3. Complete 20 levels without failing: "Tenacious Triumph"
4. Complete 50 levels without failing: "Masterful Streak"
5. Complete 100 levels without failing: "Unstoppable Champion"

Coin Streaks
6. Earn 50 coins: "Coin Collector"
7. Earn 100 coins: "Coin Hoarder"
8. Earn 200 coins: "Gold Gatherer"
9. Earn 500 coins: "Treasure Hunter"
10. Earn 1000 coins: "Coin Millionaire"

Trivia Streaks
11. Answer 5 questions correctly in a row: "Trivia Beginner"
12. Answer 10 questions correctly in a row: "Trivia Expert"
13. Answer 20 questions correctly in a row: "Brainiac"
14. Answer 50 questions correctly in a row: "Trivia Grandmaster"
15. Answer 100 questions correctly in a row: "Trivia Maestro"

Leaderboard Streaks
16. Rank top 10 on the leaderboard: "Achiever"
17. Rank top 5 on leaderboard: "High Achiever"
18. Rank top 3 on the leaderboard: "Top Ranker"
19. Rank first on the leaderboard: "Leaderboard Champion"

Ultimate Achievement
20. Collect all achievements: "Ultimate Achiever"

Average Time answering

 */

class _StreaksScreeenState extends State<StreaksScreeen> {
  @override
  Widget build(BuildContext context) {
    return GameBackground(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.h,
          )
        ],
      )
    );
  }
}
