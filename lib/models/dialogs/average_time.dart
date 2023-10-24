import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/main.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'game.dart';

showAverageTimeDialog(BuildContext context) {
  showGameDialog(
    context,
    isExitable: true,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
    margin: EdgeInsets.symmetric(horizontal: 60.w, vertical: 24.h),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Average Time",
          style: TextStyle(
            color: AppColor.yellow,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        Text(
          "Your average time is calculated by the total time you took to answer all the questions divided by the number of questions you answered."
          "\nIf you fail a question tho, ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30.h),
        ZoomTapAnimation(
          onTap: () {
            playTap(context);
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.sp,
              horizontal: 20.sp,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              "Okay",
              style: TextStyle(
                fontSize: 20.sp,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
