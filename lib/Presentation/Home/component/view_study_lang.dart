import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Home/controler/home_bloc.dart';
import 'package:speach_learning/Presentation/Home/controler/home_state.dart';
import 'package:speach_learning/core/utils/enums.dart';

class ViewStudyLang extends StatelessWidget {
  const ViewStudyLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeState>(
        buildWhen: (previous, current) => previous.requestState != current.requestState,
        builder: (context, state) {
      switch(state.requestState){
        case RequestState.loading:
          return Container(
            margin: const EdgeInsets.only(right: 5.0, left: 5.0),
            child: const Text("EN",style: TextStyle(fontFamily: "RubikPuddles",fontWeight: FontWeight.w600),),
          );
        case RequestState.loaded:
          if(state.allSections.isNotEmpty){
            return Container(
              margin: const EdgeInsets.only(right: 5.0, left: 5.0),
              child: Text(state.allSections[0].key.toUpperCase(),style:const TextStyle(fontFamily: "RubikPuddles",fontWeight: FontWeight.w600)),
            );
          }
          return Container(
            margin: const EdgeInsets.only(right: 5.0, left: 5.0),
            child: const Text("EN",style: TextStyle(fontFamily: "RubikPuddles",fontWeight: FontWeight.w600),),
          );
        case RequestState.error:
          return Container(
            margin: const EdgeInsets.only(right: 5.0, left: 5.0),
            child: const Text("EN",style: TextStyle(fontFamily: "RubikPuddles",fontWeight: FontWeight.w600)),
          );
      }
    });
  }
}
