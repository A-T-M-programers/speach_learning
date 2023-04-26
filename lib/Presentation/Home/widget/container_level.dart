import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:speach_learning/Domain/Entity/Domains.dart';

import 'level_map.dart';

class ContainerLevel extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ContainerLevel({Key? key,required this.section}) : super(key: key);

  final Domains section;

  @override
  State<ContainerLevel> createState() => _ContainerLevelState();
}

class _ContainerLevelState extends State<ContainerLevel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    ListTile(
      tileColor: Theme.of(context).appBarTheme.backgroundColor,
      textColor: Theme.of(context).textTheme.headline2!.color,
      // ignore: prefer_const_constructors
      title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(context.locale == const Locale("en") ? widget.section.title : widget.section.domainLanguage.titleTrans)),
      // ignore: prefer_const_constructors
      subtitle:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(context.locale == const Locale("en") ? widget.section.description : widget.section.domainLanguage.descriptionTrans)),
    ),
        SizedBox(height: widget.section.listLevel.length * 130,child:LevelMap(listLevel: widget.section.listLevel,rightOut: true,))
      ],
    );
  }
}
