import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Process_Class/Word.dart';
import 'package:speach_learning/Read/bloc/Bloc_Controler_Read.dart';
import 'package:speach_learning/Read/controle/Speech_To_Text.dart';
import 'package:speach_learning/Read/controle/Text_To_Speech.dart';

class AlertDialogShowWord {
  // ignore: non_constant_identifier_names
  Text_To_Speech? text_to_speech;

  // ignore: non_constant_identifier_names
  Speech_To_Text? speech_to_text;

  // ignore: non_constant_identifier_names
  String? change_Language;
  List<Map<String, String>>? lan;

  // ignore: non_constant_identifier_names
  AlertDialogShowWord(BuildContext context, Word word, Word? nextWord,
      // ignore: non_constant_identifier_names
      {this.text_to_speech, this.change_Language, this.lan}) {
    // ignore: prefer_const_constructors
    AlertDialog alert = AlertDialog(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        elevation: 20.0,
        actions: [
          Stack(children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                        color: Theme.of(context).textTheme.headline2!.color!,
                        width: 3,
                        strokeAlign: StrokeAlign.outside)),
                child: Center(
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                  // ignore: prefer_const_literals_to_create_immutables
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 15.0),
                          child: BlocBuilder<Bloc_chang_color_Word,
                              Map<String, String>>(buildWhen: (previos, next) {
                            if (next["id-Word"] == word.id) {
                              return true;
                            } else {
                              return false;
                            }
                          }, builder: (context, type) {
                            if (type["id-Word"] == word.id) {
                              word.uwrb.setType(type["type"]!);
                            }
                            return Column(children: [
                              Text(word.content,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: word.getColorType(context))),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(word.trans,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: word.getColorType(context))),
                            ]);
                          }),
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color(0xffd4af37),
                              size: 35.0,
                            ),
                            onPressed: () {
                              text_to_speech!.speak(
                                  word.content,
                                  change_Language == "English(US)"
                                      ? lan!.first
                                      : lan!.last);
                            },
                          ),
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
                                      .headline1!
                                      .color),
                            ).tr(),
                            onPressed: () {
                              if(word.uwrb.type == "3" || word.uwrb.type == "0") {
                                context.read<Bloc_chang_color_Word>().chang_color_Word({"id-Word": word.id, "type": "4"});
                                context.read<Bloc_CheckLevel>().CheckLevel({"id-Word":word.id,"type":"1"});
                                Navigator.pop(context);
                              }
                              else if(word.uwrb.type == "4"){
                                Navigator.pop(context);
                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("notSkipped",style: TextStyle(color: Theme.of(context).textTheme.headline4!.color),).tr(),backgroundColor: Theme.of(context).dialogBackgroundColor,));
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
                            child: Text("read",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .color))
                                .tr(),
                            onPressed: () {
                              speech_to_text = Speech_To_Text(word: word, nextWord: nextWord, bc: context);
                              speech_to_text!.initSpeechState();
                              if (word.uwrb.type != "1") {
                                speech_to_text!.startListening();
                                if(word.uwrb.type == "1"){
                                  Navigator.pop(context);
                                }
                              } else {
                                speech_to_text!.startListening();
                                if(word.uwrb.type == "1"){
                                  Navigator.pop(context);
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ))),
            IconButton(
              color: Colors.redAccent,
              icon: const Icon(Icons.clear_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ]),
        ]);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
