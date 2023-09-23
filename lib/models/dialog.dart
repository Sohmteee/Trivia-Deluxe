import 'package:flutter/material.dart';

showFailedDialog(context) {
  showDialog(
      context: context,
      builder: (context) {
        return Theme(
          
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.transparent,
          child: Dialog(
          ),
        );
      });
}
