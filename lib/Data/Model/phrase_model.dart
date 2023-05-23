import 'package:speach_learning/Domain/Entity/PhraseItem.dart';

import 'word_model.dart';

class PhraseModel extends PhraseItem{

  PhraseModel({
    required super.id,
    required super.content,
    required super.type,
    required super.wordCount,
    required super.idLevel,
    required super.translation,
    super.listWord
});
  
  factory PhraseModel.fromJson(Map<String, dynamic> json,int idLevel) =>
      PhraseModel(
          id: json["id"],
          content: json["content"],
          type: json["status"] ?? "",
          wordCount: json["word_count"],
          idLevel: idLevel ,
          translation: json["translation"],
      listWord: json["words"] != null ? List.generate(json["words"].length, (index) => WordModel.fromJson(json["words"][index],json["id"])) : []
      );
}