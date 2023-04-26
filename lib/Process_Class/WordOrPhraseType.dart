class WordOrPhraseType{
  late String _id;
  String get id =>_id;

  late String _content;
  String get content => _content;

  late String _trans;
  String get trans => _trans;

  WordOrPhraseType({Map? data}){
    if(data != null){
      _id = data["id"];
      _content = data["Content"];
      _trans = data["Trans"];
    }
  }
}