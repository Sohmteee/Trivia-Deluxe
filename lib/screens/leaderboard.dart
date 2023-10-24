import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/models/game_background.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({super.key});

  @override
  State<LeaderBoardScreen> createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
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
            const Spacer(),
            Text(
              "This feature is coming soon",
              style: TextStyle(
                color: AppColor.white,
                fontSize: 25.sp,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Your data will be synced once the feature rolls out",
              style: TextStyle(
                color: AppColor.white,
                fontSize: 25.sp,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
