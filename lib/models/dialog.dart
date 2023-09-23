import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/data/questions.dart';

showFailedDialog(context, questionIndex) {
  showDialog(
      context: context,
      builder: (context) {
        var dialog = questionsData[questionIndex]["dialog"];

        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.transparent,
          ),
          child: StatefulBuilder(builder: (context, setState) {
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
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Image.asset(dialog["image"]),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      dialog["title"],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      });
}
