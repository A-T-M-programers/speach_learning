import 'package:flutter/material.dart';
import 'package:speach_learning/Process_Class/WordOrPhraseType.dart';

class Word {
  late String _iD;
  String get id => _iD;

  late String _content;
  String get content => _content;

  late String _trans;
  String get trans => _trans;

  late int _phraseNumber;
  int get phraseNumber => _phraseNumber;

  late int _index;
  int get index => _index;

  late WordOrPhraseType _type;
  WordOrPhraseType get type => _type;
  void setType(WordOrPhraseType wordOrPhraseType){
    _type = wordOrPhraseType;
  }

  late String _wordInPhrase;
  String get wordInPhrase => _wordInPhrase;

  late String _transInPhrase;
  String get transInPhrase => _transInPhrase;

  late UWRB _uwrb;
  UWRB get uwrb => _uwrb;

  Word({Map? data}) {
    if(data != null) {
      _iD = data["id"];
      _content = data["Content"];
      _trans = data["Trans"];
      _index = data["Index"];
      _phraseNumber = data["PhraseNumber"];
      _type = data["Type"];
      _wordInPhrase = data["Word-In-Phrase"];
      _transInPhrase = data["Trans-In-Phrase"];
      _uwrb = data["UWRB"];
    }
  }

  Color getColorType(BuildContext context) {
    return uwrb.type == "1"
        ? Colors.green : uwrb.type == "0"
        ? Colors.red : uwrb.type == "3"
        ? Colors.blue : uwrb.type == "4"
        ? Colors.amberAccent : Theme.of(context).textTheme.headline2!.color!;
  }
}

class UWRB {

  late String _type;
  String get type => _type;

  void setType(String settype) {
    _type = settype;
  }

  UWRB({required Map data}) {
    _type = data["Type"];
  }
}
