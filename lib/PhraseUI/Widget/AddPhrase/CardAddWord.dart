import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/AlertDialog.dart';
import 'package:speach_learning/PhraseUI/Widget/AddPhrase/APTextControler.dart';
import 'package:speach_learning/PhraseUI/Widget/AddPhrase/DropDown.dart';
import 'package:speach_learning/PhraseUI/bloc/BlocAddPhrase.dart';
import 'package:speach_learning/Process_Class/Word.dart';
import 'package:speach_learning/Process_Class/WordOrPhraseType.dart';
import 'package:speach_learning/Read/Widget/SingleChildListTextView.dart';

// ignore: must_be_immutable
class CardAddWord extends StatefulWidget {
  CardAddWord(
      {Key? key,
      this.indexUpdate,
      this.listWord,
      required this.listTypeWord,
      required this.indexWord,
      required this.content,
      required this.trans,
      this.idTypeWord})
      : super(key: key);
  int? indexUpdate;
  int indexWord;
  List<Word>? listWord;
  List<WordOrPhraseType> listTypeWord;
  List<String> content, trans;
  String? idTypeWord;

  @override
  State<CardAddWord> createState() => _CardAddWordState();
}

// ignore: must_be_immutable
class _CardAddWordState extends State<CardAddWord>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 100),
    vsync: this,
  )..repeat(reverse: true);
  late Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, 0.0),
    end: const Offset(0.01, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  ));

  Offset _offset = Offset.zero;
  int pressRight = 0, pressLeft = 0;
  bool? getYesOrNoDelete;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      _controller.stop();
      _offsetAnimation = Tween<Offset>(
        begin: const Offset(0.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //word add card or update
    return BlocListener<BlocAddPhrase, Map>(
        listener: (bc, state) {
          if (state.containsKey("Delete")) {
            if (state["Delete"] != null) {
              if (state["Delete"]['Index-Word-Delete']! < widget.indexWord) {
                widget.indexWord = widget.indexWord - 1;
              } else if (state["Delete"]["Index-Word-Delete"] ==
                  widget.indexWord) {
                getYesOrNoDelete = false;
                // ignore: prefer_const_constructors
                _offset = Offset(0.0, 0.0);
              }
            }
          }
        },
        child: GestureDetector(
            onPanUpdate: (details) {
              // Swiping in right direction.
              // Swiping in right direction.
              if (details.delta.dx > 0) {
                if (pressRight == 0 && widget.indexWord > 0) {
                  pressRight++;
                  pressLeft = 0;
                  // ignore: prefer_const_constructors
                  _offset = Offset(0.5, 0.0);
                  context
                      .read<BlocOffsetSlideTransition>()
                      .offsetSlideTransition({widget.indexWord: _offset});
                }
              }

              // Swiping in left direction.
              if (details.delta.dx < 0) {
                if (pressLeft == 0 && widget.indexWord > 0) {
                  pressLeft++;
                  pressRight = 0;
                  // ignore: prefer_const_constructors
                  _offset = Offset(-0.5, 0.0);
                  context
                      .read<BlocOffsetSlideTransition>()
                      .offsetSlideTransition({widget.indexWord: _offset});
                }
              }
            },
            child: BlocBuilder<BlocOffsetSlideTransition, Map<int, Offset>>(
                buildWhen: (previos, next) {
                  if (previos != next && next.containsKey(widget.indexWord)) {
                    _offset = next[widget.indexWord]!;
                    return true;
                  } else {
                    return false;
                  }
                },
                builder: (bc, state) => AnimatedSlide(
                    onEnd: () async {
                      if (_offset != Offset.zero) {
                        try {
                          getYesOrNoDelete =
                              await AlertDialogShow.yesOrNoDialog(
                                  context, "delete", "deleteSure");
                        } catch (e) {
                          // ignore: avoid_print
                          print(
                              "Error in widget CardAddWord in folder PhraseUI" +
                                  e.toString());
                        }
                        getYesOrNoDelete = getYesOrNoDelete ?? false;
                        if (!getYesOrNoDelete!) {
                          _offset = Offset.zero;
                          context
                              .read<BlocOffsetSlideTransition>()
                              .offsetSlideTransition(
                                  {widget.indexWord: _offset});
                        } else {
                          context.read<BlocAddPhrase>().changeState({
                            "Delete": {"Index-Word-Delete": widget.indexWord}
                          });
                        }
                      }
                    },
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOutBack,
                    offset: _offset,
                    child: SlideTransition(
                        position: _offsetAnimation,
                        child: Card(
                            shape: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                                borderRadius: BorderRadius.circular(20.0)),
                            color: Theme.of(context).scaffoldBackgroundColor,
                            shadowColor: Colors.black87,
                            elevation: 6.0,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //input text controler with word text in English
                                  Expanded(
                                      flex: 0,
                                      child: Row(children: [
                                        Expanded(
                                            flex: 2,
                                            child: APTextControler(
                                              label: "word",
                                              hintText: "addwordhere",
                                              updateText: widget.indexUpdate != null
                                                  ? widget.listWord![widget.indexUpdate!].content
                                                  : widget.content.isNotEmpty
                                                  ? widget.content[widget.indexWord].isNotEmpty
                                                  ? widget.content[widget.indexWord]
                                                  : "" : "",
                                              indexWord: widget.indexWord,
                                            )),
                                        10.pw,
                                        Expanded(
                                            flex: 1,
                                            child: BlocListener<BlocAddPhrase, Map>(
                                                listener: (bc, state) {
                                                  if (state.containsKey("Select-Type")) {
                                                    if (state["Select-Type"].containsKey("Type-Word")) {
                                                      if (state["Select-Type"]["Type-Word"] != null && state["Select-Type"]["Type-Word"] != widget.idTypeWord && state["Select-Type"]["Index-Item"] == widget.indexWord) {
                                                        widget.idTypeWord = state["Select-Type"]["Type-Word"];
                                                      }
                                                    }
                                                  }
                                                },
                                                child: DropDownCustom(
                                                  listDropDown:
                                                      widget.listTypeWord,
                                                  nameThis: "Type-Word",
                                                  idSelected: widget.idTypeWord,
                                                  indexItem: widget.indexWord,
                                                ))),
                                      ])),
                                  10.ph,
                                  //input text controler with word text in Arabic
                                  Expanded(
                                      flex: 0,
                                      child: APTextControler(
                                        label: "transword",
                                        hintText: "addtranswordhere",
                                        updateText: widget.indexUpdate != null
                                            ? widget.listWord![widget.indexUpdate!].trans
                                            : widget.trans.isNotEmpty
                                            ? widget.trans[widget.indexWord]
                                            : null,
                                        indexWord: widget.indexWord,
                                      )),
                                  10.ph,
                                  Expanded(
                                      flex: 0,
                                      child: BlocBuilder<BlocAddPhrase,Map>(
                                          buildWhen: (previos, next) {
                                        if (previos != next) {
                                          if(next.containsKey("Change-Content")) {
                                            if (next["Change-Content"]["content"] != null && int.parse(next["Change-Content"]["indexword"]!) == widget.indexWord) {
                                              widget.content[widget.indexWord] = next["Change-Content"]["content"]!;
                                              return true;
                                            }
                                          }
                                          return false;
                                        } else {
                                          return false;
                                        }
                                      }, builder: (bc, state) {
                                        return Text(
                                            "wordinphrase".tr() +
                                                " : ${getStringList(widget.content, widget.indexWord)}",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .headline2!
                                                    .color));
                                      })),
                                  10.ph,
                                  Expanded(
                                      flex: 0,
                                      child: BlocBuilder<BlocAddPhrase,Map>(
                                          buildWhen: (previos, next) {
                                        if (previos != next) {
                                          if(next.containsKey("Change-Trans")) {
                                            if (next["Change-Trans"]["trans"] != null &&
                                                int.parse(next["Change-Trans"]["indexword"]!) == widget.indexWord) {
                                              widget.trans[widget.indexWord] = next["Change-Trans"]["trans"]!;
                                              return true;
                                            }
                                          }
                                          return false;
                                        } else {
                                          return false;
                                        }
                                      }, builder: (bc, state) {
                                        return Text(
                                            "transinphraes".tr() +
                                                " : ${getStringList(widget.trans, widget.indexWord)}",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .headline2!
                                                    .color));
                                      })),
                                ],
                              ),
                            )))))));
  }

  String getStringList(List<String> data, int index) {
    String newString = "";
    for (int i = 0; i <= index; i++) {
      if (data.isNotEmpty) {
        newString += data[i] + " ";
      } else {
        newString += "";
      }
    }
    return newString;
  }
}
