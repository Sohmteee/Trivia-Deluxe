import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/main.dart';
import 'package:trivia/models/game_background.dart';
import 'package:trivia/models/level_tile.dart';
import 'package:trivia/models/stat_bar.dart';
import 'package:trivia/providers/level.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LevelScreen extends StatefulWidget {
  const LevelScreen({super.key});

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  late int level;

  @override
  void initState() {
    playLevel(context);
    level = Provider.of<LevelProvider>(context, listen: false).level;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, "/select");
        return true;
      },
      child: GameBackground(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
          child: Column(
            children: [
              const GameStats(),
              const Spacer(),
              Text(
                "Level $level",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              buildLevel(),
              const Spacer(flex: 3),
              Consumer<LevelProvider>(builder: (context, levelProvider, _) {
                return (levelProvider.completedStage != 3)
                    ? SizedBox(
                        height: 60.h,
                        child: ZoomTapAnimation(
                          onTap: () {
                            playTap(context);
                            Navigator.pushReplacementNamed(context, "/game");
                          },
                          child: Image.asset("assets/images/play.png"),
                        ),
                      )
                    : const SizedBox();
              })
            ],
          ),
        ),
      ),
    );
  }

  Stack buildLevel() {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(20.sp),
          width: double.maxFinite,
          height: 400.h,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.sp,
              color: AppColor.lightRed,
            ),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(150.r),
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            width: double.maxFinite,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.sp,
                color: AppColor.lightRed,
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(150.r),
              ),
            ),
            child: ListView.builder(
              itemCount: 3,
              padding: EdgeInsets.only(top: 20.h),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return LevelTile(
                  level: index + 1,
                );
              },
            ),
          ),
        ),
        Consumer<LevelProvider>(builder: (context, levelProvider, _) {
          return Positioned(
            bottom: -40.h,
            child: SizedBox(
              height: 150.h,
              child: Lottie.asset(
                "assets/json/chest.json",
                animate: false,
              ),
            ),
          );
        })
      ],
    );
  }
}
