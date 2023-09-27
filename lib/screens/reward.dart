import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/models/game_background.dart';
import 'package:trivia/models/stat_bar.dart';
import 'package:trivia/providers/money.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({super.key});

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  late bool receivedReward, changeChest;

  @override
  void initState() {
    receivedReward = changeChest = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(context, "/menu", (route) => false);
        return true;
      },
      child: GameBackground(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
          child: Column(
            children: [
              const GameStats(),
              const Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  Lottie.asset(
                    "assets/json/celebration.json",
                    width: 200,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    "Level\nPassed!",
                    style: TextStyle(
                      color: AppColor.right,
                      fontSize: 55.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Level\nPassed!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
                  .animate(
                    onPlay: (controller) => controller.repeat(),
                  )
                  .shimmer(
                    delay: 2.seconds,
                    duration: 1.seconds,
                  ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You earned",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  !receivedReward
                      ? Text(
                          "20",
                          style: TextStyle(
                            color: AppColor.right,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Countup(
                          begin: 20,
                          end: 0,
                          duration: 1.seconds,
                          style: TextStyle(
                            color: AppColor.right,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  const SizedBox(width: 10),
                  Text(
                    "coins",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
                  .animate(
                    onPlay: (controller) => controller.repeat(),
                  )
                  .shimmer(
                    delay: 2.seconds,
                    duration: 1.seconds,
                  ),
              const Spacer(),
              ZoomTapAnimation(
                onTap: () {
                  final moneyProvider =
                      Provider.of<MoneyProvider>(context, listen: false);
                  moneyProvider.increaseCoins(20);

                  setState(() {
                    changeChest = true;
                    receivedReward = true;
                  });

                  Future.delayed(1.2.seconds, () {
                    setState(() {});
                  });
                },
                child: !receivedReward
                    ? Column(
                        children: [
                          SizedBox(
                            height: 80.h,
                            child: Image.asset("assets/images/treasure.png"),
                          )
                              .animate(
                                onPlay: (controller) => controller.repeat(),
                              )
                              .scaleXY(
                                delay: 2.seconds,
                                duration: .3.seconds,
                                begin: 1,
                                end: 1.2,
                              )
                              .then()
                              .shake(
                                duration: .4.seconds,
                              )
                              .then()
                              .scaleXY(
                                curve: Curves.bounceOut,
                                duration: .3.seconds,
                                begin: 1.2,
                                end: 1,
                              ),
                          SizedBox(height: 10.h),
                          Text(
                            "Tap the chest to redeem",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ),
              const Spacer(),
              if (receivedReward)
                ZoomTapAnimation(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/select");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 15.h,
                      horizontal: 30.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.right,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ).animate().fadeIn(
                      delay: .5.seconds,
                      duration: 1.seconds,
                    ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
