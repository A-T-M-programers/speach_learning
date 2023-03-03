import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/PhraseUI/Widget/Add_Page/ItemPhrase.dart';
import 'package:speach_learning/PhraseUI/bloc/BlocShowCheckBox.dart';
import 'package:speach_learning/Process_Class/PhraseItem.dart';
import 'package:speach_learning/Read/bloc/Bloc_Controler_Read.dart';

// ignore: must_be_immutable
class ListPhraseItem extends StatefulWidget {
  ListPhraseItem({Key? key, required this.list}) : super(key: key);

  List<PhraseItem> list;

  @override
  State<ListPhraseItem> createState() => _ListPhraseItemState();
}

class _ListPhraseItemState extends State<ListPhraseItem> {
  late bool listIsShowCheckBox;
  late List<bool> listIsSelected;

  Size size = const Size(0.0, 0.0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listIsShowCheckBox = false;
    listIsSelected = List.generate(widget.list.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BlocBuilder<BlocShowCheckBox, Map<int, bool>>(
        buildWhen: (previous, current) {
      listIsSelected[current.keys.first] = current.values.first;
      if (listIsSelected.contains(true)) {
        if (listIsShowCheckBox) {
          return false;
        }
        listIsShowCheckBox = true;
        return true;
      } else {
        listIsShowCheckBox = false;
        return true;
      }
    }, builder: (bc, isShow) {
      return BlocListener<Bloc_chang_color_Word, dynamic>(listener: (bcc, data) {
        try {
          if (data["id-Word"] != null && (data["type"] == "4" || data["type"] == "1")) {
            int nextIndexPhrase = 0;
            PhraseItem? phraseItem ;
            for(var phrase in widget.list){
              nextIndexPhrase++;
              for(var word in phrase.listWord){
                if(word.id == data["id-Word"]){
                  if(data["type"] == "4") {
                    phraseItem = phrase;
                  }
                  if(nextIndexPhrase < widget.list.length){
                    if(widget.list[nextIndexPhrase - 1].listWord.last == word) {
                      widget.list[nextIndexPhrase].listWord.first.uwrb.setType("3");
                    }
                  }
                  break;
                }
              }
            }
            if(phraseItem != null) {
              if (phraseItem.listWord.last.id == data["id-Word"]) {
                phraseItem.uprb.setType("4");
              }
            }
          }
          setState(() {});
        }catch(e){
          print(e);
        }
      },
        child: ListView(
            physics: const ScrollPhysics(),
            padding:
                EdgeInsets.only(top: (size.height * 0.15) + 85.5, bottom: 30.0),
            shrinkWrap: true,
            children: List.generate(widget.list.length, (index) {
              if (widget.list[index].uprb.type == "0" && index > 0 && (widget.list[index - 1].uprb.type == "2" || widget.list[index - 1].uprb.type == "4")) {
                widget.list[index].uprb.setType("1");
              }
              return ItemPhrase(
                  phraseItem: widget.list[index],
                  isLongPress: listIsShowCheckBox,
                  index: index
                  );
            }))
      );
    });
  }
}
