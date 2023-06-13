import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Domain/Entity/PhraseItem.dart';
import 'package:speach_learning/Domain/Entity/Word.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/Presentation/Read/controler/voice_bloc.dart';
import 'package:speach_learning/core/global/static/static_methode.dart';
import 'package:speach_learning/core/global/static/static_variable.dart';
import 'package:speach_learning/core/services/services_locator.dart';
import 'package:speach_learning/core/utils/enums.dart';
import '../controle/Text_To_Speech.dart';
import 'AlertWord.dart';
import 'ToolTipMessage.dart';

// ignore: camel_case_types, must_be_immutable
class text_Word extends StatelessWidget {
  text_Word(
      {Key? key,
      required this.word,
      this.nextWord,
      required this.index,
        required this.phraseItem,
        required this.conceptPhraseItem
      }) : super(key: key);

  Word word;
  Word? nextWord;
  late int index;
  final PhraseItem phraseItem,conceptPhraseItem;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 8.0),
        height: 30.0,
        padding: const EdgeInsets.only(top: 7.0),
        child:BlocBuilder<ReadBloc,ReadState>(
                  buildWhen: (previous, current){
                      switch(current.readPageStateBuild){
                        case ReadPageStateBuild.main:
                          return true;
                        case ReadPageStateBuild.level1:
                          return true;
                        case ReadPageStateBuild.level2:
                          return true;
                        case ReadPageStateBuild.level3:
                          return true;
                        case ReadPageStateBuild.level4:
                          return false;
                      }
                  },
                  builder: (context,stateRead){
                switch(stateRead.requestState){
                  case RequestState.loading:
                    return const SizedBox();
                  case RequestState.loaded:
                    return BlocBuilder<VoiceBloc,VoiceState>(
                      buildWhen: (previous, current) {
                        if(previous.requestState != current.requestState){
                          if(current is ChangeColorWordState){
                            if(word.phraseWordId == current.idWord){
                              word.setState(current.state);
                              return true;
                            }
                          }
                        }
                        return false;
                      },
                        builder: (context, state) {
                      return Tooltip(
                        verticalOffset: 7.0,
                        padding:const EdgeInsets.only(top: 15.0,right: 15.0,left: 15.0),
                          textAlign: TextAlign.center,
                          showDuration: const Duration(seconds: 5),
                          triggerMode: TooltipTriggerMode.tap,
                          preferBelow: false,
                          enableFeedback: true,
                          richMessage: ToolTipMessage.buildtextSpan(context,word),
                          onTriggered: () {
                            if (word.status == "F" || word.status == "S" || word.status == "X") {
                              showDialog(context: context,builder:(BuildContext context) => AlertDialogShowWord(phraseItem: phraseItem,word: word,nextWord: nextWord,conceptPhraseItem: conceptPhraseItem,dialects: stateRead.listDialects.firstWhere((element) => element.id == StaticVariable.participants.idDialects),));
                            } else {
                              sl<TextToSpeech>().speak(word.content, stateRead.listDialects.firstWhere((element) => element.id == StaticVariable.participants.idDialects));
                            }
                          },
                          child: Text.rich(
                            TextSpan(
                              text: word.content,
                              mouseCursor: MaterialStateMouseCursor.clickable,
                              style: TextStyle(
                                  color: Colors.transparent,
                                  decorationThickness: 3,
                                  decorationStyle: TextDecorationStyle.dotted,
                                  decoration: TextDecoration.underline,
                                  decorationColor: GetColorByType.call(word.status, context),
                                  shadows: [
                                    BoxShadow(
                                        color: GetColorByType.call(word.status, context),
                                        offset: const Offset(0, -5))
                                  ]),
                            ),
                          ));
                    });
                  case RequestState.error:
                    return Text(stateRead.error.message,style: TextStyle(color: Theme.of(context).textTheme.headlineSmall!.color),);
                }
              }));
  }
}
