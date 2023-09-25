import 'package:flutter/material.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/models/pop_scope.dart';

showGameDialog(BuildContext context, {required Widget child, bool? isExitable}) {
  showDialog(
      context: context,
      builder: (context) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.transparent,
          ),
          child: WillPopScope(
            onWillPop: () => onWillPop(context, isExitable ?? false),
            child: Dialog(
              elevation: 0,
              shadowColor: Colors.transparent,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              insetAnimationCurve: Curves.bounceInOut,
              insetAnimationDuration: const Duration(milliseconds: 300),
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 60),
                decoration: BoxDecoration(
                  color: AppColor.lightRed,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                child: child,
              ),
            ),
          ),
        );
      });
}
