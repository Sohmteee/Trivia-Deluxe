import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/main.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'game.dart';

showHelpDialog(BuildContext context) {
  showGameDialog(
    context,
    isExitable: true,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
    margin: EdgeInsets.symmetric(horizontal: 60.w, vertical: 24.h),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Auto Answer",
          style: TextStyle(
            color: AppColor.yellow,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        Text(
          "Auto Answer is a feature that automatically takes you to the next question without you having to select it manually."
          "\nIt's a good option for a faster paced game.",
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
