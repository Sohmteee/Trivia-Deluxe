import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/main.dart';
import 'package:trivia/models/game_background.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

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
                    EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  "Yes, I'll create one now",
                  style: TextStyle(
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
            ZoomTapAnimation(
              onTap: () {
                playTap(context);
                return true;
              },
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  "No, ",
                  style: TextStyle(
                    fontSize: 15.sp,
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
