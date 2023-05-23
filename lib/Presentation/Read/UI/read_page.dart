import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/LoadingPage/Ui/loading_page.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/core/error/ui_error.dart';
import 'package:speach_learning/core/global/static/AlertDialog.dart';
import 'package:speach_learning/Domain/Entity/PhraseItem.dart';
import 'package:speach_learning/Presentation/Read/Widget/BottomSheet.dart';
import 'package:speach_learning/Presentation/Read/Widget/SingleChildListTextView.dart';
import 'package:speach_learning/Presentation/Read/Widget/signal_Ui.dart';
import 'package:speach_learning/Presentation/Read/controle/Speech_To_Text.dart';
import 'package:speach_learning/Presentation/Read/controle/Text_To_Speech.dart';
import 'package:speach_learning/core/utils/enums.dart';

import '../bloc/Bloc_Controler_Read.dart';

// ignore: camel_case_types, must_be_immutable
class read_page extends StatelessWidget{

  // ignore: non_constant_identifier_names
  read_page({Key? key,
    required this.idParticipant,
    required this.phraseItem,
    required BuildContext context
  }) : super(key: key){
    speech_to_text = Speech_To_Text(phraseItem: phraseItem, bc: context);
    speech_to_text!.initSpeechState();
    text_to_speech.initTts();
    // for (var element in listPhrase!) {
      count = phraseItem.listWord.length;
      for(var word in phraseItem.listWord){
        // if(phraseItem.indexOf(element) < 1) {
        switch(word.status){
          case "S":break;
          case "C":continue;
          case "X":continue;
          case "":

            break;
        }
        // }
      }
    // }
    displayWords = count > 20 ? 20 : count;
  }

  final PhraseItem phraseItem ;
  final int idParticipant;

  // ignore: non_constant_identifier_names
  Speech_To_Text? speech_to_text;
  // ignore: non_constant_identifier_names
  Text_To_Speech text_to_speech = Text_To_Speech();
  bool _isShowBottomSheet = false;
  int displayWords = 0,count = 0;
  Size size = const Size(0.0, 0.0);
  IconData iconMic = Icons.mic;

  // ignore: non_constant_identifier_names
  String change_Language = "English(US)";
  List<Map<String, String>> lan = [
    {"name": "en-us-x-tpf-local", "locale": "en-US"},
    {"name": "en-gb-x-gbd-local", "locale": "en-GB"}
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BlocBuilder<ReadBloc,ReadState>(
        buildWhen: (previous, current) => previous.requestState != current.requestState,
        builder: (context,state){
      switch(state.requestState){
        case RequestState.loading:
          return const LoadingPage();
        case RequestState.loaded:
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
                            change_Language = value.toString();
                            context.read<Bloc_change_Language>().change_Language(change_Language);
                            Future.delayed(const Duration(seconds: 1), () => Navigator.pop(context));
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
                      phraseItem: phraseItem,
                      lan: lan,
                      changeLanguage: change_Language,
                      count: count, context: context,),
                  ),
                ),
                BlocBuilder<Bloc_chang_color_Word, dynamic>(
                    builder:(bs,state) => iconMic == Icons.mic ? Pinned.fromPins(
                      Pin(size:45, end:  20.0),
                      Pin(size: 45.0, end: 28.0),
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: const Color(0xffd4af37)
                        ),
                        child: IconButton(
                          // ignore: prefer_const_constructors
                          icon:Icon(Icons.volume_up_rounded),
                          iconSize: 30.0,
                          color: Colors.white70,
                          onPressed: (){
                            try {
                              String text = "";
                              // ignore: avoid_function_literals_in_foreach_calls
                              for (var value in phraseItem.listWord) {
                                text += " " + value.content;
                              }
                              text_to_speech.speak(text,change_Language == "English(US)" ? lan.first : lan.last );
                            } catch (e, s) {
                              print(s);
                            }
                          },),
                      ),
                    ) : const SizedBox()),
                BlocBuilder<Bloc_chang_color_Word, dynamic>(builder:(bc,state) => iconMic == Icons.mic ? Pinned.fromPins(
                  Pin(size: 14 * (size.width * 0.05), middle: 0.6),
                  Pin(size: 84.0, end: 12.0),
                  child: signal_Ui_controler(speech_to_text: speech_to_text),
                ) : const SizedBox()),
                BlocBuilder<Bloc_chang_color_Word, dynamic>(builder:(bc,state) => Pinned.fromPins(
                  Pin(size: iconMic == Icons.mic ? 48.0 : 90.0, start: 20.0),
                  Pin(size: 45.0, end: 28.0),
                  child: Stack(
                    children: <Widget>[
                      BlocBuilder<Bloc_changeStateBottomSheet, bool>(builder:(bc,state) =>  Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffd4af37),
                            borderRadius: iconMic == Icons.mic ? const BorderRadius.all(Radius.elliptical(9999.0, 9999.0)) : BorderRadius.circular(10.0),
                            border: Border.all(
                                width: 1.0, color: const Color(0xffd4af37)),
                            boxShadow: const [
                              BoxShadow(color: Colors.white70, blurRadius: 10)
                            ]),
                      )),
                      SizedBox(
                          width: iconMic == Icons.mic ? 48 : 90.0,
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
                            child: BlocBuilder<Bloc_chang_color_Word, dynamic>(
                              buildWhen: (previos, next) {
                                if (next is Map<String, String> && (next["Problem"] != null || next["id-Word"] != null) && previos != next) {
                                  try {
                                    if (next["id-Word"] != null) {
                                      // if (!phraseItem.containWordById(next["id-Word"]!)) continue;
                                      for (var elementWord in phraseItem.listWord) {
                                        if (elementWord.id != next["id-Word"]) continue;
                                        // elementWord.uwrb.setType(next["type"]!);
                                        if (next["type"]! == "4" && (phraseItem.listWord.indexOf(elementWord) + 1) < phraseItem.listWord.length) {
                                          // elementPhrase.listWord[elementPhrase.listWord.indexOf(elementWord) + 1].uwrb.setType("3");
                                        }
                                      }
                                      // if (!(elementPhrase.listWord.any((element) => element.uwrb.type == "3") || elementPhrase.listWord.any((element) => element.uwrb.type == "2") || elementPhrase.listWord.any((element) => element.uwrb.type == "0")) && next["type"] == "1") {
                                      //   if (elementPhrase.listWord.any((element) => element.uwrb.type == "4")) {
                                      //     // elementPhrase.uprb.setType("4");
                                      //   } else {
                                      //     // elementPhrase.uprb.setType("2");
                                      //   }
                                      //   int index = widget.listPhrase!.indexOf(elementPhrase);
                                      //   if (widget.listPhrase!.length > index + 1) {
                                      //     // widget.listPhrase![index + 1].uprb.setType("1");
                                      //   }
                                      // }
                                    }
                                    if (!_isShowBottomSheet) {
                                      if (next["Problem"] != null && next["Level"] != null && next["Level"] != "0") {
                                        AlertDialogShow.showAlertDialogNextLevel(context, next["Level"]!, this);
                                        if(next["Problem"] == "final"){
                                          iconMic = Icons.arrow_forward_rounded;
                                        }
                                      } else if (next["Problem"] != null) {
                                        BlocProvider.of<Bloc_changeStateBottomSheet>(context).changeStateBottomSheet(true);
                                        bottomSheet.showbottomsheet(context, next);
                                        if(next["Problem"] == "final"){
                                          iconMic = Icons.arrow_forward_rounded;
                                        }
                                      }
                                    }
                                    speech_to_text!.setTextRead(phraseItem);
                                  }catch(e){
                                    // ignore: avoid_print
                                    print("Error in Page read_page ===> $e");
                                  }
                                  return true;
                                } else {
                                  return false;
                                }
                              },
                              builder: (context, state) {
                                return Row(
                                    children: [
                                      iconMic != Icons.mic ? Container(padding: const EdgeInsets.only(left: 5.0,right: 5.0) ,alignment: Alignment.bottomCenter , child: const Text("next",style: TextStyle(color: Colors.white70,),).tr()) : const SizedBox(),
                                      IconButton(
                                        icon: Icon(iconMic,color: Colors.white70,size: 30,),
                                        onPressed: () {
                                          if(iconMic == Icons.mic) {
                                            speech_to_text!.startListening();
                                          }else if(iconMic == Icons.arrow_forward_rounded){

                                          }
                                        },
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all(const EdgeInsets.all(0.0)),
                                            backgroundColor: MaterialStateProperty.all(Colors.transparent)
                                        ),
                                      ),
                                    ]);
                              },
                            ),
                          )),
                    ],
                  ),
                )),
              ],
            ),
          );
        case RequestState.error:
          return UiError(
              message: state.error.message,
              retry: (){
            // context.read<ReadBloc>().add(SetWordStateEvent(, state, idParticipant))
          },
              close: (){
                Navigator.pop(context);
              });
      }
    });
  }
}
