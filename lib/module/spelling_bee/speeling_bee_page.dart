import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tibetan_game/module/spelling_bee/bee_constant.dart';
import 'package:tibetan_game/module/spelling_bee/provider/controller.dart';
import 'package:tibetan_game/module/spelling_bee/widget/drag.dart';
import 'package:tibetan_game/module/spelling_bee/widget/drop.dart';
import 'package:tibetan_game/util/common_util.dart';

class SpellingBeePage extends StatefulWidget {
  static const routeName = 'spelling-bee';
  const SpellingBeePage({Key? key}) : super(key: key);

  @override
  State<SpellingBeePage> createState() => _SpellingBeePageState();
}

class _SpellingBeePageState extends State<SpellingBeePage> {
  List<String> _words = allWords.toList();
  late String _word, _dropWord;
  @override
  void initState() {
    CommonUtil.setPortrait();
    final r = Random().nextInt(_words.length);
    _word = _words[r];
    _dropWord = _words[r];
    final s = _word.characters.toList()..shuffle();
    _word = s.join();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Controller>(context, listen: false)
          .setUp(total: _word.length);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.red,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    _dropWord.characters.map((e) => Drop(letter: e)).toList(),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.green,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.yellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _word.characters
                    .map((e) => Drag(
                          letter: e,
                        ))
                    .toList(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.orange,
            ),
          )
        ],
      ),
    );
  }
}
