import 'package:flutter/material.dart';
import 'package:tibetan_game/module/spelling_bee/widget/message_box.dart';

class Controller extends ChangeNotifier {
  int totalLetters = 0, lettersAnswered = 0;
  bool generateWord = true;
  setUp({required int total}) {
    totalLetters = total;
    notifyListeners();
  }

  incrementLetters({required BuildContext context}) {
    lettersAnswered++;
    if (lettersAnswered == totalLetters) {
      //print("word complees");
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => MessageBox());
    }
    notifyListeners();
  }

  requestWord({required bool request}) {
    generateWord = request;
    notifyListeners();
  }
}
