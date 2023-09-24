import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/models/pop_scope.dart';
import 'package:trivia/providers/money.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

showAdDialog(context) {
  showDialog(
      context: context,
      builder: (context) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.transparent,
          ),
          child: Consumer<MoneyProvider>(builder: (context, moneyProvider, _) {
            return WillPopScope(
              onWillPop: () => onWillPop(context),
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
                        "Oya another option dey",
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
                          "Would you like to watch an ad instead?",
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
                          Navigator.pushReplacementNamed(context, "/level");
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
                                "Okay I fit do that one",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              SizedBox(
                                height: 20.h,
                                child: Image.asset("assets/images/youtube.png"),
                              ),
                            ],
                          ),
                        ),
                      )
                      
                      ,
                      SizedBox(height: 10.h),
                      ZoomTapAnimation(
                        onTap: () {},
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
                                "Omo I dey manage my data too",
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
