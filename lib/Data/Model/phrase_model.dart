import 'package:speach_learning/Domain/Entity/PhraseItem.dart';

import 'word_model.dart';

class PhraseModel extends PhraseItem{

  PhraseModel({
    required super.id,
    required super.content,
    required super.type,
    required super.wordCount,
    required super.idLevel,
    required super.order,
    required super.translation,
    super.listWord
});
  
  factory PhraseModel.fromJson(Map<String, dynamic> json) {
    List<WordModel> listWordModel = [];
    if(json["words"] != null) {
      listWordModel = List.generate(json["words"].length, (index) => WordModel.fromJson(json["words"][index], json["id"]));
      if(listWordModel.isNotEmpty) {
          listWordModel.sort((a, b) => a.order.compareTo(b.order));
      }
    }
     return PhraseModel(
          id: json["id"],
          content: json["content"],
          type: json["status"] ?? "",
          wordCount: json["word_count"],
          idLevel:  json["level_id"] ?? 0,
          order:  json["order"] ?? 1,
          translation: json["translation"],
      listWord: listWordModel
     );
  }
}