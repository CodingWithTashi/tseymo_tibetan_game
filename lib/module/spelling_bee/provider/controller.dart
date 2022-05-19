import 'package:flutter/material.dart';
import 'package:tibetan_game/module/spelling_bee/bee_constant.dart';
import 'package:tibetan_game/module/spelling_bee/widget/message_box.dart';

class Controller extends ChangeNotifier {
  int totalLetters = 0, lettersAnswered = 0, wordAnswered = 0;
  bool generateWord = true, sessionCompleted = false;
  setUp({required int total}) {
    lettersAnswered = 0;
    totalLetters = total;
    notifyListeners();
  }

  incrementLetters({required BuildContext context}) {
    lettersAnswered++;
    if (lettersAnswered == totalLetters) {
      wordAnswered++;
      //print("word complees");
      if (wordAnswered == allWords.length) {
        sessionCompleted = true;
      }
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => MessageBox(
                sessionCompleted: sessionCompleted,
              ));
    }
    notifyListeners();
  }

  requestWord({required bool request}) {
    generateWord = request;
    notifyListeners();
  }

  reset() {
    sessionCompleted = false;
    wordAnswered = 0;
    generateWord = true;
  }
}
