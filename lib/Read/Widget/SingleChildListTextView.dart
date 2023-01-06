import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Read/UI/ui_Text_Word.dart';
import 'package:speach_learning/Read/bloc/Bloc_Controler_Read.dart';

// ignore: must_be_immutable
class SingleChildListTextView extends StatefulWidget {
  // ignore: non_constant_identifier_names
  SingleChildListTextView(
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
  bool _isShowCirculerBar = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<Bloc_Controler>().increment({"count": 0});
    _scrollController.addListener(_onScroll);
    int minus = widget.text_read!.length - displayWords;
    displayWords += minus >= 20 ? 20 : minus >= 0 ? minus : 0;
  }
  Future<void> refresh() async {
    int count = displayWords + ((widget.text_read!.length - displayWords) >= 20 ? 20 : (widget.text_read!.length - displayWords) >= 0 ? (widget.text_read!.length - displayWords) : 0);
    context.read<Bloc_Controler>().increment({"count": count});
  }

  void _onScroll() async {
    if (_isShowCirculerBar = _isBottom && displayWords != widget.text_read!.length){

    try {
      // compute(refresh,1000).then((value) => print(value));
     refresh();
    } catch (e, s) {
      print(s);
    }
    }else{
      _isShowCirculerBar = false;
    }
  }
  bool get _isBottom {
    try {
      if (!_scrollController.hasClients) return false;
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;
      return currentScroll >= (maxScroll + 50.0)? true : false;
    }catch(e){
      print(e);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<Bloc_Controler, dynamic>(
            buildWhen: (previos, next) {
          if (next is Map<String, int> && next["count"] != 0 && previos != next) {
            return true;
          } else {
            return false;
          }
        }, builder: (context, type) {
          if (type is Map<String, int> && type["count"] != 0) {
            displayWords = int.parse(type["count"].toString());
          }
          return buildListText(displayWords);
        }));
  }
  Widget buildListText(int displayWord) {
    return Column(
        children: [ Wrap(
        spacing: 10,
        runSpacing: 10,
        children: List.generate(
            displayWord,
                (index) => text_Word(
                Map_Word: widget.text_read![index],
                index: index,
                change_Language: widget.change_Language,
                lan: widget.lan))),
    const SizedBox(
      height: 5.0,
    ),
    Visibility
      (
        visible: !_isShowCirculerBar,
        child: const Center(
      child:SizedBox(
        height: 20.0,
        width: 20.0,
        child:  CircularProgressIndicator(
          strokeWidth: 2.0,
    ),))),
        const SizedBox(height: 20.0,)
        ]);
  }
}
