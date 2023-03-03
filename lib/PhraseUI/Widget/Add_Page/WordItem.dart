import 'package:flutter/material.dart';
import 'package:speach_learning/Process_Class/Word.dart';

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
      text: widget.word.content + "  =  " + widget.word.trans,
      children: [
        TextSpan(
          text: widget.word.content != widget.word.wordInPhrase ? "\n" + widget.word.wordInPhrase + "  =  " + widget.word.transInPhrase : "" ,
          style: TextStyle(
              color: Colors.transparent,
              decoration: TextDecoration.underline,
              decorationThickness: 2.0,
              decorationColor: Theme.of(context).textTheme.headline1!.color!,
              decorationStyle: TextDecorationStyle.solid,
              shadows: const [BoxShadow(color: Colors.transparent)]
          ),
        ),
        TextSpan(
          text: widget.word.content != widget.word.wordInPhrase ? "\n" + widget.word.wordInPhrase + "  =  " + widget.word.transInPhrase : "" ,
          style: TextStyle(
            height: 2.0,
            color: Theme.of(context).textTheme.headline1!.color!,
            decorationThickness: 0.0,
            shadows: const [BoxShadow(color: Colors.transparent)]
          ),
        ),
      ],
      style: TextStyle(
        color: Theme.of(context).textTheme.headline1!.color!,
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
        decorationColor:  Theme.of(context).textTheme.headline2!.color!,
        shadows: [BoxShadow(color: Theme.of(context).textTheme.headline2!.color!, offset: const Offset(0, -5))],
    ),
      ),
    )
    );
  }
}
