import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/models/game_background.dart';
import 'package:trivia/models/level_tile.dart';
import 'package:trivia/models/stat_bar.dart';

class SelectSreen extends StatefulWidget {
  const SelectSreen({super.key});

  @override
  State<SelectSreen> createState() => _SelectSreenState();
}

class _SelectSreenState extends State<SelectSreen> {
  @override
  Widget build(BuildContext context) {
    return GameBackground(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
        child: Column(
          children: [
            const GameStats(),
            const Spacer(),ListView.builder(
              
              itemCount: 2,
              padding: EdgeInsets.only(top: 20.h),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Consumer<LevelProvider>(
                    builder: (_, levelProvider, child) {
                  return widget.level == levelProvider.completedLevel + 1
                      ? SizedBox(
                          child: Container(
                            padding: EdgeInsets.all(20.sp),
                            margin: EdgeInsets.only(bottom: 20.sp),
                            decoration: BoxDecoration(
                              color:
                                  levelProvider.completedLevel >= widget.level
                                      ? AppColor.levelYellow
                                      : widget.level ==
                                              levelProvider.completedLevel + 1
                                          ? AppColor.levelYellow.withOpacity(.3)
                                          : Colors.transparent,
                              border: Border.all(
                                width: 2.sp,
                                color: AppColor.lightRed,
                              ),
                            ),
                            child: Text(
                              (widget.level).toString(),
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 16.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                          )
                      : Container(
                          padding: EdgeInsets.all(20.sp),
                          margin: EdgeInsets.only(bottom: 20.sp),
                          decoration: BoxDecoration(
                            color: levelProvider.completedLevel >= widget.level
                                ? AppColor.levelYellow
                                : widget.level ==
                                        levelProvider.completedLevel + 1
                                    ? AppColor.levelYellow.withOpacity(.3)
                                    : Colors.transparent,
                            border: Border.all(
                              width: 2.sp,
                              color: AppColor.lightRed,
                            ),
                          ),
                          child: Text(
                            (widget.level).toString(),
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 16.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                          .animate(
                            onPlay: (controller) => controller.repeat(),
                          )
                          .shimmer(
                            delay: 1.5.seconds,
                            duration: 1.seconds,
                          );
                });
              },
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
