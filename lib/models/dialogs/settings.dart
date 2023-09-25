import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trivia/models/dialogs/game_dialog.dart';
import 'package:trivia/providers/audio.dart';

showSettingsDialog(BuildContext context) {
  showGameDialog(
    context,
    isExitable: true,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Game Settings",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Game Music",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 20.sp,
                  ),
                ),
              ),
              Consumer<AudioProvider>(builder: (context, audioProvider, _) {
                return Slider(
                  value: audioProvider.volume,
                  onChanged: (value) {
                    audioProvider.setVolume(value);
                  },
                );
              }),
            ],
          ),
        ),
      ],
    ),
  );
}
