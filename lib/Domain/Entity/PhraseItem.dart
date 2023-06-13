import 'package:speach_learning/Domain/Entity/Word.dart';

class PhraseItem{
  final int id;

  final String content;

  final String translation;

  final String type;
  void setType(String status){
    type.replaceAll(type, status);
  }

  final int wordCount;

  final int idLevel;

  final int order;

  final List<Word> listWord;

  const PhraseItem({
    this.id = 0,
    this.type = "",
    this.listWord = const [],
    this.idLevel = 0,
    this.order = 0,
    this.wordCount = 0,
    this.content = "",
    this.translation = ""
});

  PhraseItem cobyPhraseItem(){
    return PhraseItem(
      id: id,
      type: type,
      listWord:List.generate(listWord.length, (index) => Word(
          id: listWord[index].id,
          content: listWord[index].content,
          translation: listWord[index].translation,
          idPhrase: listWord[index].idPhrase,
          phraseWordId: listWord[index].phraseWordId,
          wordType: listWord[index].wordType,
          order: listWord[index].order)),
      idLevel: idLevel,
      order: order,
      wordCount: wordCount,
      content: content,
      translation: translation
    );
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