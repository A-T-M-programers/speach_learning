import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/PhraseUI/bloc/BlocShowCheckBox.dart';
import 'package:speach_learning/Process_Class/PhraseItem.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key,required this.listPhraseItem}) : super(key: key);

  final List<PhraseItem> listPhraseItem;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  // ignore: prefer_const_constructors
  Size size = Size(0, 0);
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 10.0,left: 10.0),
        width: size.width * 0.4,
        child: TextFormField(
          style: TextStyle(
              color: Theme.of(context).textTheme.headline1!.color,
              decorationThickness: 0.0,
              height: 1.5),
          enabled: true,
          controller: search,
          textInputAction: TextInputAction.search,
          cursorColor:
              Theme.of(context).appBarTheme.iconTheme!.color!.withOpacity(0.5),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context)
                  .appBarTheme
                  .iconTheme!
                  .color!
                  .withOpacity(0.5),
            ),
            hintText: "search".tr(),
            hintStyle: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .headline1!
                    .color!
                    .withOpacity(0.5)),
            contentPadding: const EdgeInsets.only(left: 5.0, right: 5.0),
            border: const OutlineInputBorder(
                gapPadding: 0.0,
                borderSide: BorderSide(
                    strokeAlign: StrokeAlign.outside, color: Colors.white38)),
            enabledBorder: const OutlineInputBorder(
                gapPadding: 0.0,
                borderSide: BorderSide(
                    strokeAlign: StrokeAlign.outside, color: Colors.white38)),
            focusedBorder: const OutlineInputBorder(
                gapPadding: 0.0,
                borderSide: BorderSide(
                    strokeAlign: StrokeAlign.outside, color: Colors.white38)),
          ),
          onChanged:searchAI,
        ));
  }
  void searchAI(String value){
    List<PhraseItem> list = [];
    for(var phraseItem in widget.listPhraseItem){
      if(phraseItem.type.content.toLowerCase().contains(value.toLowerCase())){
        list.add(phraseItem);
      }else{
        if(phraseItem.listWord.last.wordInPhrase.toLowerCase().contains(value.toLowerCase())){
          list.add(phraseItem);
        }
      }
    }
    context.read<BlocUpdateShowListPhrase>().showListPhraseItem(list);
  }
}
