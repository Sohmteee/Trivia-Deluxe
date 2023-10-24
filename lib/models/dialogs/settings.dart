import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/main.dart';
import 'package:trivia/models/dialogs/credits.dart';
import 'package:trivia/models/dialogs/game.dart';
import 'package:trivia/models/dialogs/help.dart';
import 'package:trivia/providers/audio.dart';
import 'package:trivia/providers/question.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

showSettingsDialog(BuildContext context) {
  showGameDialog(
    context,
    isExitable: true,
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Game Settings",
          style: TextStyle(
            color: AppColor.yellow,
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
                      color: Colors.white,
                      fontSize: 18.sp,
                    ),
                  ),
                  Consumer<AudioProvider>(
                    builder: (context, audioProvider, _) {
                      return Switch(
                        value: audioProvider.music,
                        activeColor: Colors.red,
                        onChanged: (value) {
                          playTap(context);
                          audioProvider.toggleMusic(value);
                        },
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
                            duration: 1.seconds,
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
                      color: Colors.white,
                      fontSize: 18.sp,
                    ),
                  ),
                  Consumer<AudioProvider>(builder: (context, audioProvider, _) {
                    return Switch(
                      value: audioProvider.soundEffects,
                      activeColor: Colors.red,
                      onChanged: (value) {
                        playTap(context);
                        audioProvider.toggleSoundEffects(value);
                      },
                    );
                  })
                ],
              ),
              Consumer<AudioProvider>(
                builder: (context, audioProvider, _) {
                  return audioProvider.soundEffects == true
                      ? Row(
                          children: [
                            Text(
                              "${(audioProvider.effectsVolume * 100).toInt()}%",
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 18.sp,
                              ),
                            ),
                            Slider(
                                divisions: 10,
                                value: audioProvider.effectsVolume,
                                onChanged: (value) {
                                  audioProvider.setEffectsVolume(value);
                                },
                                semanticFormatterCallback: (double newValue) {
                                  return "${(audioProvider.effectsVolume * 100).toInt()}%";
                                }),
                          ],
                        ).animate().fadeIn(
                            duration: 1.seconds,
                          )
                      : const SizedBox();
                },
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Auto Answer",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                        ),
                      ),
                      Consumer<QuestionProvider>(
                        builder: (context, questionProvider, _) {
                          return Switch(
                            value: questionProvider.autoAnswer,
                            activeColor: Colors.red,
                            onChanged: (value) {
                              playTap(context);
                              questionProvider.toggleAutoAnswer(value);
                            },
                          );
                        },
                      )
                    ],
                  ),
                  ZoomTapAnimation(
                    onTap: () {
                      playTap(context);
                      showHelpDialog(context);
                    },
                    child: Icon(
                      Icons.help_outline,
                      color: Colors.grey[200],
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              ZoomTapAnimation(
                onTap: () {
                  playTap(context);
                  Navigator.pop(context);
                  showCreditsDialog(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.sp,
                    horizontal: 20.sp,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    "Credits",
                    style: TextStyle(
                      fontSize: 20.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
