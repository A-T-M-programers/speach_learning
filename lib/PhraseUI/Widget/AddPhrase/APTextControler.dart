import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/PhraseUI/bloc/BlocAddPhrase.dart';
import 'package:speach_learning/Read/Widget/SingleChildListTextView.dart';

// ignore: must_be_immutable
class APTextControler extends StatelessWidget {
  APTextControler({Key? key, required this.label, required this.hintText,this.updateText})
      : super(key: key);

  late String label;
  late String hintText;
  String? updateText;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textEditingController.text = updateText != null ? updateText! : "";
    return Row(children: [
      Container(
        child: Text(label).tr(),
      ),
      20.pw,
      Expanded(
          flex: 1,
          child: TextFormField(
            controller: textEditingController,
            style: TextStyle(
                color: Theme.of(context).textTheme.headline1!.color,
                decorationThickness: 0.0,
                height: 1.5),
            enabled: true,
            textInputAction: TextInputAction.next,
            cursorColor: Theme.of(context).appBarTheme.iconTheme!.color!.withOpacity(0.5),
            decoration: InputDecoration(
              hintText: hintText.tr(),
              hintStyle: TextStyle(
                  color: Theme.of(context).textTheme.headline1!.color!.withOpacity(0.5)),
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
            onChanged: (value) {
              if(label == "content"){
                context.read<Bloc_Add_Phrase>().addContent(value);
              }else if(label == "trans"){
                context.read<Bloc_Add_Phrase>().addTransContent(value);
              }
            },
          ))
    ]);
  }
}
