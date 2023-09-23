import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trivia/colors/hex_color.dart';
import 'package:velocity_x/velocity_x.dart';

class AppColor {
  AppColor._();

  static Color right = HexColor("#13BE00");

  static Color wrong = HexColor("#B71500");
  static Color lightRed = const Color.fromARGB(255, 150, 22, 13);
  static Color darkRed = HexColor("#300000");

  static Color yellow = const Color.fromARGB(255, 214, 193, 7);
  static Color slightlyLighterYellow = const Color.fromARGB(255, 240, 216, 7);
  static Color levelYellow = HexColor("#F7A20B");

  static Color white = Vx.white;
  static Color black = Vx.black;
}
