import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

Future<bool> onWillPop(context, isExitable) async {
  if (isExitable) {
    return true;
  }
  ToastContext().init(context);
  Toast.show("You can't go back at the moment",
      duration: 2,
      gravity: Toast.bottom,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
      ));
  return false;
}
