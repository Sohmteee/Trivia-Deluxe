import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:trivia/colors/app_color.dart';
import 'package:trivia/data/controllers.dart';
import 'package:trivia/models/dialogs/fail.dart';
import 'package:trivia/providers/level.dart';
import 'package:trivia/providers/score.dart';

class QuestionProvider extends ChangeNotifier {
  List questions = [];
  int questionIndex = -1;

  String question = "";
  List<Map<String, dynamic>> options = [];
  bool questionIsShuffled = false;

  void initQuestionProvider(context) {
    if (!questionIsShuffled) {
      questions.shuffle();
      questionIsShuffled = true;
    }

    if (questionIndex < questions.length - 1) {
      questionIndex = questionIndex + 1;
    } else {
      questionIndex = 0;
      questions.shuffle();
    }

    question = questions["data"][questionIndex]["question"];
    options = questions[questionIndex]["options"];
  }

  void resetOptions() {
    for (var option in options) {
      option["color"] = AppColor.yellow;
    }
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

    final levelProvider = Provider.of<LevelProvider>(context, listen: false);

    Future.delayed((options[index]["value"] == true) ? 6.seconds : 1.5.seconds,
        () {
      if (options[index]["value"] == true) {
        final scoreProvider =
            Provider.of<ScoreProvider>(context, listen: false);
        scoreProvider.updatedScore(int.parse(countDownController.getTime()!));
        levelProvider.incrementCompletedLevel();

        if (levelProvider.completedLevel == 3) {
          Navigator.pushNamedAndRemoveUntil(
              context, "/reward", (route) => false);
          Future.delayed(2.seconds, () {
            levelProvider.resetCompletedLevel();
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
