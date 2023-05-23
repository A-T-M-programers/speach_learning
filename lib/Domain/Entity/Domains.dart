import 'package:flutter/material.dart';
import 'package:speach_learning/Domain/Entity/Level.dart';

class Domains{
  final int id;

  final String title;


  final String description;


  final List<Level> listLevel;

  // final int idLang;

  final int domainLanguage;

  final String type;

  Domains({
    required this.id,
    required this.title,
    required this.description,
    this.type = "",
    // required this.idLang,
    required this.listLevel,
    this.domainLanguage = 1,
  });

  Color getColor(BuildContext context){
    switch(type){
      case "S": return Colors.blue;
      case "X": return Colors.amberAccent;
      case "C": return Colors.green.withOpacity(0.7);
      default: return Theme.of(context).appBarTheme.backgroundColor!;
    }
  }
}