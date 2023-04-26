import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Domain/Entity/Domains.dart';
import 'package:speach_learning/Presentation/Home/controler/home_bloc.dart';
import 'package:speach_learning/Presentation/Home/controler/home_state.dart';
import 'package:speach_learning/Presentation/Home/widget/container_level.dart';
import 'package:speach_learning/core/utils/enums.dart';

// ignore: must_be_immutable
class AllSectionsViewComponent extends StatelessWidget {
  AllSectionsViewComponent({Key? key}) : super(key: key);

  // ignore: non_constant_identifier_names
  List<Domains> list_of_section = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            previous.requestState != current.requestState,
        builder: (context, state) {
          switch (state.requestState) {
            case RequestState.loading:
              return Center(
                  child: Text(
                "Loading...",
                style: TextStyle(
                    color: Theme.of(context).textTheme.headline2!.color),
              ));
            case RequestState.loaded:
              return ListView(
                  padding: const EdgeInsets.only(bottom: 100.0),
                  children: List.generate(
                      state.allSections.length,
                      (index) =>
                          ContainerLevel(section: state.allSections[index])));
            case RequestState.error:
              return Center(
                  child: Text(
                "Their is Error",
                style: TextStyle(
                    color: Theme.of(context).textTheme.headline2!.color),
              ));
          }
        });
  }
}
