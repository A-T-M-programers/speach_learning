import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileBloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileState.dart';
import 'package:speach_learning/core/utils/enums.dart';

class ViewNameParticipant extends StatelessWidget {
  const ViewNameParticipant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc,ParticipantState>(
        buildWhen: (previos,current) => previos.requestState != current.requestState,
        builder: (context, state) {
      switch(state.requestState){
        case RequestState.loading:
          return Text(
            "Loading ...",
            style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .headline2!
                    .color),
          );
        case RequestState.loaded:
          return Text(
            state.participants!.name,
            style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .headline2!
                    .color),
          );
        case RequestState.error:
          return Text(
            "Error in name",
            style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .headline2!
                    .color),
          );
      }
    });
  }
}
