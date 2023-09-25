import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/models/game_background.dart';
import 'package:trivia/models/stat_bar.dart';
import 'package:trivia/providers/question.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  List<String> selectItems = ["Animals", "Riddles"];

  @override
  Widget build(BuildContext context) {
    return GameBackground(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
        child: Column(
          children: [
            const GameStats(),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                padding: EdgeInsets.only(top: 20.h),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Consumer<QuestionProvider>(
                      builder: (_, questionProvider, child) {
                    return Container(
                      padding: EdgeInsets.all(20.sp),
                      margin: EdgeInsets.only(bottom: 20.sp),
                      decoration: BoxDecoration(
                        color: AppColor.lightRed,
                        border: Border.all(
                          width: 2.sp,
                          color: AppColor.lightRed,
                        ),
                      ),
                      child: Text(
                        (selectItems[index]).toString(),
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
