import 'package:flutter/material.dart';

class Word {
  final int id;

  final String content;

  final String translation;

  final int idPhrase;

  final int order;

  final String wordType;

  final String status;


  Word(
      {required this.id,
      required this.content,
      required this.translation,
      required this.idPhrase,
      required this.order,
        this.wordType = "",
      this.status = ""});

  Color getColorType(BuildContext context) {
    return status == "C"
        ? Colors.green : status == "F"
        ? Colors.red : status == "S"
        ? Colors.blue : status == "X"
        ? Colors.amberAccent : Theme.of(context).textTheme.headline2!.color!;
  }
}

// class UWRB {
//
//   late String _type;
//   String get type => _type;
//
//   void setType(String settype) {
//     _type = settype;
//   }
//
//   UWRB({required Map data}) {
//     _type = data["Type"];
//   }
// }
