import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Read/Widget/AlertWord.dart';
import 'package:speach_learning/Presentation/Read/Widget/uiTextWord.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/core/global/static/static_methode.dart';
import 'package:speach_learning/core/global/static/static_variable.dart';
import 'package:speach_learning/core/utils/enums.dart';

class DrawerMenuItemWord extends StatelessWidget {
  const DrawerMenuItemWord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadBloc,ReadState>(
        buildWhen: (previous, current) => previous.requestState != current.requestState,
        builder: (context,state){
      switch(state.requestState){
        case RequestState.loading:
          return const SizedBox();
        case RequestState.loaded:
          return ListView.builder(
            padding:const EdgeInsets.only(top: 50.0,left: 20.0,right: 20.0),
              itemCount: state.phraseItem.listWord.length,
              itemBuilder: (context,index){
            return ListTile(
              title: text_Word(
                  word: state.phraseItem.listWord[index],
                  index: index,
                  phraseItem: state.phraseItem,
                  conceptPhraseItem: state.phraseItem),
            );
          });
        case RequestState.error:
          return Text(state.error.message,style: TextStyle(color: Theme.of(context).textTheme.headlineSmall!.color),).tr();
      }
    });
  }
}
