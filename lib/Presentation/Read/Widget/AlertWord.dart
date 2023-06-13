import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Domain/Entity/Dialects.dart';
import 'package:speach_learning/Domain/Entity/PhraseItem.dart';
import 'package:speach_learning/Domain/Entity/Word.dart';
import 'package:speach_learning/Presentation/Read/component/button_voice.dart';
import 'package:speach_learning/Presentation/Read/controle/Speech_To_Text.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/Presentation/Read/controler/voice_bloc.dart';
import 'package:speach_learning/core/global/static/static_methode.dart';
import 'package:speach_learning/core/global/static/static_variable.dart';

class AlertDialogShowWord extends StatelessWidget {
  // ignore: non_constant_identifier_names
  static SpeechToTextClass speechToTextClass = SpeechToTextClass();
  final Word word;
  final Word? nextWord;
  final PhraseItem phraseItem,conceptPhraseItem;
  final Dialects dialects;

  const AlertDialogShowWord({
    super.key,
    required this.phraseItem,
    required this.word,
    this.nextWord,
    required this.conceptPhraseItem,
    required this.dialects,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        elevation: 20.0,
        actions: [
          Stack(children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                        color:
                            Theme.of(context).textTheme.headlineSmall!.color!,
                        width: 3,
                        strokeAlign: BorderSide.strokeAlignOutside)),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15.0),
                        child: BlocBuilder<VoiceBloc, VoiceState>(
                            buildWhen: (previous, current) {
                          if (previous.requestState != current.requestState) {
                            if (current is ChangeColorWordState) {
                              // if (word.id == current.idWord) {
                              //   word.setState(current.state);
                              //   return true;
                              // }
                              return true;
                            }
                          }
                          return false;
                        }, builder: (context, state) {
                          return Column(children: [
                            Text(word.content,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: GetColorByType.call(
                                        word.status, context))),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(word.translation,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: GetColorByType.call(
                                        word.status, context))),
                          ]);
                        }),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: ButtonVoice(text: word.content,dialects: dialects,),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.amberAccent),
                          ),
                          child: Text(
                            "skip",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .color),
                          ).tr(),
                          onPressed: () {
                            if ((word.status == "S" || word.status == "F") && phraseItem.listWord.where((element) => element.status == "X").length < (phraseItem.listWord.length ~/ 3).toInt()) {
                              word.setState("X");
                              if(conceptPhraseItem.listWord.any((element) => element.phraseWordId == word.phraseWordId && element.status != "X" && element.status != "C")) {
                                context.read<ReadBloc>().add(SetWordStateEvent(word.phraseWordId, "X", StaticVariable.participants.id,0));
                              }
                              context.read<VoiceBloc>().add(SetWordStateDuringVoiceEvent(word.phraseWordId, "X"));
                              if (nextWord != null) {
                                nextWord!.setState("S");
                                if(conceptPhraseItem.listWord.any((element) => element.phraseWordId == word.phraseWordId && element.status != "X" && element.status != "C" && element.status != "S")) {
                                  context.read<ReadBloc>().add(SetWordStateEvent(nextWord!.phraseWordId, "S", StaticVariable.participants.id,0));
                                }
                                context.read<VoiceBloc>().add(SetWordStateDuringVoiceEvent(nextWord!.phraseWordId, "S"));
                              }
                            } else if (word.status == "X") {
                              if (nextWord != null) {
                                nextWord!.setState("S");
                                if(conceptPhraseItem.listWord.any((element) => element.phraseWordId == word.phraseWordId && element.status != "X" && element.status != "C" && element.status != "S")) {
                                  context.read<ReadBloc>().add(SetWordStateEvent(nextWord!.phraseWordId, "S", StaticVariable.participants.id,0));
                                }
                                context.read<VoiceBloc>().add(SetWordStateDuringVoiceEvent(nextWord!.phraseWordId, "S"));
                              }
                            } else {
                              if (phraseItem.listWord.where((element) => element.status == "X").length < (phraseItem.listWord.length ~/ 3).toInt()) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("notSkipped", style: TextStyle(color: Theme.of(context).textTheme.displaySmall!.color),).tr(), backgroundColor: Theme.of(context).dialogBackgroundColor,));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("exceeded", style: TextStyle(color: Theme.of(context).textTheme.displaySmall!.color),).tr(), backgroundColor: Theme.of(context).dialogBackgroundColor,));
                              }
                            }
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.greenAccent),
                          ),
                          child: Text("read", style: TextStyle(color: Theme.of(context).textTheme.headlineMedium!.color)).tr(),
                          onPressed: () {
                            speechToTextClass.initSpeechState();
                            speechToTextClass.startListening(phraseItem: conceptPhraseItem, word: word, nextWord: nextWord, context: context);
                          },
                        ),
                      ),
                    ],
                  ),
                )),
            IconButton(
              color: Colors.redAccent,
              icon: const Icon(Icons.clear_rounded),
              onPressed: () {
                try {
                  Navigator.pop(context);
                } catch (error) {
                  print(error);
                }
              },
            )
          ]),
        ]);
  }
}
