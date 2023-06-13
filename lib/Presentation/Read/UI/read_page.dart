import'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Domain/Entity/Dialects.dart';
import 'package:speach_learning/Domain/Entity/PhraseItem.dart';
import 'package:speach_learning/Presentation/LoadingPage/Ui/loading_page.dart';
import 'package:speach_learning/Presentation/PhraseUI/controler/phrase_bloc.dart';
import 'package:speach_learning/Presentation/Read/Widget/BottomSheet.dart';
import 'package:speach_learning/Presentation/Read/component/button_mic.dart';
import 'package:speach_learning/Presentation/Read/component/button_next.dart';
import 'package:speach_learning/Presentation/Read/component/button_voice.dart';
import 'package:speach_learning/Presentation/Read/component/container_speech_text.dart';
import 'package:speach_learning/Presentation/Read/component/container_text.dart';
import 'package:speach_learning/Presentation/Read/component/drawer.dart';
import 'package:speach_learning/Presentation/Read/component/drop_down_language.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/core/error/ui_error.dart';
import 'package:speach_learning/Presentation/Read/Widget/SingleChildListTextView.dart';
import 'package:speach_learning/Presentation/Read/Widget/signal_Ui.dart';
import 'package:speach_learning/Presentation/Read/controle/Speech_To_Text.dart';
import 'package:speach_learning/core/global/static/static_variable.dart';
import 'package:speach_learning/core/utils/enums.dart';


// ignore: must_be_immutable
class ReadPage extends StatelessWidget {
  ReadPage({Key? key}) : super(key: key) {
    speechToText.initSpeechState();
  }

  PhraseItem currentPhraseItem = const PhraseItem();

  SpeechToTextClass speechToText = SpeechToTextClass();

  Size size = const Size(0.0, 0.0);
  IconData iconMic = Icons.mic;
  bool checkBottomSheetIsShow = false;

  void reStore(PhraseItem? phraseItem){
    if(phraseItem != null){
      currentPhraseItem = phraseItem.cobyPhraseItem();
      for (int i = 0; i < currentPhraseItem.listWord.length; i++) {
        if(i == 0){
          currentPhraseItem.listWord[i].setState("S");
        }else{
          currentPhraseItem.listWord[i].setState("");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BlocBuilder<ReadBloc, ReadState>(
        buildWhen: (previous, current) {
        switch (current.readPageStateBuild) {
          case ReadPageStateBuild.main:
            return true;
          case ReadPageStateBuild.level1:
            return true;
          case ReadPageStateBuild.level2:
            return false;
          case ReadPageStateBuild.level3:
            return false;
          case ReadPageStateBuild.level4:
            if(current.voiceError.isNotEmpty && !StaticVariable.isBottomSheetShow && current.requestState == RequestState.loaded) {
              bottomSheet.showbottomsheet(context, current.voiceError);
              StaticVariable.isBottomSheetShow = true;
            }
            return false;
      }
    }, builder: (contextBloc, state) {
      switch (state.requestState) {
        case RequestState.loading:
          return const LoadingPage();
        case RequestState.loaded:
          reStore(state.phraseItem);
          return WillPopScope(
              onWillPop: () async {
                if(state.phraseItem.idLevel != 0) {
                  context.read<PhraseBloc>().add(GetLevelEvent(idLevel: state.phraseItem.idLevel, idParticipant: StaticVariable.participants.id));
                }
                return true;
              },child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            drawer: Drawer(
              width: size.width * 0.35,
              backgroundColor: Theme.of(context).textTheme.displayMedium!.color,
              child: const DrawerMenuItemWord(),

            ),
            appBar: AppBar(
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                actions: [
                  Center(
                    child: Container(
                      width: size.width * 0.3,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "words".tr() + "${state.phraseItem.listWord.length}",
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  Container(
                      margin: const EdgeInsets.only(right: 20),
                      height: 50.0,
                      width: 135.0,
                      child: const DropDownLanguage()),
                ]),
            body: Stack(
              children: <Widget>[
                ContainerText(currentPhraseItem: currentPhraseItem,conceptPhraseItem: state.phraseItem),
                ContainerSpeechText(),
                Pinned.fromPins(
                    Pin(size: 45, end: 20.0), Pin(size: 45.0, end: 28.0),
                    child: ButtonVoice(text: state.phraseItem.content,dialects: state.listDialects.isNotEmpty ? state.listDialects.firstWhere((element) => element.id == StaticVariable.participants.idDialects) : const Dialects())),
                Pinned.fromPins(
                  Pin(size: 14 * (size.width * 0.05), middle: 0.6),
                  Pin(size: 84.0, end: 12.0),
                  child: const SignalUiControler(),
                ),
                 Pinned.fromPins(
                      Pin(size: 90.0, start: 20.0),
                      Pin(size: 120.0, end: 28.0),
                      child: Column(
                        textDirection: ui.TextDirection.ltr,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        ButtonNext(status:state.phraseItem.type),
                        20.ph,
                        ButtonMic(speechToText: speechToText,phraseItem:currentPhraseItem)
                      ])),
              ],
            ),
          ));
        case RequestState.error:
          return UiError(
              message: state.error.message,
              retry: () {
                if(state.phraseItem.id == 0) {
                  context.read<ReadBloc>().add(GetPhraseEvent(StaticVariable.participants.id, state.idCurrentPhrase));
                }
                if(state.listDialects.isEmpty){
                  context.read<ReadBloc>().add(const GetAllDialectEvent());
                }
              },
              close: () {
                Navigator.pop(context);
              });
      }
    });
  }
}
