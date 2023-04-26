import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Process_Class/Filter_Text.dart';
import 'package:speach_learning/Process_Class/PhraseItem.dart';
import 'package:speach_learning/Read/Widget/ui_Text_Word.dart';
import 'package:speach_learning/Read/bloc/Bloc_Controler_Read.dart';
import 'package:speach_learning/Read/controle/Text_To_Speech.dart';

// ignore: must_be_immutable
class SingleChildListTextView extends StatefulWidget {
  // ignore: non_constant_identifier_names
  SingleChildListTextView(
      // ignore: non_constant_identifier_names
      {Key? key, this.listPhraseItem, this.lan, this.change_Language,this.count})
      : super(key: key);

  // ignore: non_constant_identifier_names
  List<PhraseItem>? listPhraseItem;
  List<Map<String, String>>? lan;
  int? count;

  // ignore: non_constant_identifier_names
  String? change_Language = "English(US)";

  @override
  State<SingleChildListTextView> createState() =>
      _SingleChildListTextViewState();
}

class _SingleChildListTextViewState extends State<SingleChildListTextView> {
  final _scrollController = ScrollController();
  int displayWords = 0;
  // ignore: non_constant_identifier_names
  Text_To_Speech text_to_speech = Text_To_Speech();
  // ignore: non_constant_identifier_names

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text_to_speech.initTts();
    context.read<Bloc_increment>().increment(0);
    _scrollController.addListener(_onScroll);
    int minus = widget.count! - displayWords;
    displayWords += minus >= 20 ? 20 : minus >= 0 ? minus : 0;
  }

  static int refresh(data) {
    int count = data[0] + ((data[1] - data[0]) >= 20 ? 20 : (data[1] - data[0]) >= 0 ? (data[1] - data[0]) : 0);
    return count;
  }

  void _onScroll() async {
    if (_isBottom && displayWords < widget.count!) {
      context.read<Bloc_chang_display_circuler>().chang_display_circuler({"isShow": true});
      try {
        // compute(refresh,1000).then((value) => print(value));
        BlocProvider.of<Bloc_increment>(context).increment(await compute(refresh,[displayWords,widget.count!]));
      } catch (e, s) {
        // ignore: avoid_print
        print(s);
      }
    } else {
      context.read<Bloc_chang_display_circuler>().chang_display_circuler({"isShow": false});
    }
  }

  bool get _isBottom {
    try {
      if (!_scrollController.hasClients) return false;
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;
      return currentScroll >= (maxScroll + 50.0) ? true : false;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return false;
    }
  }
  @override
  void dispose() {
    text_to_speech.stop();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<Bloc_increment, int>(
            buildWhen: (previos, next) {
          if (next != 0 && previos != next) {
            return true;
          } else {
            return false;
          }
        }, builder: (context, type) {
          if (type != 0) {
            displayWords = type;
          }
          return FutureBuilder(
              future:buildListPhrase([displayWords,widget.listPhraseItem,widget.change_Language,widget.lan,text_to_speech,context]),
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
                    return const Center(child: Text("Their is Error"));
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
        }));
  }

  Future<Widget> buildListPhrase(data) async {
    return Center(child: Directionality(
        textDirection: TextDirection.ltr,
        child:  Wrap(
      spacing: 5,
      runSpacing: 5,
      children: List.generate(data[1].length, (index) => buildListText([data[1][index].listWord.length,data[1][index].listWord,data[2],data[3],data[4],data[1][index].type,data[5]])),
    )));
  }

  // ignore: non_constant_identifier_names
  Widget buildListText(data) {
    return Row(
      mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
              data[0],
              (index) => text_Word(
                  word: data[1][index],
                  nextWord: index < data[0] -1 ? data[1][index + 1] : null,
                  index: index,
                  change_Language: data[2],
                  lan: data[3],
              text_to_speech: data[4],)
          )
      ),
    3.pw,
      Text(
        Filter_Text.addMark(data[5].content),
        style:TextStyle(
          color: Colors.transparent,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(
                color: Theme.of(data[6]).textTheme.headline2!.color!,
                offset: Offset(0, 3))
          ],
        ),
      ),

    ]);
  }
}
extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}