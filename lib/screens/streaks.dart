import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/models/game_background.dart';

class StreaksScreeen extends StatefulWidget {
  const StreaksScreeen({super.key});

  @override
  State<StreaksScreeen> createState() => _StreaksScreeenState();
}

class _StreaksScreeenState extends State<StreaksScreeen> {
  @override
  Widget build(BuildContext context) {
    return GameBackground(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
        child: Column(
          children: [
            Center(
              child: Text(
                "Leaderboard",
                style: TextStyle(
                  color: AppColor.yellow,
                  fontSize: 50.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "This feature is coming soon",
              style: TextStyle(
                color: AppColor.white,
                fontSize: 20.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
