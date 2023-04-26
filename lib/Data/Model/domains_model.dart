import 'package:speach_learning/Data/Model/domain_language_model.dart';
import 'package:speach_learning/Domain/Entity/Domains.dart';
import 'package:speach_learning/Process_Class/Level.dart';

class DomainsModel extends Domains {
  DomainsModel({
    required super.id,
    required super.title,
    required super.description,
    required super.idLang,
    required super.listLevel,
    required super.domainLanguage,
  });

  factory DomainsModel.fromJson(Map<String, dynamic> json) =>
      DomainsModel(id: json["id"],
          title: json["title"],
          description: json["description"],
          idLang: json["language_id"],
          listLevel: List<Level>.from(json["listLevel"].map((e) => e)),
        domainLanguage: DomainLanguageModel.fromJson(json["domain_language"])
      );
}
