import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Read/bloc/Bloc_Controler_Read.dart';
import 'package:speach_learning/Presentation/Read/controle/Text_To_Speech.dart';
import 'package:speach_learning/core/global/static/Filter_Text.dart';
import 'package:speach_learning/Domain/Entity/PhraseItem.dart';

import 'ui_Text_Word.dart';

// ignore: must_be_immutable
class SingleChildListTextView extends StatelessWidget {
  // ignore: non_constant_identifier_names
  SingleChildListTextView({
    Key? key,
    required BuildContext context,
    required this.phraseItem,
    this.lan,
    this.changeLanguage,
    this.count})
      : super(key: key){
    textToSpeech.initTts();
    context.read<Bloc_increment>().increment(0);
    // _scrollController.addListener(_onScroll);
    // int minus = widget.count! - displayWords;
    // displayWords += minus >= 20 ? 20 : minus >= 0 ? minus : 0;
  }

  final PhraseItem phraseItem;
  List<Map<String, String>>? lan;
  int? count;
  String? changeLanguage = "English(US)";
  // final _scrollController = ScrollController();
  // int displayWords = 0;
  Text_To_Speech textToSpeech = Text_To_Speech();

  // static int refresh(data) {
  //   int count = data[0] + ((data[1] - data[0]) >= 20 ? 20 : (data[1] - data[0]) >= 0 ? (data[1] - data[0]) : 0);
  //   return count;
  // }
  //
  // void _onScroll() async {
  //   if (_isBottom && displayWords < widget.count!) {
  //     context.read<Bloc_chang_display_circuler>().chang_display_circuler({"isShow": true});
  //     try {
  //       // compute(refresh,1000).then((value) => print(value));
  //       BlocProvider.of<Bloc_increment>(context).increment(await compute(refresh,[displayWords,widget.count!]));
  //     } catch (e, s) {
  //       // ignore: avoid_print
  //       print(s);
  //     }
  //   } else {
  //     context.read<Bloc_chang_display_circuler>().chang_display_circuler({"isShow": false});
  //   }
  // }

  // bool get _isBottom {
  //   try {
  //     if (!_scrollController.hasClients) return false;
  //     final maxScroll = _scrollController.position.maxScrollExtent;
  //     final currentScroll = _scrollController.offset;
  //     return currentScroll >= (maxScroll + 50.0) ? true : false;
  //   } catch (e) {
  //     // ignore: avoid_print
  //     print(e);
  //     return false;
  //   }
  // }

  Size size = const Size(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BlocBuilder<Bloc_increment, int>(
            buildWhen: (previos, next) {
          if (next != 0 && previos != next) {
            return true;
          } else {
            return false;
          }
        }, builder: (context, type) {
          if (type != 0) {
            // displayWords = type;
          }
          return FutureBuilder(
              future:buildListText([phraseItem.listWord.length,phraseItem.listWord,changeLanguage,lan,textToSpeech,phraseItem.type,context]),
              builder: (context, AsyncSnapshot<Widget> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Visibility(
                      visible: true,
                      child: Center(
                          child: SizedBox(
                        height: 40.0,
                        width: 40.0,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                        ),
                      )));
                } else if(snapshot.connectionState == ConnectionState.done) {
                  if(snapshot.hasError){
                    return Center(child: Text(snapshot.error!.toString()));
                  }else if(snapshot.hasData) {
                    return snapshot.data!;
                  }else{
                    return const Center(child: Text("Not Found"),);
                  }
                }else if(snapshot.connectionState == ConnectionState.none){
                    return snapshot.data!;
              }else{
                  return const Visibility(
                      visible: true,
                      child: Center(
                          child: SizedBox(
                            height: 40.0,
                            width: 40.0,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                            ),
                          )));
                }
              });
        });
  }

  // Future<Widget> buildListPhrase(data) async {
  //   return Center(child: Directionality(
  //       textDirection: TextDirection.ltr,
  //       child:  Wrap(
  //     spacing: 5,
  //     runSpacing: 5,
  //     children: List.generate(1, (index) => buildListText([data[1].listWord.length,data[1].listWord,data[2],data[3],data[4],data[1].type,data[5]])),
  //   )));
  // }

  // ignore: non_constant_identifier_names
  Future<Widget> buildListText(data) async {
    return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
              data[0] + 1,
              (index) => index == data[0] ? Text(
                Filter_Text.addMark(data[5]),
                style:TextStyle(
                  color: Colors.transparent,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    BoxShadow(
                        color: Theme.of(data[6]).textTheme.headline2!.color!,
                        offset: const Offset(0, 3))
                  ],
                ),
              ): text_Word(
                  word: data[1][index],
                  nextWord: index < data[0] -1 ? data[1][index + 1] : null,
                  index: index,
                  changeLanguage: data[2],
                  lan: data[3],
              textToSpeech: data[4], context: data[6],)
      )
      );
    // 3.pw,
    //   Text(
    //     Filter_Text.addMark(data[5]),
    //     style:TextStyle(
    //       color: Colors.transparent,
    //       fontWeight: FontWeight.bold,
    //       shadows: [
    //         BoxShadow(
    //             color: Theme.of(data[6]).textTheme.headline2!.color!,
    //             offset: Offset(0, 3))
    //       ],
    //     ),
    //   ),

  }
}
extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}