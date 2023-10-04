import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/data/controllers.dart';
import 'package:trivia/main.dart';
import 'package:trivia/models/game_background.dart';
import 'package:trivia/models/stat_bar.dart';
import 'package:trivia/providers/money.dart';
import 'package:trivia/providers/score.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({super.key});

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  bool receivedReward = false;
  late int score;
  late ConfettiController vitoryConfettiController;
  final offset = const Offset(20, -350);
  late Path path;

  bool countUp = false, claimReward = false;

  @override
  void initState() {
    playVictory(context);
    path = Path()
      ..arcToPoint(
        offset,
        radius: const Radius.circular(300),
        clockwise: true,
      );
    vitoryConfettiController = ConfettiController(duration: 1.5.seconds);
    final scoreProvider = Provider.of<ScoreProvider>(context, listen: false);
    score = scoreProvider.score;
    scoreProvider.resetScore();

    score = 18;

    final moneyProvider = Provider.of<MoneyProvider>(context, listen: false);
    moneyProvider.resetCoins();

    Future.delayed(5.5.seconds, () {
      setState(() {
        countUp = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    victoryPlayer.dispose();
    vitoryConfettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        playTap(context);
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConfettiWidget(
                    confettiController: vitoryConfettiController,
                    blastDirection: 0,
                    emissionFrequency: 0.6,
                    minimumSize: const Size(10, 10),
                    maximumSize: const Size(10, 10),
                    numberOfParticles: 5,
                    gravity: .3,
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.orange,
                      Colors.purple,
                    ],
                  ),
                  SizedBox(
                    child: Stack(
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
                  )
                      .animate(
                        onPlay: (controller) => Future.delayed(
                          1.seconds,
                          () => vitoryConfettiController.play(),
                        ),
                      )
                      .scaleXY(
                        delay: 1.seconds,
                        duration: 1.seconds,
                        begin: 0,
                        end: 1.2,
                      )
                      .then()
                      .scaleXY(
                        delay: 2.seconds,
                        curve: Curves.bounceOut,
                        duration: .3.seconds,
                        begin: 1.2,
                        end: 1,
                      ),
                  ConfettiWidget(
                    confettiController: vitoryConfettiController,
                    blastDirection: pi,
                    emissionFrequency: 0.6,
                    minimumSize: const Size(10, 10),
                    maximumSize: const Size(10, 10),
                    numberOfParticles: 5,
                    gravity: .3,
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.orange,
                      Colors.purple,
                    ],
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You earned",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ).animate().scaleXY(
                          delay: 7.seconds,
                          duration: .5.seconds,
                          begin: 1,
                          end: 0,
                        ),
                    const SizedBox(width: 10),
                    !claimReward
                        ? SizedBox(
                            child: countUp
                                ? Countup(
                                    begin: 0,
                                    end: score.toDouble(),
                                    duration: 1.seconds,
                                    style: TextStyle(
                                      color: AppColor.right,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Text(
                                    "0",
                                    style: TextStyle(
                                      color: AppColor.right,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          )
                        : SizedBox(
                            child: Stack(
                              children: List.generate(
                                score,
                                (index) => SizedBox(
                                  width: 30.w,
                                  child: Image.asset("assets/images/coin.png"),
                                ),
                              )
                                  .animate(
                                      interval: 50.milliseconds,
                                      onPlay: (controller) {
                                        Future.delayed(1.8.seconds, () {
                                          playCoinUp(context);
                                        });
                                      },
                                      onComplete: (controller) {
                                        setState(() {
                                          receivedReward = true;
                                          final moneyProvider =
                                              Provider.of<MoneyProvider>(
                                                  context,
                                                  listen: false);
                                          moneyProvider.increaseCoins(1);
                                        });
                                      })
                                  .followPath(
                                    path: path,
                                    delay: 1.seconds,
                                    duration: 1.seconds,
                                  )
                                  .fadeOut(
                                    delay: 1.seconds,
                                    duration: 1.seconds,
                                  ),
                                  
                            ),
                          ).animate().fadeIn(
                              duration: .5.seconds,
                              begin: 0,
                            ),
                    const SizedBox(width: 10),
                    Text(
                      "coins",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ).animate().scaleXY(
                          delay: 7.seconds,
                          duration: .5.seconds,
                          begin: 1,
                          end: 0,
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
              ).animate(
                onComplete: (controller) {
                  Future.delayed(3.seconds, () {
                    setState(() {
                      claimReward = true;
                    });
                  });
                },
              ).slideX(
                delay: 2.seconds,
                duration: 2.seconds,
                begin: 20.h,
                end: 0,
              ),
              const Spacer(flex: 2),
              if (receivedReward)
                ZoomTapAnimation(
                  onTap: () {
                    playTap(context);
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

Path drawStar(Size size) {
  // Method to convert degree to radians
  double degToRad(double deg) => deg * (pi / 180.0);

  const numberOfPoints = 5;
  final halfWidth = size.width / 2;
  final externalRadius = halfWidth;
  final internalRadius = halfWidth / 2.5;
  final degreesPerStep = degToRad(360 / numberOfPoints);
  final halfDegreesPerStep = degreesPerStep / 2;
  final path = Path();
  final fullAngle = degToRad(360);
  path.moveTo(size.width, halfWidth);

  for (double step = 0; step < fullAngle; step += degreesPerStep) {
    path.lineTo(halfWidth + externalRadius * cos(step),
        halfWidth + externalRadius * sin(step));
    path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
        halfWidth + internalRadius * sin(step + halfDegreesPerStep));
  }
  path.close();
  return path;
}
