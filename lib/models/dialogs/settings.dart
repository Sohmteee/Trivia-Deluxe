import 'package:flutter/material.dart';
import 'package:trivia/models/dialogs/game_dialog.dart';

showSettingsDialog(BuildContext context) {
  showGameDialog(
    context,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Oya another option dey",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
