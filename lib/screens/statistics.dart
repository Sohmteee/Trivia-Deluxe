// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/main.dart';
import 'package:trivia/models/game_background.dart';
import 'package:trivia/providers/question.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return GameBackground(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          children: [
            Center(
              child: Text(
                "Statistics",
                style: TextStyle(
                  color: AppColor.yellow,
                  fontSize: 50.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // SizedBox(height: 50.h),
            SizedBox(height: 20.h),
            Consumer<QuestionProvider>(
              builder: (context, questionProvider, _) {
                return Column(
                  children: [
                    if (questionProvider.totalQuestionsAnswered != 0)
                      Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 100.w,
                                height: 100.h,
                                child: Chart(
                                  duration: const Duration(seconds: 2),
                                  layers: [
                                    ChartGroupPieLayer(
                                      items: [
                                        [
                                          if (questionProvider.correctAnswers !=
                                              0)
                                            ChartGroupPieDataItem(
                                              amount: questionProvider
                                                  .correctAnswers
                                                  .toDouble(),
                                              color: AppColor.right,
                                              label: "Correct Answers",
                                            ),
                                          if ((questionProvider
                                                      .totalQuestionsAnswered -
                                                  questionProvider
                                                      .correctAnswers) !=
                                              0)
                                            ChartGroupPieDataItem(
                                              amount: (questionProvider
                                                          .totalQuestionsAnswered -
                                                      questionProvider
                                                          .correctAnswers)
                                                  .toDouble(),
                                              color: Colors.red,
                                              label: "Wrong answers",
                                            ),
                                        ]
                                      ],
                                      settings: ChartGroupPieSettings(
                                        radius: 30.r,
                                        thickness: 5,
                                        gapBetweenChartCircles: 2,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                "${questionProvider.totalQuestionsAnswered}",
                                style: TextStyle(
                                  color: AppColor.yellow,
                                  fontSize: 28.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 10.w,
                                    height: 10.w,
                                    decoration: BoxDecoration(
                                      color: AppColor.right,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Row(
                                    children: [
                                      Text(
                                        "${questionProvider.correctAnswers} correct answers ",
                                        style: TextStyle(
                                          color: Colors.grey[300],
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      Text(
                                        "(${(questionProvider.correctAnswers / questionProvider.totalQuestionsAnswered * 100).toStringAsFixed(1)}%)",
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 10.w,
                                    height: 10.w,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Row(
                                    children: [
                                      Text(
                                        "${questionProvider.totalQuestionsAnswered - questionProvider.correctAnswers} incorrect answers ",
                                        style: TextStyle(
                                          color: Colors.grey[300],
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      Text(
                                        "(${((questionProvider.totalQuestionsAnswered - questionProvider.correctAnswers) / questionProvider.totalQuestionsAnswered * 100).toStringAsFixed(1)}%)",
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 10.w,
                                    height: 10.w,
                                    decoration: BoxDecoration(
                                      color: AppColor.yellow,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    "${questionProvider.totalQuestionsAnswered} questions answered",
                                    style: TextStyle(
                                      color: Colors.grey[300],
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Average Time",
                              style: TextStyle(
                                color: Colors.grey[300],
                                fontSize: 20.sp,
                              ),
                            ),
                            SizedBox(width: 15.w),
                            Text(
                              questionProvider.averageTime.toStringAsFixed(2),
                              style: TextStyle(
                                color: Colors.orange[300],
                                fontSize: 25.sp,
                              ),
                            ),
                            Text(
                              "s",
                              style: TextStyle(
                                color: Colors.orange[300],
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(flex: 3),
                    ZoomTapAnimation(
                      onTap: () {
                        playTap(context);
                        // showHelpDialog(context);
                      },
                      child: Icon(
                        Icons.help_outline,
                        color: Colors.grey[200],
                        size: 20.sp,
                      ),
                    ),
                    const Spacer(flex: 7),
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
