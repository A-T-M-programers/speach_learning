import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Home/controler/home_bloc.dart';
import 'package:speach_learning/Presentation/Home/controler/home_state.dart';
import 'package:speach_learning/core/utils/enums.dart';

class ViewDomainMarkProfile extends StatelessWidget {
  const ViewDomainMarkProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeState>(
        buildWhen: (previous, current) => previous.requestState != current.requestState,
        builder: (context,state) {
      switch(state.requestState){
        case RequestState.loading:
          return Text(
            '0',
            // ignore: prefer_const_constructors
            style: TextStyle(
              fontFamily: 'PMingLiU-ExtB',
              fontSize: 14,
              color: Theme.of(context).textTheme.headline2!.color,
            ),
            textAlign: TextAlign.center,
            softWrap: false,
          );
        case RequestState.loaded:
          return Text(
            '${state.participantDomain.idDomain + 1}',
            // ignore: prefer_const_constructors
            style: TextStyle(
              fontFamily: 'PMingLiU-ExtB',
              fontSize: 14,
              color: Theme.of(context).textTheme.headline2!.color,
            ),
            textAlign: TextAlign.center,
            softWrap: false,
          );
        case RequestState.error:
          return Text(
            '0',
            // ignore: prefer_const_constructors
            style: TextStyle(
              fontFamily: 'PMingLiU-ExtB',
              fontSize: 14,
              color: Theme.of(context).textTheme.headline2!.color,
            ),
            textAlign: TextAlign.center,
            softWrap: false,
          );
      }
    });
  }
}
