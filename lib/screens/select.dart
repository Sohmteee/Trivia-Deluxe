import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/data/questions.dart';
import 'package:trivia/models/game_background.dart';
import 'package:trivia/models/stat_bar.dart';
import 'package:trivia/providers/question.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  List<String> selectItems = ["Animals", "Riddles"];
  List<String> selectImages = [
    "assets/images/dolphin.png",
    "assets/images/puzzle.png"
  ];
  List selectQuestion = [animalsData, riddlesData];

  @override
  Widget build(BuildContext context) {
    return GameBackground(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
        child: Column(
          children: [
            const GameStats(),
            const Spacer(),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                padding: EdgeInsets.only(top: 20.h),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Consumer<QuestionProvider>(
                      builder: (_, questionProvider, child) {
                    return ZoomTapAnimation(
                      onTap: () {
                        questionProvider.question = selectQuestion[index];
                        Navigator.pushReplacementNamed(context, "/game");
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
                            selectImages[index],
                            width: 40.w,
                            height: 40.h,
                          ),
                          title: Text(
                            (selectItems[index]).toString(),
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
    );
  }
}
