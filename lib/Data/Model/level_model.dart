import 'package:speach_learning/Domain/Entity/Level.dart';

import 'phrase_model.dart';

class LevelModel extends Level {
  LevelModel(
      {required super.id,
      required super.title,
      required super.description,
      required super.phraseCount,
      required super.order,
      required super.type,
      super.listPhraseItem
      });

  factory LevelModel.fromJson(Map<String, dynamic> json) =>
      LevelModel(
          id: json["id"],
          title: json["title"],
          description: json["description"],
          phraseCount: json["phrase_count"],
          order: json["order"],
          type: json["status"] ?? "",
        listPhraseItem: json["phrases"] != null ? List.generate(json["phrases"].length, (index) => PhraseModel.fromJson(json["phrases"][index],json["id"])) : []
      );
}
