import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/PhraseUI/bloc/BlocAddPhrase.dart';
import 'package:speach_learning/Read/Widget/SingleChildListTextView.dart';

// ignore: must_be_immutable
class APTextControler extends StatelessWidget {
  APTextControler({Key? key, required this.label, required this.hintText,this.updateText,required this.indexWord})
      : super(key: key);

  late String label,hintText;
  String? updateText,value;
  int indexWord;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textEditingController.text = updateText ?? value ?? "";
    return Row(
        children: [
      Container(
        child: Text(label,style: TextStyle(color: Theme.of(context).textTheme.headline2!.color)).tr(),
      ),
      20.pw,
      Expanded(
          flex: 1,
          child: TextFormField(
            controller: textEditingController,
            style: TextStyle(
                color: Theme.of(context).textTheme.headline2!.color!,
                decorationThickness: 0.0,
                height: 1.5),
            enabled: true,
            textInputAction: TextInputAction.next,
            cursorColor: Theme.of(context).textTheme.headline2!.color!,
            decoration: InputDecoration(
              hintText: hintText.tr(),
              hintStyle: TextStyle(
                  color: Theme.of(context).textTheme.headline2!.color!.withOpacity(0.5)),
              contentPadding: const EdgeInsets.only(left: 5.0, right: 5.0),
              border: const OutlineInputBorder(
                  gapPadding: 0.0,
                  borderSide: BorderSide(
                      strokeAlign: StrokeAlign.outside, color: Colors.white38)),
              enabledBorder: OutlineInputBorder(
                  gapPadding: 0.0,
                  borderSide: BorderSide(
                      strokeAlign: StrokeAlign.outside, color: Theme.of(context).textTheme.headline2!.color!)),
              focusedBorder: OutlineInputBorder(
                  gapPadding: 0.0,
                  borderSide: BorderSide(
                      strokeAlign: StrokeAlign.outside, color: Theme.of(context).textTheme.headline2!.color!)),
            ),
            onChanged: (value){
              this.value = value;
              if(label == "word"){
                context.read<BlocAddPhrase>().changeState({"Change-Content":{"content":value,"indexword":"$indexWord"}});
              }else if(label == "transword"){
                context.read<BlocAddPhrase>().changeState({"Change-Trans":{"trans":value,"indexword":"$indexWord"}});
              }
            },
          ))
    ]);
  }
}
