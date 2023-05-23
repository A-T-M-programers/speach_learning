import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Home/controler/home_bloc.dart';
import 'package:speach_learning/Presentation/Home/controler/home_state.dart';
import 'package:speach_learning/core/utils/enums.dart';

class ViewDomainMark extends StatelessWidget {
  const ViewDomainMark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previos, current) => previos.requestState != current.requestState,
        builder: (context, state) {
          switch (state.requestState) {
            case RequestState.loading:
              return const Text('0');
            case RequestState.loaded:
              return Text('${state.participantDomain.idDomain + 1}');
            case RequestState.error:
              return const Text('0');
          }
        });
  }
}
