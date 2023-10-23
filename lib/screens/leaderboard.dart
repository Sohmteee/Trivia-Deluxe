import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/main.dart';
import 'package:trivia/models/game_background.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

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
              "Would you like to create a profile before then?",
              style: TextStyle(
                color: AppColor.white,
                fontSize: 25.sp,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "\nYour data will be synced once the feture is rolled out",
              style: TextStyle(
                color: AppColor.white,
                fontSize: 25.sp,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ZoomTapAnimation(
              onTap: () {
                playTap(context);
                return true;
              },
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 25.sp, vertical: 15.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Text(
                  "Yes, I'll create one now",
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            ZoomTapAnimation(
              onTap: () {
                playTap(context);
                Navigator.pop(context);
                return true;
              },
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 25.sp, vertical: 15.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Text(
                  "No, I'll do it later",
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
