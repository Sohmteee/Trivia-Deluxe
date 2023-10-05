import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/models/dialogs/game.dart';

showCreditsDialog(BuildContext context) {
  showGameDialog(
    context,
    isExitable: true,
    padding: EdgeInsets.fromLTRB(20.w, 40.h, 20.w, 30.h),
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
          "DEVELOPER",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 2.h),
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
          "PROJECT MANAGER",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 2.h),
        Text(
          "Chux Edoga \n(CEO of Digital Dreams LTD)",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        Text(
          "TEAM LEAD",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 2.h),
        Text(
          "Victor Anya",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        Text(
          "GRAPHICS / UI Design",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 2.h),
        Text(
          "Harrison Illodiuba",
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
        SizedBox(height: 2.h),
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
          "MUSIC / SOUND EFFECTS",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 2.h),
        Text(
          "Art of Silence - Uniq",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "Sound Effects from Pixabay",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 30.sp,
              height: 30.sp,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: Image.asset("assets/images/digital-dreams-logo.png"),
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              "DIGITAL DREAMS LTD",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    ),
  );
}
