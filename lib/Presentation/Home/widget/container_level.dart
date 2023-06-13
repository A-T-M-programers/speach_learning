import 'package:flutter/material.dart';
import 'package:speach_learning/Domain/Entity/Domains.dart';

import 'level_map.dart';

class ContainerLevel extends StatelessWidget {
  const ContainerLevel({Key? key,required this.section}) : super(key: key);
  final Domains section;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     Material(
       elevation: 10.0,
    color: Colors.transparent,
    shadowColor: Theme.of(context).textTheme.headlineLarge!.color,
    child: ListTile(
      shape: OutlineInputBorder(borderSide: BorderSide(strokeAlign: BorderSide.strokeAlignOutside,width: 0.5,color: Theme.of(context).inputDecorationTheme.border!.borderSide.color)),
      tileColor: section.getColor(context),
      textColor: Theme.of(context).textTheme.headlineSmall!.color,
      title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(section.title,style: TextStyle(fontFamily: "DancingScript",color: Theme.of(context).textTheme.headlineMedium!.color,fontSize: 24,fontWeight: FontWeight.w600))),
      subtitle:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(section.description,style: TextStyle(fontFamily: "Playfair",color: Theme.of(context).textTheme.headlineMedium!.color,fontSize: 16),)),
    )
     ),
        SizedBox(height: section.listLevel.length * 130,child:LevelMap(listLevel: section.listLevel,rightOut: true,))
      ],
    );
  }
}
