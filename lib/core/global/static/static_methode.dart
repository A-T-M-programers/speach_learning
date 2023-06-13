import 'package:flutter/material.dart';

class GetColorByType {
  static Color call(String type, BuildContext context) {
    switch (type) {
      case "":
        return Theme.of(context).textTheme.headlineSmall!.color!;
      case "S":
        return Colors.blue;
      case "X":
        return Colors.amberAccent;
      case "F":
        return Colors.red;
      case "C":
        return Colors.green;
      default:
        return Colors.transparent;
    }
  }
}
class GetIconPhraseByType {
  static IconData? call(String type, BuildContext context) {
    switch (type) {
      case "":
        return Icons.lock_outline_rounded;
      case "X":
        return Icons.info;
      case "C":
        return Icons.task_alt_outlined;
      default:
        return null;
    }
  }
}
