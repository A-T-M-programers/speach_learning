import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:speach_learning/Presentation/PhraseUI/controler/phrase_bloc.dart';
import 'package:speach_learning/Presentation/Read/Widget/BottomSheet.dart';
import 'package:speach_learning/core/global/static/get_error_details.dart';
import 'package:speach_learning/core/services/services_locator.dart';
import 'package:speach_learning/core/utils/enums.dart';

import 'ItemPhrase.dart';

// ignore: must_be_immutable
class ListPhraseItem extends StatelessWidget {
  ListPhraseItem({Key? key}) : super(key: key);

  // late bool listIsShowCheckBox = false;
  // late Map<int,bool> listIsSelected = {};

  Size size = const Size(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BlocBuilder<PhraseBloc,PhraseState>(
        buildWhen: (previous, current) => previous.requestState != current.requestState,
        builder: (context, state) {
            switch (state.requestState) {
              case RequestState.loading:
                return SizedBox(
                    height: size.height,
                    child: ListView.builder(
                        physics: const ScrollPhysics(),
                        padding:
                        EdgeInsets.only(top: (size.height * 0.15) + 85.5, bottom: 30.0),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                                height: 100.0,
                                width: size.width * 0.95,
                                color: Theme.of(context).textTheme.headlineSmall!.color,
                                child: ListTile(
                                  title: Container(
                                    height: 25.0,
                                    color: Theme.of(context).textTheme.headlineSmall!.color,
                                  ),
                                  trailing: Container(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).textTheme.headlineSmall!.color,
                                        borderRadius: BorderRadius.circular(25.0)
                                    ),
                                    height: 25.0,
                                    width: 25.0,
                                  ),
                                  leading: SizedBox(
                                      width: size.width * 0.1,
                                      child: Stack(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(bottom: 10.0),
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context).textTheme.headlineSmall!.color,
                                                  borderRadius: BorderRadius.circular(25.0)
                                              ),
                                              height: 25.0,
                                              width: 25.0,
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(top: 30.0),
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context).textTheme.headlineSmall!.color,
                                                  borderRadius: BorderRadius.circular(25.0)
                                              ),
                                              height: 25.0,
                                              width: 25.0,
                                            )
                                          ])),
                                  subtitle: Container(
                                    margin: const EdgeInsets.only(top: 15.0),
                                    width: size.width * 0.6,
                                    height: 25.0,
                                    color: Theme.of(context).textTheme.headlineSmall!.color,
                                  ),
                                ),
                              ),
                              baseColor: Theme.of(context).textTheme.headlineSmall!.color!,
                              highlightColor: Theme.of(context).textTheme.headlineLarge!.color!);
                        }));
              case RequestState.loaded:
                // if (listIsSelected.isEmpty) {
                //   listIsSelected = Map.fromIterables(List.generate(
                //       state.level.listPhraseItem.length, (index) => state.level
                //       .listPhraseItem[index].id), List.generate(
                //       state.level.listPhraseItem.length, (index) => false));
                // }
                return SizedBox(
                    height: size.height,
                    child: ListView(
                              physics: const ScrollPhysics(),
                              padding: EdgeInsets.only(top: (size.height * 0.15) + 85.5,
                                  bottom: 100.0),
                              shrinkWrap: true,
                              children: List.generate(
                                  state.listPhraseItem.length, (index) {
                                return state.listPhraseItem[index]
                                    .listWord.isNotEmpty ? ItemPhrase(
                                    phraseItem: state.listPhraseItem[index],
                                    index: index,
                                ) : const SizedBox();
                              }))
                      );
              case RequestState.error:
                bottomSheet.showbottomsheet(context, {"Problem": "err_network"});
                return Center(child: Icon(
                  sl<GetErrorDetails>().getIconError(state.error.dioErrorType),
                  size: 90, color: Theme
                    .of(context)
                    .textTheme
                    .headlineSmall!
                    .color!,));
            }
    });
  }
}
