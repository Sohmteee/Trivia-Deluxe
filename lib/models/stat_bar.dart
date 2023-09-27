import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/models/dialogs/ad.dart';
import 'package:trivia/models/dialogs/settings.dart';
import 'package:trivia/providers/money.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GameStats extends StatefulWidget {
  const GameStats({
    super.key,
    this.showHome,
  });

  final bool? showHome;

  @override
  State<GameStats> createState() => _GameStatsState();
}

class _GameStatsState extends State<GameStats> {
  bool animateCoins = false;

  @override
  void initState() {
    final coins = Provider.of<MoneyProvider>(context, listen: false);
    coins.addListener(() {
      setState(() {
        debugPrint("coins updated");
        animateCoins = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    setState(() {
      animateCoins = false;
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoneyProvider>(builder: (context, moneyProvider, _) {
      return Row(
        children: [
          if (widget.showHome ?? true != false)
            ZoomTapAnimation(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/menu", (route) => false);
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
                  Icons.home_rounded,
                  size: 22.sp,
                  color: AppColor.levelYellow,
                ),
              ),
            ),
          if (widget.showHome ?? true != false) const Spacer(flex: 4),
          Container(
            height: 20.h,
            padding: EdgeInsets.all(2.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: AppColor.lightRed,
                width: 2.sp,
              ),
              borderRadius: BorderRadius.circular(8.r),
              gradient: LinearGradient(
                colors: [
                  AppColor.lightRed,
                  AppColor.darkRed,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Image.asset("assets/images/money.png"),
          ),
          SizedBox(width: 5.w),
          ZoomTapAnimation(
            onTap: () {
              moneyProvider.increaseCash(100);
            },
            child: Container(
              height: 20.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColor.lightRed,
                  width: 2.sp,
                ),
                borderRadius: BorderRadius.circular(15.r),
                gradient: LinearGradient(
                  colors: [
                    AppColor.lightRed,
                    AppColor.darkRed,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        moneyProvider.cash.toString(),
                        style: const TextStyle(
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 18.w,
                    padding: EdgeInsets.symmetric(vertical: 3.sp),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(8.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.add,
                          size: 13.sp,
                          color: AppColor.white,
                        ),
                        const SizedBox(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const Spacer(flex: 3),
          Container(
            height: 20.h,
            padding: EdgeInsets.all(2.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: AppColor.lightRed,
                width: 2.sp,
              ),
              borderRadius: BorderRadius.circular(8.r),
              gradient: LinearGradient(
                colors: [
                  AppColor.lightRed,
                  AppColor.darkRed,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Image.asset("assets/images/coin.png"),
          ),
          SizedBox(width: 5.w),
          ZoomTapAnimation(
            onTap: () {
              showAdDialog(context);
            },
            child: Container(
              height: 20.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColor.lightRed,
                  width: 2.sp,
                ),
                borderRadius: BorderRadius.circular(15.r),
                gradient: LinearGradient(
                  colors: [
                    AppColor.lightRed,
                    AppColor.darkRed,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Countup(
                        begin: moneyProvider.previousCoins.toDouble(),
                        end: moneyProvider.coins.toDouble(),
                        duration: 1.seconds,
                        style: const TextStyle(
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 18.w,
                    padding: EdgeInsets.symmetric(vertical: 3.sp),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(8.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.add,
                          size: 13.sp,
                          color: AppColor.white,
                        ),
                        const SizedBox(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          if (widget.showHome ?? true != false) const Spacer(flex: 4),
          if (widget.showHome ?? true != false)
            ZoomTapAnimation(
              onTap: () {
                showSettingsDialog(context);
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
                  size: 22.sp,
                  color: AppColor.levelYellow,
                ),
              ),
            ),
        ],
      );
    });
  }
}
