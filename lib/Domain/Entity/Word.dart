
class Word {
  final int id;

  final String content;

  final String translation;

  final int idPhrase;

  final int phraseWordId;

  final int order;

  final String wordType;

  String status;
  void setState(String state){
    status = state;
  }


  Word(
      {required this.id,
      required this.content,
      required this.translation,
      required this.idPhrase,
      required this.order,
        required this.wordType,
        required this.phraseWordId,
      this.status = ""});
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
