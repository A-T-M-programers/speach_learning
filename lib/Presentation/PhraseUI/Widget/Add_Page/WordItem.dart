import 'package:flutter/material.dart';
import 'package:speach_learning/Domain/Entity/Word.dart';

// ignore: must_be_immutable
class WordItem extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables, non_constant_identifier_names
  WordItem({Key? key,required this.word}) : super(key: key);

  // ignore: non_constant_identifier_names
  Word word;
  @override
  State<WordItem> createState() => _WordItemState();
}

class _WordItemState extends State<WordItem> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      preferBelow: false,
      enableFeedback: true,
      textAlign: TextAlign.center,
    showDuration: const Duration(seconds: 5),
    triggerMode: TooltipTriggerMode.tap,
    richMessage: TextSpan(
      text: widget.word.content + "  =  " + (widget.word.translation),
      style: TextStyle(
        color: Theme.of(context).textTheme.headlineMedium!.color!,
      ),
    ),
    child: Text.rich(
      TextSpan(
    text: widget.word.content,
    mouseCursor: MaterialStateMouseCursor.clickable,
    style: TextStyle(
        color: Colors.transparent,
        decorationThickness: 3,
        decorationStyle: TextDecorationStyle.dotted,
        decoration: TextDecoration.underline,
        decorationColor:  Theme.of(context).textTheme.headlineSmall!.color!,
        shadows: [BoxShadow(color: Theme.of(context).textTheme.headlineSmall!.color!, offset: const Offset(0, -5))],
    ),
      ),
    )
    );
  }
}
