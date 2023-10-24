import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/models/game_background.dart';
import 'package:trivia/providers/question.dart';
import 'package:mrx_charts/mrx_charts.dart';


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
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(
                          "Incorrect Answers:",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 25.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          (questionProvider.totalQuestionsAnswered -
                                  questionProvider.correctAnswers)
                              .toString(),
                          style: TextStyle(
                            color: AppColor.wrong,
                            fontSize: 25.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(
                          "Total Questions Answered:",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 25.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          questionProvider.totalQuestionsAnswered.toString(),
                          style: TextStyle(
                            color: AppColor.yellow,
                            fontSize: 25.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 200.w,
                          height: 200.h,
                          child: Chart(
                            duration: const Duration(seconds: 2),
                            layers: [
                              ChartGroupPieLayer(
                                items: [
                                  [
                                    if (questionProvider.correctAnswers != 0)
                                      ChartGroupPieDataItem(
                                        amount: questionProvider.correctAnswers.toDouble(),
                                        color: Colors.green,
                                        label: "Good Days",
                                      ),
                                    if (badDays != 0)
                                      ChartGroupPieDataItem(
                                        amount: badDays,
                                        color: Colors.red,
                                        label: "Bad Days",
                                      ),
                                    if (neutralDays != 0)
                                      ChartGroupPieDataItem(
                                        amount: neutralDays,
                                        color: grey400,
                                        label: "Neutral Days",
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var entry in entries)
                              Row(
                                children: [
                                  Container(
                                    width: 10.w,
                                    height: 10.w,
                                    decoration: BoxDecoration(
                                      color: getColorForLabel(entry.key),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    "${entry.key} (${entry.value.toStringAsFixed(1)}%)",
                                    style: TextStyle(
                                      color: grey100,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        )
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
