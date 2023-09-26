import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'game.dart';

showExitDialog(BuildContext context) {
  showGameDialog(
    context,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Are you sure you want to exit?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        ZoomTapAnimation(
          onTap: () {
            SystemNavigator.pop();
          },
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Yeah",
                  style: TextStyle(
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(width: 10.w),
                SizedBox(
                  height: 20.h,
                  child: Image.asset("assets/images/youtube.png"),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),
        ZoomTapAnimation(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Nah",
                  style: TextStyle(
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(width: 10.w),
                SizedBox(
                  height: 20.h,
                  child: Image.asset("assets/images/laugh.png"),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
