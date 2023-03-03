import 'package:flutter/material.dart';
import 'package:speach_learning/Process_Class/PhraseItem.dart';

class Level{
  late String _id;
  String get id => _id;

  late String _content;
  String get content => _content;
  void setContent(String str){
    _content = str;
  }

  late String _transContent;
  String get transContent => _transContent;
  void setTransContent(String str){
    _transContent = str;
  }

  late String _idLan;
  String get idLan => _idLan;

  late int _index;
  int get index => _index;

  late int _phraseCount;
  int get phraseCount => _phraseCount;

  late String _type;
  String get type => _type;
  void setType(String str){
    _type = str;
  }

  late List<PhraseItem> _listPhraseItem;
  List<PhraseItem> get listPhraseItem => _listPhraseItem;

  Level({required Map data}){
    _id = data["id"];
    _idLan = data["id-Lan"];
    _content = data["Content"];
    _transContent = data["Trans-Content"];
    _index = data["Index"];
    _type = data["Type"];
    _phraseCount = data["Phrase-Count"];
    _listPhraseItem = data["List-Phrase-Item"];
    sortListPhraseItem();
  }
  Color getColor(BuildContext context){
    switch(type){
      case "start": return Theme.of(context).textTheme.headline2!.color!;
      case "skip": return Colors.amberAccent;
      case "complete": return Colors.green.withOpacity(0.7);
      default: return Colors.black.withOpacity(0.5);
    }
  }
  Color getIconColor(BuildContext context){
    switch(type){
      case "start": return Theme.of(context).textTheme.headline6!.color!;
      case "skip": return Colors.white;
      case "complete": return Colors.black.withOpacity(0.5);
      default: return Colors.grey.withOpacity(0.7);
    }
  }
  IconData getIcon(){
    switch(type){
      case "start": return Icons.star_purple500_outlined;
      case "skip": return Icons.error;
      case "complete": return Icons.check_circle_rounded;
      default: return Icons.lock_rounded;
    }
  }
  String getLUBR(){
    switch(type){
      case "start": return "start";
      case "skip": return "again";
      case "complete": return "again";
      default: return "lock";
    }
  }
  void sortListPhraseItem(){
    for(int i = 0 ; i < listPhraseItem.length; i++){
      for(int j = i + 1; j < listPhraseItem.length; j++) {
        if (listPhraseItem[j].index < listPhraseItem[i].index) {
          PhraseItem temp = listPhraseItem[j];
          listPhraseItem[j] = listPhraseItem[i];
          listPhraseItem[i] = temp;
        }
      }
    }
  }
}