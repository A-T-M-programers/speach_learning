import 'Word.dart';

class PhraseItem{
  late String _iD;
  String get iD => _iD;

  late String _type;
  String get type => _type;

  late int _index;
  int get index => _index;

  late int _count;
  int get count => _count;

  late String _idLevel;
  String get idLevel => _idLevel;

  late int _level;
  int get level => _level;

  late List<Word> _listWord;
  List<Word> get listWord => _listWord;

  late List<PWRB> _listPWRB;
  List<PWRB> get listPWRB => _listPWRB;

  late UPRB _uprb;
  UPRB get uprb => _uprb;

  PhraseItem({required Map data}){
    _iD = data["id"];
    _type = data["Type"];
    _index =data["Index"];
    _count = data["Word-Count"];
    _idLevel = data["id-Level"];
    _level = data["Level"];
    _listWord = data["List-Word"];
    _listPWRB = data["List-PWRB"];
    _uprb = data["UPRB"];
    _sortListWord();
  }

  void _sortListWord(){
    for(var element in listWord){
      PWRB index = listPWRB.firstWhere((pwrb) => pwrb.iDWord == element.id);
      Word temp = element;
      element = listWord[index.index];
      listWord[index.index] = temp;
    }
  }
  bool containWordById(String idWord){
    if(listWord.any((element) => element.id == idWord)){
      return true;
    }else{
      return false;
    }
  }
}
class PWRB{
  late String _iDPhrase;
  String get iDPhrase => _iDPhrase;

  late String _iDWord;
  String get iDWord => _iDWord;

  late int _index;
  int get index => _index;

  PWRB({required Map data}){
    _iDPhrase = data["id-Phrase"];
    _iDWord = data["id-Word"];
    _index = data["Index"];
  }
}
class UPRB{
  late String _idPhrase;
  String get idPhrase => _idPhrase;

  late String _type;
  String get type => _type;
  void setType(String type){
    _type = type;
  }

  UPRB({required Map data}){
    _idPhrase = data["id-Phrase"];
    _type = data["Type"];
  }
}