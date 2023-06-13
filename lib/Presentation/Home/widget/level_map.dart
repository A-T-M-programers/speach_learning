import 'package:flutter/material.dart';
import 'package:speach_learning/Presentation/Home/widget/ToolTipButtonLevel.dart';
import 'package:speach_learning/Domain/Entity/Level.dart';

// ignore: must_be_immutable
class LevelMap extends StatelessWidget {
  LevelMap({Key? key, required this.listLevel, required this.rightOut})
      : super(key: key);
  final List<Level> listLevel;
  bool rightOut;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getListLevelButtonMap(context),
    );
  }

  List<Widget> getListLevelButtonMap(BuildContext context) {
    List<Widget> list = [];
    double width = 0.1;
    for (var level in listLevel) {
      if (rightOut) {
        if (listLevel.length <= 1) {
          list.add(Align(alignment: const Alignment(0, 0), child: ToolTipButtonLevel(level: level)));
          return list;
        } else {
          list.add(Container(
              alignment: Alignment(width,0.0),
              child: ToolTipButtonLevel(level: level)));
          width = width + 0.1;
          for (int i = 0; i < 5 && level != listLevel.last; i++) {
            list.add(Container(
              alignment:Alignment(width,0.0),
              child: Container(
                margin: const EdgeInsets.only(top: 3.0),
                height: 5.0,
                width: 5.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: level.getColor(context)),
              ),
            ));
            width = width + 0.03;
          }
          if(width > 0.6){
            rightOut = false;
          }
          width = width + 0.1;
        }
      } else {
        if (listLevel.length <= 1) {
          // ignore: prefer_const_constructors
          list.add(Align(
              alignment: const Alignment(0, 0),
              child: ToolTipButtonLevel(level: level)));
          return list;
        } else {
          list.add(Align(
              alignment: Alignment(width,0.0),
              child: ToolTipButtonLevel(level: level)));
          width = width - 0.1;
          for (int i = 0; i < 5 && level != listLevel.last; i++) {
            list.add(Container(
              alignment: Alignment(width,0.0),
              child: Container(
                margin: const EdgeInsets.only(top: 3.0),
                height: 5.0,
                width: 5.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: level.getColor(context)),
              ),
            ));
            width = width - 0.03;
          }
          if(-width > 0.5 ){
            rightOut = true;
          }
          width = width - 0.1;
        }
      }
    }
    return list;
  }
}
