import 'package:flutter/material.dart';
import 'package:speach_learning/core/global/static/Filter_Text.dart';
import 'package:speach_learning/Domain/Entity/PhraseItem.dart';

import 'uiTextWord.dart';

class SingleChildListTextView extends StatelessWidget {
  const SingleChildListTextView({
    Key? key,
    required BuildContext context,
    required this.phraseItem,required this.conceptPhraseItem}) : super(key: key);

  final PhraseItem phraseItem,conceptPhraseItem;

  static Size size = const Size(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return FutureBuilder(
              future:buildListText([phraseItem,context,conceptPhraseItem]),
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
                    return Center(child: Text(snapshot.error!.toString()));
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
        }
  }

  Future<Widget> buildListText(data) async {

    return Wrap(
      textDirection: TextDirection.ltr,
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
              data[0].listWord.length + 1,
              (index) => index == data[0].listWord.length ? Text(
                Filter_Text.addMark(data[0].type),
                style:TextStyle(
                  color: Colors.transparent,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    BoxShadow(
                        color: Theme.of(data[1]).textTheme.headlineSmall!.color!,
                        offset: const Offset(0, 3))
                  ],
                ),
              ): text_Word(
                  word: data[0].listWord[index],
                  nextWord: index < data[0].listWord.length -1 ? data[0].listWord[index + 1] : null,
                  index: index,
               phraseItem: data[0],
              conceptPhraseItem: data[2],)
      )
      );
    // 3.pw,
    //   Text(
    //     Filter_Text.addMark(data[5]),
    //     style:TextStyle(
    //       color: Colors.transparent,
    //       fontWeight: FontWeight.bold,
    //       shadows: [
    //         BoxShadow(
    //             color: Theme.of(data[6]).textTheme.headline2!.color!,
    //             offset: Offset(0, 3))
    //       ],
    //     ),
    //   ),

  }
extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}