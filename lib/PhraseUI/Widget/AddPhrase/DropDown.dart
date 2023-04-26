import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/PhraseUI/bloc/BlocAddPhrase.dart';
import 'package:speach_learning/Process_Class/WordOrPhraseType.dart';

// ignore: must_be_immutable
class DropDownCustom extends StatelessWidget {
  DropDownCustom({Key? key,required this.listDropDown,required this.nameThis,this.idSelected,this.indexItem}) : super(key: key);

  List<WordOrPhraseType> listDropDown;
  String? idSelected;
  int? indexItem;
  String nameThis;

  @override
  Widget build(BuildContext context) {
    return  DropdownButton(
      hint: BlocBuilder<BlocAddPhrase,Map>(
          buildWhen: (previos,next){
            if(previos != next){
              if(next.containsKey("Select-Type")) {
                if(next["Select-Type"].containsKey(nameThis)) {
                  if(next["Select-Type"][nameThis] != null && next["Select-Type"]["Index-Item"] == indexItem) {
                      idSelected = next["Select-Type"][nameThis];
                  }
                }
              }
              return true;
            }else{
              return false;
            }
          },
          builder: (bcc,state){
      return Text(context.locale == const Locale("en")? listDropDown.firstWhere((element) => element.id == idSelected,orElse: () => listDropDown.first).content : listDropDown.firstWhere((element) => element.id == idSelected,orElse: () => listDropDown.first).trans,style: TextStyle(color: Theme.of(context).textTheme.headline2!.color),);}),
      borderRadius: BorderRadius.circular(20.0),
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
        items: List.generate(listDropDown.length, (index) => DropdownMenuItem(
          value: listDropDown[index].id,
            child: Text(context.locale == const Locale("en")? listDropDown[index].content : listDropDown[index].trans,style: TextStyle(color: Theme.of(context).textTheme.headline2!.color)))),
        onChanged: (value){
        if(value != null){
          context.read<BlocAddPhrase>().changeState({"Select-Type":{nameThis:value,"Index-Item":indexItem}});
        }
    });
  }
}
