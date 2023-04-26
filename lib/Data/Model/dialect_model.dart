import 'package:speach_learning/Domain/Entity/Dialects.dart';
import 'package:speach_learning/Domain/Entity/Lang.dart';

class DialectModel extends Dialects{

  const DialectModel({
    required super.id,required super.locale,required super.key,required super.lang
});
  factory DialectModel.fromJson(Map<String,dynamic> json) => DialectModel(
      id: json["dialect_id"], locale: "" /*json["locale"]*/, key: "" /*json["key"]*/, lang: const Lang(id: 1,name: "") /*json["language_id"]*/);
}