import 'package:flutter/material.dart';
import 'package:speach_learning/Domain/Entity/Level.dart';

class Domains{
  final int id;

  final int order;

  final String title;


  final String description;


  final List<Level> listLevel;

  final String key;

  final int domainLanguage;

  final String type;

  Domains({
    this.id = 0,
    this.order = 0,
    this.title = "",
    this.description = "",
    this.type = "",
    this.key = "en",
    this.listLevel =const [],
    this.domainLanguage = 1,
  });

  Color getColor(BuildContext context){
    switch(type){
      case "S": return Colors.blue.withOpacity(0.7);
      case "X": return Colors.amberAccent;
      case "C": return Colors.green.withOpacity(0.7);
      default: return Theme.of(context).appBarTheme.backgroundColor!;
    }
  }
}