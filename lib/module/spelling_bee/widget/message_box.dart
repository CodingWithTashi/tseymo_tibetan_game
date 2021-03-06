import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tibetan_game/module/spelling_bee/provider/controller.dart';
import 'package:tibetan_game/module/spelling_bee/speeling_bee_page.dart';

class MessageBox extends StatelessWidget {
  final bool sessionCompleted;
  const MessageBox({
    Key? key,
    required this.sessionCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = "Well Done";
    String buttonText = "Generate New";
    if (sessionCompleted) {
      title = "All word completed";
      buttonText = "Replay";
    }
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: Colors.amber,
      actionsAlignment: MainAxisAlignment.center,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            if (sessionCompleted) {
              Provider.of<Controller>(context, listen: false).reset();
              Navigator.of(context)
                  .pushReplacementNamed(SpellingBeePage.routeName);
            } else {
              Provider.of<Controller>(context, listen: false)
                  .requestWord(request: true);
              Navigator.of(context).pop();
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              buttonText,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: 30,
                  ),
            ),
          ),
        )
      ],
    );
  }
}
