import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:trivia/main.dart';
import 'package:trivia/models/dialogs/low_cash.dart';
import 'package:trivia/providers/money.dart';
import 'package:trivia/providers/question.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'game.dart';

showFailedDialog(BuildContext context, questionIndex, bool timeUp) {
  final questionProvider =
      Provider.of<QuestionProvider>(context, listen: false);

  var dialog = questionProvider.questions[questionIndex]["dialog"];
  bool showAnim = false;

  if (timeUp) playWrong(context);

  showGameDialog(
    context,
    child: StatefulBuilder(
      builder: (context, setState) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(35.sp),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: (timeUp == false)
                      ? Lottie.asset("assets/json/fail.json")
                      : Lottie.asset(
                          "assets/json/time-up.json",
                          repeat: false,
                        ),
                ),
                SizedBox(height: 20.h),
                Text(
                  (timeUp == false) ? dialog["title"] : "Time's up!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (timeUp == false)
                  Column(
                    children: [
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
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 20.h),
                Consumer<MoneyProvider>(builder: (context, moneyProvider, _) {
                  return ZoomTapAnimation(
                    onTap: () {
                      if (moneyProvider.coins - 20 >= 0) {
                        playCoinDown(context);
                        setState(() {
                          showAnim = true;
                        });
                        Future.delayed(
                          2.seconds,
                          () => setState(() {
                            showAnim = false;
                          }),
                        );
                        moneyProvider.decreaseCoins(20);
                        Future.delayed(
                          2.seconds,
                          () =>
                              Navigator.pushReplacementNamed(context, "/level"),
                        );
                      } else {
                        playTap(context);
                        Navigator.pop(context);
                        showLowCashDialog(context);
                      }
                    },
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
                                right: -10,
                                child: Text(
                                  "\u00d720",
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
                      );
                }),
              ],
            ),
            if (showAnim) Lottie.asset("assets/json/coin-spent.json"),
          ],
        );
      },
    ),
  );
}
