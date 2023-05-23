import 'package:flutter/material.dart';
import 'package:speach_learning/Domain/Entity/Domains.dart';

import 'level_map.dart';

class ContainerLevel extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ContainerLevel({Key? key,required this.section,required this.idParticipant}) : super(key: key);
  final int idParticipant;
  final Domains section;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     ListTile(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),borderSide: BorderSide(color: Theme.of(context).textTheme.headline3!.color!,width: 0.5)),
      tileColor: section.getColor(context),
      textColor: Theme.of(context).textTheme.headline2!.color,
      title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(section.title)),
      subtitle:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(section.description)),
    ),
        SizedBox(height: section.listLevel.length * 130,child:LevelMap(idParticipant: idParticipant,listLevel: section.listLevel,rightOut: true,))
      ],
    );
  }
}
