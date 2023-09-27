import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trivia/models/dialogs/game.dart';
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
          padding: EdgeInsets.only(left: 15.w),
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
                  Consumer<AudioProvider>(
                    builder: (context, audioProvider, _) {
                      return Switch(
                        value: audioProvider.music,
                        activeColor: Colors.red,
                        onChanged: (value) => audioProvider.toggleMusic(value),
                      );
                    },
                  )
                ],
              ),
              Consumer<AudioProvider>(
                builder: (context, audioProvider, _) {
                  return audioProvider.music == true
                      ? Row(
                          children: [
                            Text(
                              "${(audioProvider.musicVolume * 100).toInt()}%",
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 18.sp,
                              ),
                            ),
                            Slider(
                                divisions: 10,
                                value: audioProvider.musicVolume,
                                onChanged: (value) {
                                  audioProvider.setMusicVolume(value);
                                },
                                semanticFormatterCallback: (double newValue) {
                                  return "${(audioProvider.musicVolume * 100).toInt()}%";
                                }),
                          ],
                        ).animate().fadeIn(
                            delay: 300.milliseconds,
                            duration: .5.seconds,
                          )
                      : const SizedBox();
                },
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    "Sound effects",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 18.sp,
                    ),
                  ),
                  Consumer<AudioProvider>(builder: (context, audioProvider, _) {
                    return Switch(
                      value: audioProvider.soundEffects,
                      activeColor: Colors.red,
                      onChanged: (value) =>
                          audioProvider.toggleSoundEffects(value),
                    );
                  })
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
