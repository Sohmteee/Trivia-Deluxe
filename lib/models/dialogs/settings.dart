import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/models/dialogs/game_dialog.dart';

showSettingsDialog(BuildContext context) {
  showGameDialog(
    context,
    isExitable: true,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Game Settings",
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
            "Game Music",
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 20.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
