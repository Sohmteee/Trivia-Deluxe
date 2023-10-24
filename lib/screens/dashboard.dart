import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/models/game_background.dart';
import 'package:trivia/providers/question.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return GameBackground(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
        child: Column(
          children: [
            Center(
              child: Text(
                "Dashboard",
                style: TextStyle(
                  color: AppColor.yellow,
                  fontSize: 50.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 50.h),
            Consumer<QuestionProvider>(
              builder: (context, questionProvider, _) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Correct Answers:",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 25.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          questionProvider.correctAnswers.toString(),
                          style: TextStyle(
                            color: AppColor.right,
                            fontSize: 25.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "incorrect Answers:",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 25.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          questionProvider.correctAnswers.toString(),
                          style: TextStyle(
                            color: AppColor.right,
                            fontSize: 25.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Correct Answers:",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 25.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          questionProvider.correctAnswers.toString(),
                          style: TextStyle(
                            color: AppColor.right,
                            fontSize: 25.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
