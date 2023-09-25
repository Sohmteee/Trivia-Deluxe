import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/models/game_background.dart';
import 'package:trivia/models/level_tile.dart';
import 'package:trivia/models/stat_bar.dart';

class SelectSreen extends StatefulWidget {
  const SelectSreen({super.key});

  @override
  State<SelectSreen> createState() => _SelectSreenState();
}

class _SelectSreenState extends State<SelectSreen> {
  @override
  Widget build(BuildContext context) {
    return GameBackground(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
        child: Column(
          children: [
            const GameStats(),
            const Spacer(),ListView.builder(
              
              itemCount: 2,
              padding: EdgeInsets.only(top: 20.h),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return LevelTile(
                  level: index + 1,
                );
              },
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
