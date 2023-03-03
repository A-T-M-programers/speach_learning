import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Home/Bloc/BlocHome.dart';
import 'package:speach_learning/Home/widget/ToolTipButtonLevel.dart';
import 'package:speach_learning/Process_Class/Level.dart';
import 'package:speach_learning/Process_Class/User.dart';

class ButtonLevel extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ButtonLevel({Key? key, required this.level}) : super(key: key);

  final Level level;

  @override
  State<ButtonLevel> createState() => _ButtonLevelState();
}

class _ButtonLevelState extends State<ButtonLevel> {

  Size size = Size(0.0, 0.0);
  bool isSelected = false;
  Color isSelectedColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BlocListener<BlocSelectLevel, Map<String, dynamic>>(
        listener: (bc, state) {
          if (state["id-Level"] != null && state["Un-Select"] != null) {
            if(widget.level.id == state["id-Level"]){
              isSelected = false;
              setState(() {});
            }
          }
        },child: SizedBox(
        width: 60.0,
        height: 60.0,
        child: GestureDetector(
            onLongPress: (){
              if(User.typeUser == TypeUser.Admin) {
                isSelected = isSelected ? false : true;
                context.read<BlocSelectLevel>().changeSelect({"id-Level":widget.level.id,"is-Select":isSelected});
                setState(() {});
              }
            },
            child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(width: 5.0, color: Colors.white38),
              color: isSelected ? isSelectedColor : Colors.transparent
            ),
            child: ToolTipButtonLevel(level: widget.level,)))));
  }
}
