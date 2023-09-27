import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trivia/data/controllers.dart';
import 'package:trivia/models/pop_scope.dart';
import 'package:trivia/providers/money.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AdScreen extends StatefulWidget {
  const AdScreen({super.key});

  @override
  State<AdScreen> createState() => _AdScreenState();
}

class _AdScreenState extends State<AdScreen> with WidgetsBindingObserver {
  bool isFinished = false;

  @override
  void initState() {
    player.pause();
    super.initState();
  }

  @override
  void dispose() {
    player.resume();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context, false),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    (!isFinished)
                        ? Consumer<MoneyProvider>(
                            builder: (context, moneyProvider, _) {
                              return CircularCountDownTimer(
                                duration: 5,
                                controller: adCountDownController,
                                width: 20.sp,
                                height: 20.sp,
                                ringColor: Colors.grey[300]!,
                                ringGradient: null,
                                fillColor: Colors.grey,
                                fillGradient: null,
                                backgroundColor: Colors.transparent,
                                backgroundGradient: null,
                                strokeWidth: 3.sp,
                                strokeCap: StrokeCap.round,
                                textStyle: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                                textFormat: CountdownTextFormat.S,
                                isReverse: false,
                                isReverseAnimation: false,
                                isTimerTextShown: true,
                                autoStart: true,
                                onStart: () {
                                  debugPrint('Countdown Started');

                                  /* timer = Timer.periodic(1.seconds, (timer) {
                              if (iterationCount > 0) {
                                setState(() {
                                  iterationCount--;
                                });
                              } else {
                                timer.cancel();
                              }
                            });
                           */
                                },
                                onComplete: () {
                                  debugPrint('Countdown Ended');

                                  moneyProvider.increaseCoins(5);
                                  // Navigator.pop(context);
                                  setState(() {
                                    isFinished = true;
                                  });

                                  // questionProvider.checkCorrectAnswer(context, -1);
                                },
                                timeFormatterFunction:
                                    (defaultFormatterFunction, duration) {
                                  return Function.apply(
                                      defaultFormatterFunction, [duration]);
                                },
                              );
                            },
                          )
                        : ZoomTapAnimation(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 3.sp,
                                ),
                              ),
                              child: Icon(
                                Icons.close_rounded,
                                color: Colors.grey,
                                size: 15.sp,
                              ),
                            ),
                          ),
                  ],
                ),
                const Spacer(),
                Text(
                  "Showing ad...",
                  style: TextStyle(
                    fontSize: 30.sp,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
