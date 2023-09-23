import 'package:flutter/material.dart';
import 'package:trivia/data/controllers.dart';

class TimeProvider extends ChangeNotifier {
  String? time = countDownController.getTime();

 
}
