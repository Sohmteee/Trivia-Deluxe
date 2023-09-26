import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'game.dart';

showCloseAdDialog(BuildContext context) {
  showGameDialog(
    context,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Are you sure you want to close this ad?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            "You'd lose the reward if you do so",
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 20.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20.h),
        ZoomTapAnimation(
          onTap: () {
            return false;
          },
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              "I'll stay",
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        ZoomTapAnimation(
          onTap: () {
            return true;
          },
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              "Take me out",
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
