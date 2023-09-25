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
              Row(
                children: [
                  Text(
                    "Music",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 18.sp,
                    ),
                  ),
                  Switch(
                    value: true,
                    activeColor: Colors.red,
                    onChanged: (value) {},
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.volume_down_alt),
                  Consumer<AudioProvider>(builder: (context, audioProvider, _) {
                    return Slider(
                      divisions: 10,
                      value: audioProvider.volume,
                      onChanged: (value) {
                        audioProvider.setVolume(value);
                      },
                    );
                  }),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Music",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 18.sp,
                    ),
                  ),
                  Switch(
                    value: true,
                    activeColor: Colors.red,
                    onChanged: (value) {},
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
