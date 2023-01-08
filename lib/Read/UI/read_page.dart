import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/AlertDialog.dart';
import 'package:speach_learning/Read/UI/BottomSheet.dart';
import 'package:speach_learning/Read/UI/signal_Ui.dart';
import 'package:speach_learning/Read/Widget/SingleChildListTextView.dart';
import 'package:speach_learning/Read/controle/Speech_To_Text.dart';

import '../bloc/Bloc_Controler_Read.dart';

// ignore: camel_case_types, must_be_immutable
class read_page extends StatefulWidget{
  // ignore: non_constant_identifier_names
  read_page({Key? key, this.text_read}) : super(key: key);

  @override
  State<read_page> createState() => _read_pageState();

  // ignore: non_constant_identifier_names
  List<Map<String, String>>? text_read;
}

// ignore: camel_case_types
class _read_pageState extends State<read_page> with TickerProviderStateMixin{
  // ignore: non_constant_identifier_names

  // ignore: non_constant_identifier_names
  Speech_To_Text? speech_to_text;
  bool _isShowBottomSheet = false;
  int displayWords = 0;
  Size size = const Size(0.0, 0.0);

  // ignore: non_constant_identifier_names
  String change_Language = "English(US)";
  List<Map<String, String>> lan = [
    {"name": "en-us-x-tpf-local", "locale": "en-US"},
    {"name": "en-gb-x-gbd-local", "locale": "en-GB"}
  ];

  @override
  initState() {
    super.initState();
    speech_to_text = Speech_To_Text(text_read: widget.text_read, bc: context);
    speech_to_text!.initSpeechState();
    displayWords =
        widget.text_read!.length > 20 ? 20 : widget.text_read!.length;
  }

  @override
  void dispose() {
    speech_to_text = null;
    displayWords = 0;
    widget.text_read = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          actions: [
            Center(
                child: Container(
              width: size.width * 0.3,
              alignment: Alignment.centerLeft,
              child:
                  BlocBuilder<Bloc_increment, int>(buildWhen: (previos, next) {
                if (next != 0 && previos != next) {
                  return true;
                } else {
                  return false;
                }
              }, builder: (context, type) {
                if (type != 0) {
                  displayWords = type;
                }
                return Text(
                  "words".tr() + displayWords.toString(),
                  style: const TextStyle(color: Colors.white70),
                );
              }),
            )),
            const SizedBox(
              width: 30.0,
            ),
            Container(
                margin: const EdgeInsets.only(right: 20),
                height: 50.0,
                width: 135.0,
                child: BlocBuilder<Bloc_change_Language, dynamic>(
                    buildWhen: (previos, current) {
                  return current is String ? true : false;
                }, builder: (bc, type) {
                  return DropdownButton(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    dropdownColor: const Color(0xff888579),
                    style: const TextStyle(color: Colors.white70),
                    iconSize: 28,
                    value: type is String ? type : change_Language,
                    items: const [
                      DropdownMenuItem(
                          value: "English(US)",
                          child: Text("English(US)     ")),
                      DropdownMenuItem(
                          value: "English(UK)",
                          child: Text("English(UK)     ")),
                    ],
                    onChanged: (value) {
                      AlertDialogShow.showAlertDialog(context);
                      context
                          .read<Bloc_change_Language>()
                          .change_Language(value.toString());
                      change_Language = value.toString();
                      Future.delayed(
                          Duration(seconds: 1), () => Navigator.pop(context));
                    },
                  );
                })),
          ]),
      body: Stack(
        children: <Widget>[
          Center(
            heightFactor: 1,
            child: Container(
              height: size.height * 0.30,
              margin: const EdgeInsets.only(top: 18.0),
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.topCenter,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 8,
                      blurStyle: BlurStyle.outer,
                      color: Colors.black12)
                ],
                borderRadius: BorderRadius.circular(20),
                color: Colors.white38,
                border: Border.all(width: 0.0, color: Colors.white38),
              ),
              child: SingleChildListTextView(
                  text_read: widget.text_read,
                  lan: lan,
                  change_Language: change_Language),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 14 * (size.width * 0.05), start: size.width * 0.24),
            Pin(size: 84.0, end: 12.0),
            child: signal_Ui_controler(speech_to_text: speech_to_text),
          ),
          Pinned.fromPins(
            Pin(size: 45.0, start: 26.0),
            Pin(size: 45.0, end: 28.0),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffd4af37),
                      borderRadius: const BorderRadius.all(
                          Radius.elliptical(9999.0, 9999.0)),
                      border: Border.all(
                          width: 1.0, color: const Color(0xffd4af37)),
                      boxShadow: const [
                        BoxShadow(color: Colors.white70, blurRadius: 10)
                      ]),
                ),
                Center(
                    child: SizedBox(
                        width: 32.0,
                        height: 32.0,
                        child: BlocListener<Bloc_changeStateBottomSheet, bool>(
                            listenWhen: (previos, next) {
                              if (previos != next) {
                                return true;
                              } else {
                                return false;
                              }
                            },
                            listener: (context, type) {
                              _isShowBottomSheet = type;
                            },
                            child: BlocListener<Bloc_chang_color_Word, dynamic>(
                              listenWhen: (previos, next) {
                                if (next is Map<String, String> &&
                                    next["Problem"] != null &&
                                    previos != next) {
                                  return true;
                                } else {
                                  return false;
                                }
                              },
                              listener: (context, type) {
                                if (type is Map<String, String> && !_isShowBottomSheet) {
                                  if (type["Problem"] != null && type["Level"] != null && type["Level"] != "0") {
                                    AlertDialogShow.showAlertDialogNextLevel(context, type["Level"]!,this);
                                  }else if(type["Problem"] != null){
                                    BlocProvider.of<Bloc_changeStateBottomSheet>(context).changeStateBottomSheet(true);
                                    bottomSheet.showbottomsheet(this.context, type);
                                  }
                                }
                              },
                              child: IconButton(
                                  icon: const Icon(Icons.mic),
                                  onPressed: () {
                                    if(widget.text_read!.last["type"] != "1") {
                                      speech_to_text!.startListening();
                                    }else{
                                      BlocProvider.of<Bloc_changeStateBottomSheet>(context).changeStateBottomSheet(true);
                                      bottomSheet.showbottomsheet(this.context, {"Problem":"final"});
                                    }
                                  },
                                  color: Colors.white70,
                                  iconSize: 30,
                                  padding: const EdgeInsets.only(
                                      left: 1.0, top: 2.0),
                                ),
                              ),
                            ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
