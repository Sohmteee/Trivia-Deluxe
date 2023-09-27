import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/models/game_background.dart';
import 'package:trivia/models/stat_bar.dart';

class VivtoryScreen extends StatefulWidget {
  const VivtoryScreen({super.key});

  @override
  State<VivtoryScreen> createState() => _VivtoryScreenState();
}

class _VivtoryScreenState extends State<VivtoryScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(context, "/menu", (route) => false);
        return true;
      },
      child: GameBackground(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
          child: Column(
            children: [
              const GameStats(),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
