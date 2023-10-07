import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/data/controllers.dart';
import 'package:trivia/models/dialogs/fail.dart';
import 'package:trivia/providers/stage.dart';
import 'package:trivia/providers/score.dart';

class QuestionProvider extends ChangeNotifier {
  Map<String, dynamic> data = {};
  List questions = [];
  int questionIndex = -1;
  int currentLevel = 1;

  String question = "", title = "";

  List<Map<String, dynamic>> options = [];
  bool questionIsShuffled = false;

  void initQuestionProvider(context) {
    questions = data["data"];
    questionIndex = data["currentIndex"];
    currentLevel = data["currentLevel"];

    if (!questionIsShuffled) {
      questions.shuffle();
      questionIsShuffled = true;
    }

    if (questionIndex < questions.length - 1) {
      questionIndex = questionIndex + 1;
      data["currentIndex"] = questionIndex;
    } else {
      questionIndex = 0;
      data["currentIndex"] = questionIndex;
      questions.shuffle();
    }

    question = questions[questionIndex]["question"];
    options = questions[questionIndex]["options"];

    options.shuffle();

    notifyListeners();
  }

  void resetOptions() {
    for (var option in options) {
      option["color"] = AppColor.yellow;
    }
  }

  incrementLevel() {
    currentLevel++;
  }

  void checkCorrectAnswer(BuildContext context, int index) {
    if (index == -1) {
      showFailedDialog(context, questionIndex, true);

      notifyListeners();
      return;
    }

    if (options[index]["value"] == true) {
      options[index]["color"] = AppColor.right;
    } else {
      options[index]["color"] = AppColor.wrong;

      for (var option in options) {
        if (option["value"] == true) {
          option["color"] = AppColor.right;
        }
      }
    }

    final stageProvider = Provider.of<StageProvider>(context, listen: false);

    Future.delayed((options[index]["value"] == true) ? 6.seconds : 1.5.seconds,
        () {
      if (options[index]["value"] == true) {
        final scoreProvider =
            Provider.of<ScoreProvider>(context, listen: false);
        scoreProvider.updatedScore(int.parse(countDownController.getTime()!));
        stageProvider.incrementCompletedStage();

        if (stageProvider.completedStage == 3) {
          Navigator.pushNamedAndRemoveUntil(
              context, "/reward", (route) => false);
          Future.delayed(2.seconds, () {
            stageProvider.resetCompletedStage();
          });
        } else {
          Navigator.pushReplacementNamed(context, "/level");
        }
      } else {
        showFailedDialog(context, questionIndex, false);
      }

      resetOptions();
    });

    Future.delayed(.2.seconds, () {
      notifyListeners();
    });
  }
}
