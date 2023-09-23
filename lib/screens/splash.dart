import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/colors/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

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
            color: AppColor.black.withOpacity(.5),
            /* gradient: LinearGradient(
              colors: [
                AppColor.primaryColor,
              ],
            ), */
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
                        color: AppColor.lightRed,
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Stack(
                    children: [
                      Container(
                        width: 500.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      Container(
                        width: 200.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                          color: AppColor.lightRed,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ],
                  ),
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
