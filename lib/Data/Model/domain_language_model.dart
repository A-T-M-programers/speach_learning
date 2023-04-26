import 'package:speach_learning/Domain/Entity/domain_language.dart';

class DomainLanguageModel extends DomainLanguage {
  const DomainLanguageModel(
      {required super.idDomain,
      required super.idLang,
      required super.titleTrans,
      required super.descriptionTrans});

  factory DomainLanguageModel.fromJson(Map<String, dynamic> json) =>
      DomainLanguageModel(
          idDomain: json["domain_id"],
          idLang: json["language_id"],
          titleTrans: json["title_trans"],
          descriptionTrans: json["description_trans"]);
}
