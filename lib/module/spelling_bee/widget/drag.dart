import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tibetan_game/module/spelling_bee/provider/controller.dart';

class Drag extends StatefulWidget {
  final String letter;
  const Drag({Key? key, required this.letter}) : super(key: key);

  @override
  State<Drag> createState() => _DragState();
}

class _DragState extends State<Drag> {
  bool _accepted = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.15,
      height: size.height * 0.15,
      child: Center(
        child: _accepted
            ? SizedBox()
            : Draggable(
                data: widget.letter,
                childWhenDragging: SizedBox(),
                onDragEnd: (details) {
                  if (details.wasAccepted) {
                    _accepted = true;
                    setState(() {});
                    Provider.of<Controller>(context, listen: false)
                        .incrementLetters();
                  }
                },
                feedback: Text(
                  widget.letter,
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                    shadows: [
                      Shadow(
                        offset: Offset(3, 3),
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                ),
                child: Text(
                  widget.letter,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
      ),
    );
  }
}
