import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Process_Class/Word.dart';
import 'package:speach_learning/Read/Widget/AlertWord.dart';
import 'package:speach_learning/Read/Widget/ToolTipMessage.dart';
import 'package:speach_learning/Read/bloc/Bloc_Controler_Read.dart';
import '../controle/Text_To_Speech.dart';

// ignore: camel_case_types, must_be_immutable
class text_Word extends StatefulWidget {
  // ignore: non_constant_identifier_names
  text_Word(
      {Key? key,
      // ignore: non_constant_identifier_names
      required this.word,
      this.nextWord,
      required this.index,
      // ignore: non_constant_identifier_names
      this.change_Language,
      this.lan,
      // ignore: non_constant_identifier_names
      this.text_to_speech})
      : super(key: key);

  // ignore: non_constant_identifier_names
  Word word;
  Word? nextWord;
  late int index;

  // ignore: non_constant_identifier_names
  Text_To_Speech? text_to_speech;

  // ignore: non_constant_identifier_names
  String? change_Language;
  List<Map<String, String>>? lan;

  @override
  State<text_Word> createState() => _text_WordState();
}

// ignore: camel_case_types
class _text_WordState extends State<text_Word> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<Bloc_chang_color_Word>().chang_color_Word({});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 8.0),
        height: 30.0,
        padding: const EdgeInsets.only(top: 7.0),
        child: BlocListener<Bloc_change_Language, String>(
            listener: (context, type) {
              widget.change_Language = type;
            },
            child: BlocBuilder<Bloc_chang_color_Word, Map<String, String>>(
                buildWhen: (previos, next) {
              if (next["id-Word"] == widget.word.id) {
                return true;
              } else {
                return false;
              }
            }, builder: (context, type) {
              if (type["id-Word"] == widget.word.id) {
                widget.word.uwrb.setType(type["type"]!);
                if (type["type"] == "4" && widget.nextWord != null) {
                  context.read<Bloc_chang_color_Word>().chang_color_Word({"id-Word":widget.nextWord!.id,"type":"3"});
                }
              }
              return Tooltip(
                  textAlign: TextAlign.center,
                  showDuration: const Duration(seconds: 5),
                  triggerMode: TooltipTriggerMode.tap,
                  preferBelow: false,
                  enableFeedback: true,
                  richMessage: ToolTipMessage.buildtextSpan(context,widget.word),
                  onTriggered: () {
                    if (widget.word.uwrb.type == "0" || widget.word.uwrb.type == "3" || widget.word.uwrb.type == "4") {
                      AlertDialogShowWord(
                          context, widget.word,widget.nextWord,
                          text_to_speech: widget.text_to_speech,
                          change_Language: widget.change_Language,
                          lan: widget.lan);
                    } else {
                      widget.text_to_speech!.speak(widget.word.content, widget.change_Language == "English(US)" ? widget.lan!.first : widget.lan!.last);
                    }
                  },
                  child: Text.rich(
                    TextSpan(
                      text: widget.word.content,
                      mouseCursor: MaterialStateMouseCursor.clickable,
                      style: TextStyle(
                          color: Colors.transparent,
                          decorationThickness: 3,
                          decorationStyle: TextDecorationStyle.dotted,
                          decoration: TextDecoration.underline,
                          decorationColor: widget.word.getColorType(context),
                          shadows: [
                            BoxShadow(
                                color: widget.word.getColorType(context),
                                offset: const Offset(0, -5))
                          ]),
                    ),
                  ));
            })));
  }
}
