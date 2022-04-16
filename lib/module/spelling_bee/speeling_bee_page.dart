import 'package:flutter/material.dart';
import 'package:tibetan_game/util/common_util.dart';

class SpellingBeePage extends StatefulWidget {
  static const routeName = 'spelling-bee';
  const SpellingBeePage({Key? key}) : super(key: key);

  @override
  State<SpellingBeePage> createState() => _SpellingBeePageState();
}

class _SpellingBeePageState extends State<SpellingBeePage> {
  @override
  void initState() {
    CommonUtil.setPortrait();
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
