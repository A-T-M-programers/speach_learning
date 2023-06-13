import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:speach_learning/Domain/Entity/Word.dart';

class ToolTipMessage{

  static TextSpan buildtextSpan(BuildContext context,Word word) {
    return TextSpan(
      text: word.content + "  =  " + word.translation,
      children: [
        TextSpan(text: "\n${'type'.tr()}  =  " + word.wordType,style:const TextStyle(decoration: TextDecoration.none))
      ],
      style: TextStyle(
          shadows: [Shadow(
      color: Theme.of(context).textTheme.headlineMedium!.color!,
        offset:const Offset(0.0,-7.0)
    )],
        decoration: TextDecoration.underline,
        decorationThickness: 1.5,
        decorationColor: Theme.of(context).textTheme.headlineMedium!.color!,
        color: Colors.transparent,
      ),
    );
  }
}
