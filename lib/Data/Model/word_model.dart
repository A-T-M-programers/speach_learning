import 'package:speach_learning/Domain/Entity/Word.dart';

class WordModel extends Word{

  WordModel({
    required super.id,
    required super.content,
    required super.translation,
    required super.idPhrase,
    required super.wordType,
    required super.order,
    required super.phraseWordId,
    required super.status
});

  factory WordModel.fromJson(Map<String,dynamic> json,int idPhrase) =>
      WordModel(
          id: json["word_id"]??0,
          content: json["content"]??"",
          translation: json["translation"]??"",
          idPhrase: idPhrase,
          phraseWordId: json["phrase_word_id"] ?? 0 ,
          wordType: json["word_type"] ?? "",
          status: json["status"] ?? "",
          order: json["order"] ?? 0);
}