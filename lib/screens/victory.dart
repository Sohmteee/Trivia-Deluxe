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

class VictoryScreen extends StatefulWidget {
  const VictoryScreen({super.key});

  @override
  State<VictoryScreen> createState() => _VictoryScreenState();
}

class _VictoryScreenState extends State<VictoryScreen> {
  bool receivedReward = false;

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
              const Spacer(flex: 2),
              ZoomTapAnimation(
                onTap: () {
                  final moneyProvider =
                      Provider.of<MoneyProvider>(context, listen: false);
                  moneyProvider.increaseCoins(20);
                },
                child: SizedBox(
                  height: 80.h,
                  child: Image.asset("assets/images/treasure.png"),
                ),
              ),
              const Spacer(flex: 5),
            ],
          ),
        ),
      ),
    );
  }
}
