import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Read/bloc/Bloc_Controler_Read.dart';
import '../controle/Text_To_Speech.dart';

// ignore: camel_case_types, must_be_immutable
class text_Word extends StatefulWidget {
  // ignore: non_constant_identifier_names
  text_Word(
      {Key? key,
      this.Map_Word,
      required this.index,
      this.change_Language,
      this.lan,
      this.text_to_speech})
      : super(key: key);

  // ignore: non_constant_identifier_names
  Map<String, String>? Map_Word;
  late int index;
  Text_To_Speech? text_to_speech;

  // ignore: non_constant_identifier_names
  String? change_Language;
  List<Map<String, String>>? lan;

  @override
  State<text_Word> createState() => _text_WordState();
}

// ignore: camel_case_types
class _text_WordState extends State<text_Word> {
  // ignore: non_constant_identifier_names

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
                  if (next["Name"] == widget.Map_Word!["Name"]) {
                    return true;
                  } else {
                    return false;
                  }
                },
                builder: (context, type) {
                  type["Name"] == widget.Map_Word!["Name"]
                      ? widget.Map_Word!["type"] = type["type"]!
                      : null;
                return Text.rich(
                  TextSpan(
                    text: widget.Map_Word!["Name"]!,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => widget.text_to_speech!.speak(
                          widget.Map_Word!["Name"]!,
                          widget.change_Language == "English(US)"
                              ? widget.lan!.first
                              : widget.lan!.last),
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    style: TextStyle(
                        color: Colors.transparent,
                        decorationThickness: 3,
                        decorationStyle: TextDecorationStyle.dotted,
                        decoration: TextDecoration.underline,
                        decorationColor: widget.Map_Word!["type"] == "1"
                            ? Colors.green
                            : widget.Map_Word!["type"] == "0"
                                ? Colors.red
                                : widget.Map_Word!["type"] == "2"
                                    ? Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .color!
                                    : Colors.blue,
                        shadows: [
                          BoxShadow(
                              color: widget.Map_Word!["type"] == "1"
                                  ? Colors.green
                                  : widget.Map_Word!["type"] == "0"
                                      ? Colors.red
                                      : widget.Map_Word!["type"] == "2"
                                          ? Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .color!
                                          : Colors.blue,
                              offset: const Offset(0, -5))
                        ]),
                  ),
                );})));
  }
}
