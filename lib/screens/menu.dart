import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/data/controllers.dart';
import 'package:trivia/providers/audio.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    playBGAudio();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
      case AppLifecycleState.inactive:
        print("music playing");
        playBGAudio();
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
        print("music paused");
        pauseBGAudio();
        break;
      case AppLifecycleState.detached:
        stopBGAudio();
        print("music stopped");
        break;
    }
  }

  Future<void> playBGAudio() async {
    String bgAudio = "audio/bg-music.mp3";
    await player.setSource(AssetSource(bgAudio));
    await player.resume();

    player.onPlayerComplete.listen((_) async {
      await player.play(AssetSource(bgAudio));
    });

    
  }

  Future<void> pauseBGAudio() async {
    await player.pause();
  }

  Future<void> stopBGAudio() async {
    await player.stop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(20.sp),
                      child: ZoomTapAnimation(
                        onTap: () {
                          /* Navigator.pushNamedAndRemoveUntil(
                        context, "/menu", (route) => false); */
                        },
                        child: Container(
                          padding: EdgeInsets.all(2.sp),
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
                            size: 18.sp,
                            color: AppColor.levelYellow,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 3),
                  Consumer<AudioProvider>(builder: (context, audioProvider, _) {
                    return Slider(
                      value: audioProvider.volume,
                      onChanged: (value) {
                        audioProvider.setVolume(value);
                      },
                    );
                  }),
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
                  SizedBox(
                    height: 70.w,
                    child: ZoomTapAnimation(
                      onTap: () {
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
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
