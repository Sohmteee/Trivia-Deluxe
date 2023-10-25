import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/main.dart';
import 'package:trivia/models/dialogs/average_time.dart';
import 'package:trivia/models/game_background.dart';
import 'package:trivia/providers/question.dart';
import 'package:trivia/providers/streaks.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class StreaksScreeen extends StatefulWidget {
  const StreaksScreeen({super.key});

  @override
  State<StreaksScreeen> createState() => _StreaksScreeenState();
}

/* 
Streaks

Level Streaks
1. Complete 5 levels without failing: "Steady Progress"
2. Complete 10 levels without failing: "Leveling Up"
3. Complete 20 levels without failing: "Tenacious Triumph"
4. Complete 50 levels without failing: "Masterful Streak"
5. Complete 100 levels without failing: "Unstoppable Champion"

Coin Streaks
6. Earn 50 coins: "Coin Collector"
7. Earn 100 coins: "Coin Hoarder"
8. Earn 200 coins: "Gold Gatherer"
9. Earn 500 coins: "Treasure Hunter"
10. Earn 1000 coins: "Coin Millionaire"

Trivia Streaks
11. Answer 5 questions correctly in a row: "Trivia Beginner"
12. Answer 10 questions correctly in a row: "Trivia Expert"
13. Answer 20 questions correctly in a row: "Brainiac"
14. Answer 50 questions correctly in a row: "Trivia Grandmaster"
15. Answer 100 questions correctly in a row: "Trivia Maestro"

Leaderboard Streaks
16. Rank top 10 on the leaderboard: "Achiever"
17. Rank top 5 on leaderboard: "High Achiever"
18. Rank top 3 on the leaderboard: "Top Ranker"
19. Rank first on the leaderboard: "Leaderboard Champion"

Ultimate Achievement
20. Collect all achievements: "Ultimate Achiever"

Average Time answering

 */

class _StreaksScreeenState extends State<StreaksScreeen> {
  @override
  Widget build(BuildContext context) {
    return GameBackground(
      body: Consumer<StreaksProvider>(builder: (context, streaksProvider, _) {
        return Padding(
          padding: EdgeInsets.fromLTRB(20.w, 40.h, 20.w, 0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Streaks",
                  style: TextStyle(
                    color: AppColor.yellow,
                    fontSize: 50.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Consumer<QuestionProvider>(
                builder: (context, questionProvider, _) {
                  return (questionProvider.totalQuestionsAnswered != 0)
                      ? Column(
                          children: [
                            SizedBox(height: 10.h),
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
                                                if (questionProvider
                                                        .correctAnswers !=
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
                                          "Total questions answered",
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
                            Consumer<QuestionProvider>(
                                builder: (context, questionProvider, _) {
                              return Row(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Average Answering Time",
                                        style: TextStyle(
                                          color: Colors.grey[300],
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                      SizedBox(width: 15.w),
                                      Text(
                                        questionProvider.averageTime
                                            .toStringAsFixed(2),
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
                                  const Spacer(flex: 1),
                                  ZoomTapAnimation(
                                    onTap: () {
                                      playTap(context);
                                      showAverageTimeDialog(context);
                                    },
                                    child: Icon(
                                      Icons.help_outline,
                                      color: Colors.grey[200],
                                      size: 20.sp,
                                    ),
                                  ),
                                  const Spacer(flex: 9),
                                ],
                              );
                            }),
                          ],
                        )
                      : const SizedBox();
                },
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.separated(
                  itemCount: streaksProvider.streaks.length,
                  padding: EdgeInsets.only(top: 10.h),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    String streakTitle =
                        streaksProvider.streaks[index]["title"];
                    String image = streaksProvider.streaks[index]["image"];
                    List streakList = streaksProvider.streaks[index]["streaks"];

                    return Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              width: 35.w,
                              image,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              streakTitle,
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 30.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Column(
                          children: streakList.map(
                            (item) {
                              final streaksProvider =
                                  Provider.of<StreaksProvider>(context,
                                      listen: false);
                              final streakData = streaksProvider.streaks;
                              bool tapped = item["tapped"];

                              return Column(
                                children: [
                                  ListTile(
                                    minLeadingWidth: 20.w,
                                    leading: item["status"]
                                        ? Image.asset(
                                            "assets/images/cleared.png",
                                            width: 25.w)
                                        : SizedBox(width: 25.w),
                                    title: Text(
                                      item["title"],
                                      style: TextStyle(
                                        color: AppColor.white,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                    subtitle: Text(
                                      item["subtitle"],
                                      style: TextStyle(
                                        color: Vx.gray300,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    trailing: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${item["progress"]} / ${item["limit"]}",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: AppColor.yellow,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Container(
                                              height: 6.h,
                                              width: 30.toDouble(),
                                              decoration: BoxDecoration(
                                                color: AppColor.white,
                                                borderRadius:
                                                    BorderRadius.circular(50.r),
                                              ),
                                            ),
                                            Container(
                                              height: 6.h,
                                              width: (item["progress"] /
                                                      item["limit"]) *
                                                  30.toDouble(),
                                              decoration: BoxDecoration(
                                                color: AppColor.yellow,
                                                borderRadius:
                                                    BorderRadius.circular(50.r),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (!item["status"] && !item["collected"])
                                    Row(
                                      children: [
                                        const Spacer(flex: 10),
                                        tapped
                                            ? Text(
                                                "Collect Reward",
                                                style: TextStyle(
                                                  color: AppColor.white,
                                                  fontSize: 18.sp,
                                                ),
                                              ).animate(
                                                onComplete: (controller) {
                                                streakData[index]["streaks"][
                                                        streakData[index]
                                                                ["streaks"]
                                                            .indexOf(item)]
                                                    ["collected"] = true;
                                                streaksProvider.streaks =
                                                    streakData;
                                                streaksProvider
                                                    .updateStreaksData();
                                              }).moveX(
                                                delay: 1.seconds,
                                                duration: .5.seconds,
                                                curve: Curves.easeOut,
                                                begin: 0,
                                                end: 200.w,
                                              )
                                            : Text(
                                                "Collect Reward",
                                                style: TextStyle(
                                                  color: AppColor.white,
                                                  fontSize: 18.sp,
                                                ),
                                              ),
                                        const Spacer(),
                                        ZoomTapAnimation(
                                          onTap: () {
                                            setState(() {
                                              tapped = true;
                                            });

                                            streakData[index]["streaks"][
                                                    streakData[index]["streaks"]
                                                        .indexOf(item)]
                                                ["tapped"] = true;
                                            streaksProvider.streaks =
                                                streakData;
                                            streaksProvider.updateStreaksData();

                                            /* streakData[index]["streaks"][
                                                          streakData[index]
                                                                  ["streaks"]
                                                              .indexOf(item)]
                                                      ["collected"] = true;
                                                  streaksProvider.streaks =
                                                      streakData;
                                                  streaksProvider
                                                      .updateStreaksData(); */
                                          },
                                          child: AnimatedContainer(
                                            duration: .3.seconds,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.h,
                                                horizontal: 10.w),
                                            decoration: BoxDecoration(
                                              color: tapped
                                                  ? Colors.transparent
                                                  : AppColor.right,
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            child: tapped
                                                ? Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Image.asset(
                                                        "assets/images/coin.png",
                                                        width: 20.w,
                                                      ),
                                                      SizedBox(width: 5.w),
                                                      Text(
                                                        item["reward"]
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: AppColor.white,
                                                          fontSize: 18.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                    .animate()
                                                    .moveY(
                                                      delay: .3.seconds,
                                                      duration: .5.seconds,
                                                      curve: Curves.easeOut,
                                                      begin: 0,
                                                      end: -50.h,
                                                    )
                                                    .fadeOut(
                                                      delay: .3.seconds,
                                                      duration: .5.seconds,
                                                    )
                                                : Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Image.asset(
                                                        "assets/images/coin.png",
                                                        width: 20.w,
                                                      ),
                                                      SizedBox(width: 5.w),
                                                      Text(
                                                        item["reward"]
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: AppColor.white,
                                                          fontSize: 18.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                ],
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 20.h);
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
