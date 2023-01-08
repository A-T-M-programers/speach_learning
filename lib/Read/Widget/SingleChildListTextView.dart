import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Read/UI/ui_Text_Word.dart';
import 'package:speach_learning/Read/bloc/Bloc_Controler_Read.dart';
import 'package:speach_learning/Read/controle/Text_To_Speech.dart';

// ignore: must_be_immutable
class SingleChildListTextView extends StatefulWidget {
  // ignore: non_constant_identifier_names
  SingleChildListTextView(
      // ignore: non_constant_identifier_names
      {Key? key, this.text_read, this.lan, this.change_Language})
      : super(key: key);

  // ignore: non_constant_identifier_names
  List<Map<String, String>>? text_read;
  List<Map<String, String>>? lan;

  // ignore: non_constant_identifier_names
  String? change_Language = "English(US)";

  @override
  State<SingleChildListTextView> createState() =>
      _SingleChildListTextViewState();
}

class _SingleChildListTextViewState extends State<SingleChildListTextView> {
  final _scrollController = ScrollController();
  int displayWords = 0;
  Text_To_Speech text_to_speech = Text_To_Speech();
  // ignore: non_constant_identifier_names

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text_to_speech.initTts();
    context.read<Bloc_increment>().increment(0);
    _scrollController.addListener(_onScroll);
    int minus = widget.text_read!.length - displayWords;
    displayWords += minus >= 20 ? 20 : minus >= 0 ? minus : 0;
  }

  static int refresh(data) {
    int count = data[0] + ((data[1].length - data[0]) >= 20 ? 20 : (data[1].length - data[0]) >= 0 ? (data[1].length - data[0]) : 0);
    return count;
  }

  void _onScroll() async {
    if (_isBottom && displayWords < widget.text_read!.length) {
      context.read<Bloc_chang_display_circuler>().chang_display_circuler({"isShow": true});
      try {
        // compute(refresh,1000).then((value) => print(value));
        BlocProvider.of<Bloc_increment>(context).increment(await compute(refresh,[displayWords,widget.text_read]));
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
              future: compute(buildListText, [displayWords,widget.text_read,widget.change_Language,widget.lan,text_to_speech]),
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

  // ignore: non_constant_identifier_names
  static Widget buildListText(displayWord) {
    return Column(
        children: [
      Wrap(
          textDirection: TextDirection.ltr,
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
              displayWord[0],
              (index) => text_Word(
                  Map_Word: displayWord[1][index],
                  index: index,
                  change_Language: displayWord[2],
                  lan: displayWord[3],
              text_to_speech: displayWord[4],)
          )
      ),
    ]);
  }
}
