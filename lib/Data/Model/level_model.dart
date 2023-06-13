import 'package:speach_learning/Domain/Entity/Level.dart';

import 'phrase_model.dart';

class LevelModel extends Level {
  LevelModel(
      {required super.id,
      required super.title,
      required super.description,
      required super.phraseCount,
      required super.order,
        required super.idDomain,
      required super.type,
      super.listPhraseItem,
        super.successCount
      });

  factory LevelModel.fromJson(Map<String, dynamic> json) =>
      LevelModel(
          id: json["id"],
          title: json["title"],
          description: json["description"],
          phraseCount: json["phrase_count"],
          order: json["order"],
          idDomain: json["domain_id"] ?? 1,
          type: json["status"] ?? "",
          successCount: json["pastCount"] ?? 0,
        listPhraseItem: json["phrases"] != null ? List.generate(json["phrases"].length, (index) => PhraseModel.fromJson(json["phrases"][index])) : []
      );
}
