import 'package:speach_learning/Domain/Entity/Dialects.dart';

class DialectModel extends Dialects{

  const DialectModel({
    required super.id,required super.locale,required super.key,required super.idLang
});
  factory DialectModel.fromJson(Map<String,dynamic> json) => DialectModel(
      id: json["id"], locale: json["locale"], key: json["key"], idLang: json["language_id"]);
}