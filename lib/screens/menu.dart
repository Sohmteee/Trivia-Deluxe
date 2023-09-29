import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/data/controllers.dart';
import 'package:trivia/main.dart';
import 'package:trivia/models/circle_border.dart';
import 'package:trivia/models/dialogs/exit.dart';
import 'package:trivia/models/dialogs/settings.dart';
import 'package:trivia/providers/audio.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  late Animation<double> rotationAnimation;
  late AnimationController rotationController;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    playBGAudio();

    rotationController = AnimationController(duration: 10.seconds, vsync: this)
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      })
      ..repeat();

    rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * pi, // 360 degrees in radians
    ).animate(rotationController);

    // Start the animation
    rotationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    rotationController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
      case AppLifecycleState.inactive:
        debugPrint("music playing");
        playBGAudio();
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
        debugPrint("music paused");
        pauseBGAudio();
        break;
      case AppLifecycleState.detached:
        stopBGAudio();
        debugPrint("music stopped");
        break;
    }
  }

  Future<void> playBGAudio() async {
    final audioProvider = Provider.of<AudioProvider>(context, listen: false);

    if (audioProvider.music) {
      await bgPlayer.setSource(AssetSource("audio/bg-music.mp3"));
      await bgPlayer.resume();
    }

    bgPlayer.onPlayerComplete.listen((_) async {
      await bgPlayer.setSource(AssetSource("audio/bg-music.mp3"));
      await bgPlayer.resume();
    });
  }

  Future<void> pauseBGAudio() async {
    await bgPlayer.pause();
  }

  Future<void> stopBGAudio() async {
    await bgPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        playTap(context);
        return showExitDialog(context);
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/house.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.black.withOpacity(.3),
              ),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.sp),
                          child: ZoomTapAnimation(
                            onTap: () {
                              playTap(context);
                              showExitDialog(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(5.sp),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColor.lightRed,
                                  width: 2.sp,
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    AppColor.lightRed,
                                    AppColor.darkRed,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Icon(
                                Icons.close_rounded,
                                size: 25.sp,
                                color: AppColor.levelYellow,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.sp),
                          child: ZoomTapAnimation(
                            onTap: () {
                              playTap(context);
                              showSettingsDialog(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(5.sp),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColor.lightRed,
                                  width: 2.sp,
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    AppColor.lightRed,
                                    AppColor.darkRed,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Icon(
                                Icons.settings_rounded,
                                size: 25.sp,
                                color: AppColor.levelYellow,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 3),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          "TRIVIA\nDELUXE",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 150, 22, 13),
                            fontSize: 90.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "TRIVIA\nDELUXE",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 80.sp,
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
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomPaint(
                          painter: CircleBorderPainter(
                            color: AppColor.white.withOpacity(.5),
                            radius: 40.w,
                            angle: 1.5 * pi,
                            strokeWidth: 4.sp,
                          ),
                        ),
                        /* SpinKitDualRing(
                          duration: 10.seconds,
                          color: AppColor.white.withOpacity(.5),
                          size: 100.sp,
                        ), */
                        /* RotationTransition(
                          turns: rotationAnimation,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 100.w,
                                width: 100.w,
                                padding: EdgeInsets.all(10.sp),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.wrong,
                                ),
                                child: Expanded(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 20.w,
                                width: 100.w,
                                padding: EdgeInsets.all(10.sp),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ), */
                        SizedBox(
                          height: 70.w,
                          child: ZoomTapAnimation(
                            onTap: () {
                              playTap(context);
                              Navigator.pushNamed(context, "/select");
                            },
                            child: Image.asset("assets/images/play.png"),
                          ),
                        )
                            .animate(
                              onPlay: (controller) => controller.repeat(),
                            )
                            .then()
                            .scaleXY(
                              curve: Curves.easeOutSine,
                              delay: 2.seconds,
                              duration: .2.seconds,
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
                              duration: .4.seconds,
                              begin: 1.2,
                              end: 1,
                            ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
