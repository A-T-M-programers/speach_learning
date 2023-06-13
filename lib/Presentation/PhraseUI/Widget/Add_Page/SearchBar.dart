import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Domain/Entity/PhraseItem.dart';
import 'package:speach_learning/Presentation/PhraseUI/controler/phrase_bloc.dart';
import 'package:speach_learning/core/utils/enums.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({Key? key}) : super(key: key);

  static Size size = const Size(0, 0);
  static TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 10.0,left: 10.0),
        width:  size.width * 0.4,
        child: BlocBuilder<PhraseBloc,PhraseState>(builder: (context, state) {
          switch(state.requestState){
            case RequestState.loading:
              return getWidget(false, context, []);
            case RequestState.loaded:
              return getWidget(true, context, state.level.listPhraseItem);
            case RequestState.error:
              return getWidget(false, context, []);
          }
        },));
  }

  Widget getWidget(bool checkLoaded,BuildContext context,List<PhraseItem> listPhraseItem){
    return TextFormField(
      style: TextStyle(
          color: Theme.of(context).textTheme.headlineSmall!.color,
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
                .headlineSmall!
                .color!
                .withOpacity(0.5)),
        contentPadding: const EdgeInsets.only(left: 5.0, right: 5.0),
        border: const OutlineInputBorder(
            gapPadding: 0.0,
            borderSide: BorderSide(
                strokeAlign: BorderSide.strokeAlignOutside, color: Colors.white38)),
        enabledBorder: const OutlineInputBorder(
            gapPadding: 0.0,
            borderSide: BorderSide(
                strokeAlign: BorderSide.strokeAlignOutside, color: Colors.white38)),
        focusedBorder: const OutlineInputBorder(
            gapPadding: 0.0,
            borderSide: BorderSide(
                strokeAlign: BorderSide.strokeAlignOutside, color: Colors.white38)),
      ),
      onChanged:(value) => searchAI(checkLoaded,value,context,listPhraseItem),
    );
  }

  void searchAI(bool checkLoaded,String value,BuildContext context,List<PhraseItem> listPhraseItem){
    if(checkLoaded) {
      List<PhraseItem> list = [];
      for (var phraseItem in listPhraseItem) {
        if (phraseItem.content.toLowerCase().contains(value.toLowerCase())) {
          list.add(phraseItem);
        }
      }
      context.read<PhraseBloc>().add(SearchListPhraseEvent(list));
    }else{
      return;
    }
  }
}
