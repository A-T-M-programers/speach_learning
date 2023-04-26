import 'package:speach_learning/Domain/Entity/domain_language.dart';
import 'package:speach_learning/Process_Class/Level.dart';

class Domains{
  final int id;

  final String title;


  final String description;


  final List<Level> listLevel;

  final int idLang;

  final DomainLanguage domainLanguage;

  Domains({
    required this.id,
    required this.title,
    required this.description,
    required this.idLang,
    required this.listLevel,
    required this.domainLanguage,
  });
}