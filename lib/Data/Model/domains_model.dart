import 'package:speach_learning/Domain/Entity/Domains.dart';

import 'level_model.dart';

class DomainsModel extends Domains {
  DomainsModel({
    required super.id,
    required super.title,
    required super.description,
    super.type,
    required super.listLevel,
    required super.domainLanguage,
  });

  factory DomainsModel.fromJson(Map<String, dynamic> json) =>
      DomainsModel(
          id: json["id"],
          title: json["title"],
          description: json["description"],
          type: json["status"] ?? "",
          listLevel: List<LevelModel>.from(json["levels"].map((e) => LevelModel.fromJson(e))),
        domainLanguage: json["language_id"] ?? 1,
      );
}
