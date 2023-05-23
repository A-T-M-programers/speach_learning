import 'package:speach_learning/Domain/Entity/Word.dart';

class PhraseItem{
  final int id;

  final String content;

  final String translation;

  final String type;

  final int wordCount;

  final int idLevel;

  final List<Word> listWord;


  PhraseItem(
      {required this.id,
      required this.content,
      required this.translation,
      required this.type,
      required this.wordCount,
      required this.idLevel,
        this.listWord = const []});

  // void _sortListWord(){
  //   for(var element in listWord){
  //     PWRB index = listPWRB.firstWhere((pwrb) => pwrb.iDWord == element.id);
  //     Word temp = element;
  //     element = listWord[index.index];
  //     listWord[index.index] = temp;
  //   }
  // }
  bool containWordById(String idWord){
    if(listWord.any((element) => element.id == idWord)){
      return true;
    }else{
      return false;
    }
  }
}
// class PWRB{
//   late String _iDPhrase;
//   String get iDPhrase => _iDPhrase;
//
//   late String _iDWord;
//   String get iDWord => _iDWord;
//
//   late int _index;
//   int get index => _index;
//
//   PWRB({required Map data}){
//     _iDPhrase = data["id-Phrase"];
//     _iDWord = data["id-Word"];
//     _index = data["Index"];
//   }
// }
// class UPRB{
//
//   late String _type;
//   String get type => _type;
//   void setType(String type){
//     _type = type;
//   }
//
//   UPRB({required Map data}){
//     _type = data["Type"];
//   }
// }