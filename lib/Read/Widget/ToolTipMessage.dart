// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:speach_learning/Process_Class/Word.dart';

class ToolTipMessage{

  static TextSpan buildtextSpan(BuildContext context,Word word) {
    return TextSpan(
      text: word.content + "  =  " + word.trans,
      children: [
        TextSpan(
          text: word.content != word.wordInPhrase ? "\n" + word.wordInPhrase + "  =  " + word.transInPhrase : "",
          style: TextStyle(
              color: Colors.transparent,
              decoration: TextDecoration.underline,
              decorationThickness: 2.0,
              decorationColor: Theme.of(context).textTheme.headline1!.color!,
              decorationStyle: TextDecorationStyle.solid,
              shadows: const [BoxShadow(color: Colors.transparent)]),
        ),
        TextSpan(
          text: word.content != word.wordInPhrase ? "\n" + word.wordInPhrase + "  =  " + word.transInPhrase : "",
          style: TextStyle(
              height: 2.0,
              color: Theme.of(context).textTheme.headline1!.color!,
              decorationThickness: 0.0,
              shadows: const [BoxShadow(color: Colors.transparent)]),
        ),
      ],
      style: TextStyle(
        color: Theme.of(context).textTheme.headline1!.color!,
      ),
    );
  }
}
