import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/data/controllers.dart';
import 'package:trivia/models/dialogs/close_ad.dart';

class AdScreen extends StatefulWidget {
  const AdScreen({super.key});

  @override
  State<AdScreen> createState() => _AdScreenState();
}

class _AdScreenState extends State<AdScreen> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showCloseAdDialog(context);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: CircularCountDownTimer(
                    duration: 5,
                    controller: adCountDownController,
                    width: 20,
                    height: 20,
                    ringColor: Colors.grey,
                    ringGradient: null,
                    fillColor: Colors.grey[300]!,
                    fillGradient: null,
                    backgroundColor: Colors.transparent,
                    backgroundGradient: null,
                    strokeWidth: 3,
                    strokeCap: StrokeCap.round,
                    textStyle: TextStyle(
                      fontSize: 33.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textFormat: CountdownTextFormat.S,
                    isReverse: true,
                    isReverseAnimation: true,
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

                      // questionProvider.checkCorrectAnswer(context, -1);
                    },
                    timeFormatterFunction:
                        (defaultFormatterFunction, duration) {
                      return Function.apply(
                          defaultFormatterFunction, [duration]);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
