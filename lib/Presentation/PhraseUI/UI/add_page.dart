import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/LoadingPage/Ui/loading_page.dart';
import 'package:speach_learning/Presentation/PhraseUI/Widget/Add_Page/ListPhraseItem.dart';
import 'package:speach_learning/Presentation/PhraseUI/Widget/Add_Page/SearchBar.dart';
import 'package:speach_learning/Presentation/PhraseUI/bloc/BlocShowCheckBox.dart';
import 'package:speach_learning/Presentation/PhraseUI/controler/phrase_bloc.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/Presentation/SplashScreen/UI/Splash_Screen.dart';
import 'package:speach_learning/Domain/Entity/PhraseItem.dart';
import 'package:speach_learning/core/error/ui_error.dart';
import 'package:speach_learning/core/utils/enums.dart';

// ignore: camel_case_types, must_be_immutable
class add_page extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  add_page({Key? key,required this.idParticipant,required this.idLevel}) : super(key: key);

  final int idLevel,idParticipant;
  Size size = const Size(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BlocBuilder<PhraseBloc,PhraseState>(
        buildWhen: (previous, current) => previous.requestState != current.requestState,
        builder: (context,state){
          switch (state.requestState) {
            case RequestState.loading:
              return const LoadingPage();
            case RequestState.loaded:
              if(state.level.listPhraseItem.isNotEmpty){
                if(state.level.listPhraseItem[0].type == ""){
                  context.read<PhraseBloc>().add(SetPhraseStateEvent(idParticipant, state.level.listPhraseItem[0].id, "S"));
                }
                if(state.level.listPhraseItem[0].listWord.isNotEmpty){
                  if(state.level.listPhraseItem[0].listWord[0].status == ""){
                    context.read<ReadBloc>().add(SetWordStateEvent(state.level.listPhraseItem[0].listWord[0].id, "S", idParticipant));
                  }else{
                    context.read<ReadBloc>().add(const EmptyEvent());
                  }
                }
              }
              return Scaffold(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  appBar: AppBar(
                    backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                    actions: const [SearchBar()],
                  ),
                  body: SizedBox(
                    height: size.height - 40,
                    child: Stack(
                      children: <Widget>[
                        // ignore: prefer_const_literals_to_create_immutables
                        Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(start: 0.0, end: 0.0),
                            child: BlocBuilder<BlocUpdateShowListPhrase,List<PhraseItem>?>(
                                buildWhen: (previos,next){
                                  if(previos != next){
                                    if(next != null){
                                      // widget.level.setListPhrase(next);
                                      return true;
                                    }
                                    return false;
                                  }else{
                                    return false;
                                  }
                                },
                                builder: (context,state) =>
                                //   BlocBuilder<BlocPhraseManage,Map>(
                                // buildWhen: (previos,next){
                                //   try {
                                //     if (previos != next) {
                                //       if (next.containsKey("Delete")) {
                                //         widget.level.listPhraseItem.removeWhere((element) => element.iD == next["Delete"]["id-Phrase"]);
                                //         return true;
                                //       }
                                //       return false;
                                //     } else {
                                //       return false;
                                //     }
                                //   }catch(e){
                                //     print("Error in Phrase Manage in add_page Page ===>" + e.toString());
                                //     return false;
                                //   }
                                // },
                                //   builder: (bc,manage)=>
                                SingleChildScrollView(
                                  child: ListPhraseItem(idParticipant: idParticipant,),
                                ))),
                        Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(size: size.height * 0.15, start: 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).appBarTheme.backgroundColor,
                                  border: Border.all(
                                      width: 1.0,
                                      color:
                                      Theme.of(context).appBarTheme.backgroundColor!),
                                ),
                              ),
                            ),
                            SafeArea(
                                child: Pinned.fromPins(Pin(start: 0.0, end: 0.0),
                                    Pin(size: 143.0, start: (size.height * 0.15) - 70),
                                    child: get_svg_top_navbar(size.width, context))),
                          ],
                        ),
                        Pinned.fromPins(
                          Pin(start: 48.5, end: 48.5),
                          Pin(size: 35.5, start: size.height * 0.08),
                          child: Stack(
                            children: <Widget>[
                              Pinned.fromPins(
                                Pin(size: size.width * 0.8, start: 31.5),
                                Pin(size: 60.0, start: 0.0),
                                child:  Text(
                                  "choosephrase",
                                  style: TextStyle(
                                      fontSize: (size.height + size.width) * 0.017,
                                      color: const Color(0xffdcdcdc)),
                                  textAlign: TextAlign.center,
                                ).tr(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                  // floatingActionButton: Container(
                  //   margin: const EdgeInsets.only(bottom: 40.0, right: 10),
                  //   child: const ViewFloating(),
                  // )
              );
            case RequestState.error:
              return UiError(
                  message: state.error.message,
                  retry: (){
                    context.read<PhraseBloc>().add(GetLevelEvent(idLevel: idLevel, idParticipant: idParticipant));
                  },
                  close: (){
                    Navigator.pop(context);
                  });
          }
        });
  }
}
