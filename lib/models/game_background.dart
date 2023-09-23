import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/models/pop_scope.dart';

class GameBackground extends StatefulWidget {
  const GameBackground({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  State<GameBackground> createState() => _GameBackgroundState();
}

class _GameBackgroundState extends State<GameBackground> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
        body: Stack(
          children: [
            buildBlurBackground(),
            widget.body,
          ],
        ),
      ),
    );
  }

  Blur buildBlurBackground() {
    return Blur(
      blur: 30,
      blurColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            color: AppColor.darkRed,
          ),
          Positioned(
            top: 20.h,
            left: -130.w,
            child: Container(
              height: 200.sp,
              width: 200.sp,
              decoration: BoxDecoration(
                color: AppColor.lightRed,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 150.h,
            right: -130.w,
            child: Container(
              height: 200.sp,
              width: 200.sp,
              decoration: BoxDecoration(
                color: AppColor.lightRed,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: -150.w,
            child: Container(
              height: 200.sp,
              width: 200.sp,
              decoration: BoxDecoration(
                color: AppColor.lightRed,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
