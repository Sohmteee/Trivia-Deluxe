import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'game.dart';

showHelpDialog(BuildContext context) {
  showGameDialog(
    context,
    isExitable: true,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
    margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 24.w),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Auto Answer",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        Text(
          "Auto Answer is a feature that automatically answers the question for you. It is available for 1 question only and can be used only once per game.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
