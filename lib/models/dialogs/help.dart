import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/main.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'game.dart';

showHelpDialog(BuildContext context) {
  showGameDialog(
    context,
    isExitable: true,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
        SizedBox(height: 50.h),
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
