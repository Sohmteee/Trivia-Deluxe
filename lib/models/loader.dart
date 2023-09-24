import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/providers/loading.dart';
import 'package:velocity_x/velocity_x.dart';

class Loader extends StatefulWidget {
  const Loader({super.key});

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoadingProvider>(builder: (context, loadingProvider, _) {
      return Stack(
        children: [
          Container(
            height: 20.h,
            width: 300,
            color: Colors.grey[300],
          ),
          AnimatedContainer(
            duration: 300.seconds,
            height: 20.h,
            width: (loadingProvider.loadingValue / 1000) * 300,
            color: AppColor.levelYellow,
          ),
        ],
      );
    });
  }
}
