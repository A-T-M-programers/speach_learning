import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../controle/Text_To_Speech.dart';

// ignore: camel_case_types, must_be_immutable
class text_Word extends StatefulWidget {
  // ignore: non_constant_identifier_names
  text_Word({Key? key, this.text_read, required this.index, this.change_Language, this.lan}) : super(key: key);

  // ignore: non_constant_identifier_names
  List<Map<String, String>>? text_read;
  late int index;

  // ignore: non_constant_identifier_names
  String? change_Language;
  List<Map<String, String>>? lan;

  @override
  State<text_Word> createState() => _text_WordState();
}

// ignore: camel_case_types
class _text_WordState extends State<text_Word> {
  // ignore: non_constant_identifier_names
  Text_To_Speech text_to_speech = Text_To_Speech();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text_to_speech.initTts();
  }

  @override
  void dispose() {
    text_to_speech.stop();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10.0),
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text.rich(
              TextSpan(
                text: widget.text_read![widget.index]["Name"]!,
                recognizer: TapGestureRecognizer()
                  ..onTap = () => text_to_speech.speak(
                      widget.text_read![widget.index]["Name"]!,
                      widget.change_Language == "English(US)"
                          ? widget.lan!.first
                          : widget.lan!.last),
                mouseCursor: MaterialStateMouseCursor.clickable,
                style: TextStyle(
                    color: Colors.transparent,
                    decorationThickness: 3,
                    decorationStyle: TextDecorationStyle.dashed,
                    decoration: TextDecoration.underline,
                    decorationColor:
                        widget.text_read![widget.index]["type"] == "1"
                            ? Colors.green
                            : widget.text_read![widget.index]["type"] == "0"
                                ? Colors.red
                                : widget.text_read![widget.index]["type"] == "2"
                                    ? Colors.black
                                    : Colors.blue,
                    shadows: [
                      BoxShadow(
                          color: widget.text_read![widget.index]["type"] == "1"
                              ? Colors.green
                              : widget.text_read![widget.index]["type"] == "0"
                                  ? Colors.red
                                  : widget.text_read![widget.index]["type"] ==
                                          "2"
                                      ? Colors.black
                                      : Colors.blue,
                          offset: const Offset(0, -10))
                    ]),
              ),
            )));
  }
}
