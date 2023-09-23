import 'package:flutter/material.dart';
import 'package:trivia/colors/app_color.dart';

showFailedDialog(context) {
  showDialog(
      context: context,
      builder: (context) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.transparent,
          ),
          child: Dialog(
            elevation: 0,
            shadowColor: Colors.transparent,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            insetAnimationCurve: Curves.bounceInOut,
            insetAnimationDuration: const Duration(milliseconds: 300),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
              decoration: BoxDecoration(
                color: AppColor.darkRed,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        );
      });
}
