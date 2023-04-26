import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Home/controler/home_bloc.dart';
import 'package:speach_learning/Presentation/Home/controler/home_state.dart';
import 'package:speach_learning/core/utils/enums.dart';

class ViewStudyLang extends StatelessWidget {
  const ViewStudyLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeState>(builder: (context, state) {
      switch(state.requestState){
        case RequestState.loading:
          return Container(
            margin: const EdgeInsets.only(right: 5.0, left: 5.0),
            child: const Text("EN"),
          );
        case RequestState.loaded:
          if(state.participants != null) {
            return Container(
              margin: const EdgeInsets.only(right: 5.0, left: 5.0),
              child: Text(state.participants!.dialects.lang.name.toUpperCase()
                  .substring(0, 2)),
            );
          }else{
            return Container(
              margin: const EdgeInsets.only(right: 5.0, left: 5.0),
              child: const Text("EN"),
            );
          }
        case RequestState.error:
          return Container(
            margin: const EdgeInsets.only(right: 5.0, left: 5.0),
            child: const Text("EN"),
          );
      }
    });
  }
}
