import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/models/dialogs/game.dart';

showCreditsDialog(BuildContext context) {
  showGameDialog(
    context,
    isExitable: true,
    // padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "CREDITS",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        Text(
          "PROGRAMMING",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "Somtochukwu Ukaegbe",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        Text(
          "MUSIC/VFX",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "Somtochukwu Ukaegbe",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "Pixabay",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        Text(
          "ANIMATIONS",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "Somtochukwu Ukaegbe",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        Text(
          "GRAPHICS/UI Design",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "Harrison",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        Text(
          "DIRECTORS",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "Dracusta",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "Victor Anya",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "Somtochukwu Obi",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
