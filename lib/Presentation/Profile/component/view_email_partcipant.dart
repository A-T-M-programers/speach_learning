import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileBloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileState.dart';
import 'package:speach_learning/core/utils/enums.dart';

class ViewEmailParticipant extends StatelessWidget {
  const ViewEmailParticipant({Key? key}) : super(key: key);

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
                   .headlineSmall!
                   .color),
         );
        case RequestState.loaded:
          return Text(
            state.participants!.email,
            style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .color,
            fontSize: 14),
          );
        case RequestState.error:
          return Text(
            "Error in email",
            style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .color),
          );
      }
    });
  }
}
