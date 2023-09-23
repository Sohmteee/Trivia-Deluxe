import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/data/questions.dart';
import 'package:trivia/providers/money.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

showFailedDialog(context, questionIndex) {
  showDialog(
      context: context,
      builder: (context) {
        var dialog = questionsData[questionIndex]["dialog"];

        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.transparent,
          ),
          child: Consumer<MoneyProvider>(builder: (context, moneyProvider, _) {
            return Dialog(
              elevation: 0,
              shadowColor: Colors.transparent,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              insetAnimationCurve: Curves.bounceInOut,
              insetAnimationDuration: const Duration(milliseconds: 300),
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                decoration: BoxDecoration(
                  color: AppColor.lightRed,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(30.sp),
                      decoration: BoxDecoration(
                        color: Colors.grey[300]!,
                        // borderRadius: BorderRadius.circular(20.r),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(dialog["image"]),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      dialog["title"],
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
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          dialog["content"],
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    ZoomTapAnimation(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.sp, vertical: 10.sp),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Revive",
                              style: TextStyle(
                                fontSize: 25.sp,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                SizedBox(
                                  height: 20.h,
                                  child: Image.asset("assets/images/coin.png"),
                                ),
                                Positioned(
                                  top: -5,
                                  right: -6,
                                  child: Text(
                                    "\u00d75",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                        .animate(
                          onPlay: (controller) => controller.repeat(),
                        )
                        .shimmer(
                          delay: 2.seconds,
                          duration: .7.seconds,
                        )
                        .scaleXY(
                          curve: Curves.easeOutSine,
                          delay: 2.seconds,
                          duration: .1.seconds,
                          begin: 1,
                          end: .8,
                        )
                        .then()
                        .scaleXY(
                          curve: Curves.easeOutSine,
                          duration: .4.seconds,
                          begin: .8,
                          end: 1.2,
                        )
                        .then()
                        .scaleXY(
                          curve: Curves.bounceOut,
                          duration: .2.seconds,
                          begin: 1.2,
                          end: 1,
                        ),
                  ],
                ),
              ),
            );
          }),
        );
      });
}
