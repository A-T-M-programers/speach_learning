import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Home/controler/home_bloc.dart';
import 'package:speach_learning/Presentation/Home/controler/home_event.dart';
import 'package:speach_learning/Presentation/LoadingPage/Ui/loading_page.dart';
import 'package:speach_learning/Presentation/PhraseUI/Widget/Add_Page/ListPhraseItem.dart';
import 'package:speach_learning/Presentation/PhraseUI/Widget/Add_Page/SearchBar.dart';
import 'package:speach_learning/Presentation/PhraseUI/controler/phrase_bloc.dart';
import 'package:speach_learning/Presentation/SplashScreen/UI/Splash_Screen.dart';
import 'package:speach_learning/core/error/ui_error.dart';
import 'package:speach_learning/core/global/static/static_variable.dart';
import 'package:speach_learning/core/utils/enums.dart';

class PhrasesPage extends StatelessWidget {
  const PhrasesPage({Key? key,required this.idLevel}) : super(key: key);

  final int idLevel;
  static Size size = const Size(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BlocBuilder<PhraseBloc,PhraseState>(
        buildWhen: (previous, current) {
          print(current.requestState);
          return previous.requestState != current.requestState;
          },
        builder: (context,state){
          switch (state.requestState) {
            case RequestState.loading:
              return const LoadingPage();
            case RequestState.loaded:
              return WillPopScope(
                  onWillPop: () async {
                    context.read<HomeBloc>().add(GetAllSectionsEvent(idParticipant: StaticVariable.participants.id));
                    context.read<HomeBloc>().add(GetParticipantDomainEvent(idLang: StaticVariable.participants.id));
                    return true;
                  },
                  child: Scaffold(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  appBar: AppBar(
                    backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                    actions:const [MySearchBar()],
                  ),
                  body: SizedBox(
                    height: size.height - 40,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(start: 0.0, end: 0.0),
                            child: SingleChildScrollView(
                              padding:const EdgeInsets.only(bottom: 100.0),
                                  child: ListPhraseItem(),
                                )),
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
              ));
            case RequestState.error:
              return UiError(
                  message: state.error.message,
                  retry: (){
                    context.read<PhraseBloc>().add(GetLevelEvent(idLevel: idLevel, idParticipant: StaticVariable.participants.id));
                  },
                  close: (){
                    Navigator.pop(context);
                  });
          }
        });
  }
}
