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

  late String _description;
  String get description => _description;

  late String _transDescription;
  String get transDescription => _transDescription;

  late String _transContent;
  String get transContent => _transContent;
  void setTransContent(String str){
    _transContent = str;
  }

  late int _idSection;
  int get idLan => _idSection;

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
  void setListPhrase(List<PhraseItem> list){
    _listPhraseItem = list;
  }

  Level({required Map data}){
    _id = data["id"];
    _idSection = data["id-Section"];
    _content = data["Content"];
    _transContent = data["Trans-Content"];
    _description = data["Description"];
    _transDescription = data["Trans-Description"];
    _index = data["Index"];
    _type = data["Type"];
    _phraseCount = data["Phrase-Count"];
    _listPhraseItem = data["List-Phrase-Item"];
    sortListPhraseItem();
  }
  Color getColor(BuildContext context){
    switch(type){
      case "start": return Colors.blue;
      case "skip": return Colors.amberAccent;
      case "complete": return Colors.green.withOpacity(0.7);
      default: return Theme.of(context).appBarTheme.backgroundColor!;
    }
  }
  Color getIconColor(BuildContext context){
    switch(type){
      case "start": return Colors.blue;
      case "skip": return Colors.white;
      case "complete": return Colors.green.withOpacity(0.7);
      default: return Theme.of(context).appBarTheme.backgroundColor!;
    }
  }
  IconData getIcon(){
    switch(type){
      case "start": return Icons.star_purple500_outlined;
      case "skip": return Icons.error;
      case "complete": return Icons.check;
      default: return Icons.lock_rounded;
    }
  }
  String getLUBR(){
    switch(type){
      case "start": return "start";
      case "skip": return "start";
      case "complete": return "start";
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