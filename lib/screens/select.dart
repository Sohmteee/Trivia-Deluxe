import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/data/questions.dart';
import 'package:trivia/main.dart';
import 'package:trivia/models/game_background.dart';
import 'package:trivia/models/stat_bar.dart';
import 'package:trivia/providers/level.dart';
import 'package:trivia/providers/question.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  List<Map<String, dynamic>> selectItems = [
    {
      "image": "assets/images/dolphin.png",
      "title": "Animals",
      "questions": animalsData,
    },
    {
      "image": "assets/images/quote.png",
      "title": "Proverbs",
      "questions": proverbsData,
    },
    {
      "image": "assets/images/puzzle.png",
      "title": "Riddles",
      "questions": riddlesData,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        playTap(context);
        Navigator.pushReplacementNamed(context, "/menu");
        return true;
      },
      child: GameBackground(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
          child: Column(
            children: [
              const GameStats(),
              const Spacer(flex: 2),
              Text(
                "Choose a category",
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 30.sp,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              SizedBox(
                height: 300.h,
                child: ListView.builder(
                  itemCount: selectItems.length,
                  padding: EdgeInsets.only(top: 20.h),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final selectItem = selectItems[index];
                    return Consumer<QuestionProvider>(
                        builder: (_, questionProvider, child) {
                      return ZoomTapAnimation(
                        onTap: () {
                          var levelProvider = Provider.of<LevelProvider>(
                              context,
                              listen: false);
                          levelProvider.resetCompletedLevel();
                          questionProvider.questions = selectItem["questions"];
                          Future.delayed(
                            3.microseconds,
                            () => Navigator.pushNamed(context, "/level"),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.sp),
                          margin: EdgeInsets.only(bottom: 20.sp),
                          decoration: BoxDecoration(
                            color: AppColor.lightRed,
                            border: Border.all(
                              width: 2.sp,
                              color: AppColor.lightRed,
                            ),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              selectItem["image"],
                              width: 40.w,
                              height: 40.h,
                            ),
                            title: Text(
                              selectItem["title"],
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 16.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            trailing: const SizedBox(),
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
