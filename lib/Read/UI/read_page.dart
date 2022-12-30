import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Read/UI/BottomSheet.dart';
import 'package:speach_learning/Read/UI/signal_Ui.dart';
import 'package:speach_learning/Read/UI/ui_Text_Word.dart';
import 'package:speach_learning/Read/controle/Speech_To_Text.dart';

import '../bloc/Bloc_Controler_Read.dart';

// ignore: camel_case_types, must_be_immutable
class read_page extends StatefulWidget {
  // ignore: non_constant_identifier_names
  read_page({Key? key, this.text_read}) : super(key: key);

  @override
  State<read_page> createState() => _read_pageState();

  // ignore: non_constant_identifier_names
  List<Map<String, String>>? text_read;
}

// ignore: camel_case_types
class _read_pageState extends State<read_page> {
  late List<Widget> readText;

  // ignore: non_constant_identifier_names

  // ignore: non_constant_identifier_names
  Speech_To_Text? speech_to_text;

  Size size = const Size(0.0, 0.0);

  // ignore: non_constant_identifier_names
  String change_Language = "English(US)";
  List<Map<String, String>> lan = [
    {"name": "en-us-x-tpf-local", "locale": "en-US"},
    {"name": "en-gb-x-gbd-local", "locale": "en-GB"}
  ];
  int displayWords = 20;
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  bool _isShowbottomSheet = false;
  final _scrollController = ScrollController();

  @override
  initState() {
    super.initState();
    readText = <Widget>[];
    speech_to_text = Speech_To_Text(text_read: widget.text_read);
    speech_to_text!.initSpeechState();
    refreshKey.currentState?.show(atTop: false);
    _scrollController.addListener(_onScroll);
    int minus = widget.text_read!.length - displayWords;
    setState(() {
      displayWords += minus >= 20
          ? 20
          : minus >= 0
              ? minus
              : 0;
    });
  }

  @override
  void dispose() {
    _isShowbottomSheet = false;
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<Bloc_Controler>().increment();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  Future<void> _refresh() async {
    return await Future.delayed(Duration.zero, () {
      int minus = widget.text_read!.length - displayWords;
      setState(() {
        displayWords += minus >= 10
            ? 10
            : minus >= 0
                ? minus
                : 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffeeece4),
      appBar: AppBar(backgroundColor: const Color(0xff888579), actions: [
        Center(
            child: Container(
          width: size.width * 0.3,
          alignment: Alignment.centerLeft,
          child: Text(
            "Words : " + displayWords.toString(),
            style: const TextStyle(color: Colors.white70),
          ),
        )),
        Container(
            margin: const EdgeInsets.only(right: 20),
            height: 50.0,
            width: 155.0,
            child: DropdownButton(
              elevation: 2,
              borderRadius: BorderRadius.circular(20),
              dropdownColor: const Color(0xff888579),
              style: const TextStyle(color: Colors.white70),
              iconSize: 28,
              value: change_Language,
              items: const [
                DropdownMenuItem(
                    value: "English(US)", child: Text("English(US)     ")),
                DropdownMenuItem(
                    value: "English(UK)", child: Text("English(UK)     ")),
              ],
              onChanged: (value) {
                setState(() => change_Language = value.toString());
              },
            )),
      ]),
      body: Stack(
        children: <Widget>[
          Center(
            heightFactor: 1,
            child: Container(
              height: size.height * 0.35,
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
              child: SingleChildScrollView(
                controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child:Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: List.generate(
                            displayWords,
                            (index) => BlocBuilder<Bloc_Controler, dynamic>(
                                builder: (context, type) {
                                  if (type is Map<String, String>) {
                                    type["Name"] ==
                                            widget.text_read![index]["Name"]
                                        ? widget.text_read![index]["type"] =
                                            type["type"]!
                                        : null;

                                    if (type["Problem"].toString().isNotEmpty &&
                                        !_isShowbottomSheet) {
                                      _isShowbottomSheet = true;
                                      bottomSheet.showbottomsheet(
                                          context, type);
                                    }
                                  }
                                  return text_Word(
                                      text_read: widget.text_read,
                                      index: index,
                                      change_Language: change_Language,
                                      lan: lan);
                                })))),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 14 * (size.width * 0.05), start: size.width * 0.24),
            Pin(size: 84.0, end: 42.0),
            child: signal_Ui_controler(speech_to_text: speech_to_text),
          ),
          Pinned.fromPins(
            Pin(size: 45.0, start: 26.0),
            Pin(size: 45.0, end: 62.0),
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
                    child: IconButton(
                      icon: const Icon(Icons.mic),
                      onPressed: () => speech_to_text!.startListening(context),
                      color: Colors.white70,
                      iconSize: 30,
                      padding: const EdgeInsets.only(left: 1.0, top: 2.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
