import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            color: Colors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        Text(
          "Auto Answer is a feature that automatically takes you to the next question without you having to select.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
