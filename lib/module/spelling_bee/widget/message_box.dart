import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tibetan_game/module/spelling_bee/provider/controller.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: Colors.amber,
      actionsAlignment: MainAxisAlignment.center,
      title: Text(
        'Well Done',
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
            Provider.of<Controller>(context, listen: false)
                .requestWord(request: true);
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Generate Word",
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
