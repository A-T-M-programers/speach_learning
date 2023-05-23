// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:speach_learning/Domain/Entity/Word.dart';

class ToolTipMessage{

  static TextSpan buildtextSpan(BuildContext context,Word word) {
    return TextSpan(
      text: word.content + "  =  " + word.translation,
      style: TextStyle(
        color: Theme.of(context).textTheme.headline1!.color!,
      ),
    );
  }
}
