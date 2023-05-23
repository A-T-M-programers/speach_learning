import 'package:flutter/material.dart';
import 'package:speach_learning/Domain/Entity/PhraseItem.dart';

class Level{
  final int id;

  final String title;

  final String description;

  final int phraseCount;

  final String type;

  final int order;

  final List<PhraseItem> listPhraseItem;


  const Level({
    required this.id,
    required this.title,
    required this.description,
    required this.phraseCount,
    required this.order,
    this.listPhraseItem = const [],
    this.type = ""});

  Color getColor(BuildContext context){
    switch(type){
      case "S": return Colors.blue;
      case "X": return Colors.amberAccent;
      case "C": return Colors.green.withOpacity(0.7);
      default: return Theme.of(context).appBarTheme.backgroundColor!;
    }
  }
  Color getIconColor(BuildContext context){
    switch(type){
      case "S": return Colors.blue;
      case "X": return Colors.white;
      case "C": return Colors.green.withOpacity(0.7);
      default: return Theme.of(context).appBarTheme.backgroundColor!;
    }
  }
  IconData getIcon(){
    switch(type){
      case "S": return Icons.star_purple500_outlined;
      case "X": return Icons.error;
      case "C": return Icons.check;
      default: return Icons.lock_rounded;
    }
  }
  String getLUBR(){
    switch(type){
      case "S": return "start";
      case "X": return "start";
      case "C": return "start";
      default: return "lock";
    }
  }
  // void sortListPhraseItem(){
  //   for(int i = 0 ; i < listPhraseItem.length; i++){
  //     for(int j = i + 1; j < listPhraseItem.length; j++) {
  //       if (listPhraseItem[j].index < listPhraseItem[i].index) {
  //         PhraseItem temp = listPhraseItem[j];
  //         listPhraseItem[j] = listPhraseItem[i];
  //         listPhraseItem[i] = temp;
  //       }
  //     }
  //   }
  // }
}