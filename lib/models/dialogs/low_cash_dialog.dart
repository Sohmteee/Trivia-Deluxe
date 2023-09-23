import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/models/dialogs/ad_dialog.dart';
import 'package:trivia/models/pop_scope.dart';
import 'package:trivia/providers/money.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

showLowCashDialog(context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.transparent,
          ),
          child: Consumer<MoneyProvider>(builder: (context, moneyProvider, _) {
            return WillPopScope(
              onWillPop: onWillPop,
              child: Dialog(
                elevation: 0,
                shadowColor: Colors.transparent,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                insetAnimationCurve: Curves.bounceInOut,
                insetAnimationDuration: const Duration(milliseconds: 300),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 60),
                  decoration: BoxDecoration(
                    color: AppColor.lightRed,
                    borderRadius: BorderRadius.circular(20),
                  ),
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
                          "Would you like to top up?",
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 20.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      ZoomTapAnimation(
                        onTap: () {
                          moneyProvider.increaseCoins(5);
                          Navigator.pushReplacementNamed(context, "/game");
                        },
                        child: Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.sp, vertical: 10.sp),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Carry me go store abeg",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              SizedBox(
                                height: 20.h,
                                child:
                                    Image.asset("assets/images/debit-card.png"),
                              ),
                            ],
                          ),
                        ),
                      )
                      /* .animate(
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
                          ) */
                      ,
                      SizedBox(height: 10.h),
                      ZoomTapAnimation(
                        onTap: () {
                          Navigator.pop(context);
                          showAdDialog(context);
                        },
                        child: Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.sp, vertical: 10.sp),
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
                      )
                      /* .animate(
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
                          ) */
                      ,
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      });
}
