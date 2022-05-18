import 'package:flutter/material.dart';

class Controller extends ChangeNotifier {
  int totalLetters = 0, lettersAnswered = 0;
  setUp({required int total}) {
    totalLetters = total;
    notifyListeners();
  }

  incrementLetters() {
    lettersAnswered++;
    if (lettersAnswered == totalLetters) {
      //print("word complees");
    }
    notifyListeners();
  }
}
