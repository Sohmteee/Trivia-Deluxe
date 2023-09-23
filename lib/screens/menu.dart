import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                SizedBox(
                  height: 70.w,
                  child: ZoomTapAnimation(
                    onTap: () {
                      Navigator.pushNamed(context, "/level");
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
    );
  }
}
