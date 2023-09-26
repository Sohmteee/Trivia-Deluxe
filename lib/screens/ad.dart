import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/models/dialogs/close_ad.dart';
import 'package:trivia/models/dialogs/exit.dart';
import 'package:trivia/models/dialogs/settings.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

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
                child: ,
              )
            ],
          ),
        ),
      ),
    );
  }
}
