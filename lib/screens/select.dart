import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/models/game_background.dart';
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
            const Spacer(),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
