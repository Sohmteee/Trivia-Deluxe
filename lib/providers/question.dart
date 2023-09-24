import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/data/questions.dart';
import 'package:trivia/models/dialogs/fail_dialog.dart';
import 'package:trivia/providers/level.dart';

class QuestionProvider extends ChangeNotifier {
  List questions = questionsData;
  int questionIndex = 0;

  String question = "";
  List<Map<String, dynamic>> options = [];

  void initQuestionProvider(context) {
    /* final levelProvider = Provider.of<LevelProvider>(context, listen: false);

    questionIndex =
        levelProvider.completedLevel == 3 ? 1 : levelProvider.completedLevel; */
    question = questionsData[questionIndex]["question"];
    options = questionsData[questionIndex]["options"];
  }

  void resetOptions() {
    for (var option in options) {
      option["colors"] = [
        AppColor.yellow,
        AppColor.slightlyLighterYellow,
        AppColor.yellow,
      ];
    }
  }

  void checkCorrectAnswer(BuildContext context, int index) {
    if (index == -1) {
      showFailedDialog(context, questionIndex, true);

      notifyListeners();
      return;
    }

    if (options[index]["value"] == true) {
      options[index]["colors"] = [
        AppColor.right,
        AppColor.right,
        AppColor.right,
      ];
    } else {
      options[index]["colors"] = [
        AppColor.wrong,
        AppColor.wrong,
        AppColor.wrong,
      ];

      for (var option in options) {
        if (option["value"] == true) {
          option["colors"] = [
            AppColor.right,
            AppColor.right,
            AppColor.right,
          ];
        }
      }
    }

    final levelProvider = Provider.of<LevelProvider>(context, listen: false);

    Future.delayed((options[index]["value"] == true) ? 6.seconds : 1.seconds,
        () {
      if (options[index]["value"] == true) {
        levelProvider.incrementCompletedLevel();
        Navigator.pushReplacementNamed(context, "/level");
      } else {
        showFailedDialog(context, questionIndex, false);
      }

      resetOptions();
      questionIndex++;
    });

    Future.delayed(.2.seconds, () {
      notifyListeners();
    });
  }
}
