import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Home/component/all_sections_view_component.dart';
import 'package:speach_learning/Presentation/Home/component/view_domain_mark.dart';
import 'package:speach_learning/Presentation/Home/component/view_study_lang.dart';
import 'package:speach_learning/Presentation/Home/controler/home_bloc.dart';
import 'package:speach_learning/Presentation/Home/controler/home_event.dart';
import 'package:speach_learning/Presentation/Home/controler/home_state.dart';
import 'package:speach_learning/Presentation/LoadingPage/Ui/loading_page.dart';
import 'package:speach_learning/Presentation/LogIn/UI/log_in.dart';
import 'package:speach_learning/Presentation/LogIn/controler/log_in_bloc.dart';
import 'package:speach_learning/core/error/ui_error.dart';
import 'package:speach_learning/core/global/static/static_variable.dart';
import 'package:speach_learning/core/utils/enums.dart';

// ignore: camel_case_types, must_be_immutable
class home_page extends StatelessWidget {
  home_page({Key? key}) : super(key: key);

  // ignore: prefer_const_constructors
  Size size = Size(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) => previous.requestState != current.requestState,
        builder: (context, state) {
          switch (state.requestState) {
            case RequestState.loading:
              return const LoadingPage();
            case RequestState.loaded:
              return Scaffold(
                appBar: AppBar(
                  backgroundColor:
                  Theme.of(context).appBarTheme.backgroundColor,
                  leading: Column(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        height: 40,
                        padding: const EdgeInsets.only(top: 4.0),
                        margin: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: const Icon(
                          Icons.bookmark_rounded,
                          size: 40,
                          shadows: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 6.0,
                              blurStyle: BlurStyle.inner,
                            )
                          ],
                        ),
                      ),
                      const Expanded(child: ViewDomainMark()),
                    ],
                  ),
                  actions: [
                    Row(
                      children: [
                        const ViewStudyLang(),
                        Container(
                          height: 28.0,
                          width: 28.0,
                          margin:
                          const EdgeInsets.only(right: 5.0, left: 5.0),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    "assets/icon/United_States(US).png",
                                  ))),
                        )
                      ],
                    )
                  ],
                ),
                body: !(state.requestState == RequestState.loaded && state.allSections.isEmpty) ?
                const AllSectionsViewComponent()
                    : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("unregister",style: TextStyle(color: Theme.of(context).textTheme.headlineSmall!.color),).tr(),
                        IconButton(
                            onPressed: (){
                                context.read<HomeBloc>().add(GetAllSectionsEvent(idParticipant: StaticVariable.participants.id));
                            }, icon: Icon(Icons.refresh,size: 50.0,color: Theme.of(context).textTheme.headlineSmall!.color!,))
                      ],)),
              );
            case RequestState.error:
              return UiError(
                message: state.error.message,
                retry: () {
                  switch(state.error.stateCode){
                    case 404:
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (route) => log_in()), (route) => false);
                      break;
                      default:
                      if(state.participantId == 0){
                        context.read<LogInBloc>().add(GetParticipantIdEvent());
                      }else {
                        context.read<HomeBloc>().add(GetAllSectionsEvent(idParticipant: state.participantId));
                        context.read<HomeBloc>().add(GetParticipantDomainEvent(idLang: state.participantId));
                      }
                      break;
                  }
                },
                close: (){
                  if(Platform.isAndroid) {
                    SystemNavigator.pop();
                  }else if(Platform.isIOS){
                    exit(0);
                  }
                },
              );
          }
        });
  }

}