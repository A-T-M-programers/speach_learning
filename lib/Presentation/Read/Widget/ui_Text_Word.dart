import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Domain/Entity/Word.dart';
import 'package:speach_learning/Presentation/Read/bloc/Bloc_Controler_Read.dart';
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
      this.changeLanguage,
      this.lan,
      this.textToSpeech,
        required BuildContext context
      })
      : super(key: key){
    context.read<Bloc_chang_color_Word>().chang_color_Word({});
  }

  Word word;
  Word? nextWord;
  late int index;

  Text_To_Speech? textToSpeech;

  String? changeLanguage;
  List<Map<String, String>>? lan;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 8.0),
        height: 30.0,
        padding: const EdgeInsets.only(top: 7.0),
        child: BlocListener<Bloc_change_Language, String>(
            listener: (context, type) {
              changeLanguage = type;
            },
            child: BlocBuilder<Bloc_chang_color_Word, Map<String, dynamic>>(
                buildWhen: (previos, next) {
              if (next["id-Word"] == word.id) {
                return true;
              } else {
                return false;
              }
            }, builder: (context, type) {
              if (type["id-Word"] == word.id) {
                // widget.word.uwrb.setType(type["type"]!);
                if (type["type"] == "X" && nextWord != null) {
                  context.read<Bloc_chang_color_Word>().chang_color_Word({"id-Word":nextWord!.id,"type":"S"});
                }
              }
              return Tooltip(
                  textAlign: TextAlign.center,
                  showDuration: const Duration(seconds: 5),
                  triggerMode: TooltipTriggerMode.tap,
                  preferBelow: false,
                  enableFeedback: true,
                  richMessage: ToolTipMessage.buildtextSpan(context,word),
                  onTriggered: () {
                    if (word.status == "F" || word.status == "S" || word.status == "X") {
                      AlertDialogShowWord(
                          context, word,nextWord,
                          text_to_speech: textToSpeech,
                          change_Language: changeLanguage,
                          lan: lan);
                    } else {
                      textToSpeech!.speak(word.content, changeLanguage == "English(US)" ? lan!.first : lan!.last);
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
                          decorationColor: word.getColorType(context),
                          shadows: [
                            BoxShadow(
                                color: word.getColorType(context),
                                offset: const Offset(0, -5))
                          ]),
                    ),
                  ));
            })));
  }
}
