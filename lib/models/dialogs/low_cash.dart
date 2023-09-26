import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trivia/models/dialogs/ad.dart';
import 'package:trivia/providers/money.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'game.dart';

showLowCashDialog(BuildContext context) {
  showGameDialog(
    context,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Sapa don catch you even for game 😂",
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
            "Would you like to top up by watching an ad?",
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 20.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20.h),
        Consumer<MoneyProvider>(builder: (context, moneyProvider, _) {
          return ZoomTapAnimation(
            onTap: () {
              moneyProvider.increaseCoins(5);
              Navigator.pushReplacementNamed(context, "/game");
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
                    "Okay, I'll wactch an ad for 10 coins",
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    height: 20.h,
                    child: Image.asset("assets/images/debit-card.png"),
                  ),
                ],
              ),
            ),
          );
        }),
        SizedBox(height: 10.h),
        ZoomTapAnimation(
          onTap: () {
            Navigator.pop(context);
            showAdDialog(context);
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
                  "Omo I'm broke in real life too",
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
