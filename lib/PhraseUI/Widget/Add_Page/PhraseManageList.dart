import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/PhraseUI/bloc/BlocShowCheckBox.dart';
import 'package:speach_learning/Process_Class/PhraseItem.dart';
import 'package:speach_learning/Read/Widget/SingleChildListTextView.dart';

// ignore: must_be_immutable
class PhraseManageList extends StatelessWidget {
  PhraseManageList({Key? key,required this.list}) : super(key: key);

  List<PhraseItem> list;
  Map<int,bool> listSelect = {};

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocShowCheckBox,Map<int, bool>>(
        builder: (bc, state) {
          if (state.isNotEmpty) {
            listSelect.addAll(state);
          //   countSelect = 0;
          //   for (var element in isSelect.keys) {
          //     if (element.id == state["id-Level"]) {
          //       isSelect[element] = state["is-Select"];
          //     }
          //     countSelect =
          //     isSelect[element]! ? countSelect + 1 : countSelect;
          //   }
          //   setState(() {});
          }
        return  Row(
          children: [
            listSelect.values.contains(true)
                ? Expanded(
                flex: 0,
                child: IconButton(
                  onPressed: () {
                    try {
                      // for (var element in isSelect.keys) {
                      //   if (isSelect[element]!) {
                      //     context.read<BlocSelectLevel>().changeUnSelect({"id-Level":element.id,"Un-Select":false});
                      //     listLevel.removeAt(listLevel.indexOf(element));
                      //   }
                      // }
                      // isSelect.removeWhere((key, value) => value);
                      // setState(() {});
                    }catch(e){
                      // ignore: avoid_print
                      print(e);
                    }
                  },
                  icon: const Icon(Icons.delete_rounded),
                )) : const SizedBox(),
            listSelect.values.contains(true)
                ? 10.pw : 0.0.pw,
            listSelect.values.contains(true)
                ? listSelect.length == 1
                ? Expanded(
                flex: 0,
                child: IconButton(
                  onPressed: () {
                    // Navigator.push(context,MaterialPageRoute(
                    //     builder: (route) =>
                    //         BlocProvider<Bloc_Add_Level>(
                    //           create: (BuildContext bc) =>
                    //               Bloc_Add_Level(),
                    //           // ignore: prefer_const_constructors
                    //           child: AddLevel(
                    //             listLevel: listLevel,
                    //             indexUpdate: listLevel.indexOf(isSelect.keys.firstWhere((element) => isSelect[element]!)),
                    //           ),
                    //         )) );
                  },
                  icon: const Icon(Icons.note_alt_rounded),
                ))
                : const SizedBox() : const SizedBox(),
            listSelect.values.contains(true)
                ? 10.pw : 0.0.pw,
            Expanded(
                flex: 0,
                child: IconButton(onPressed: (){

            },
                icon: const Icon(Icons.add_box_rounded),),
            )
          ],
        );
        });
  }
}
