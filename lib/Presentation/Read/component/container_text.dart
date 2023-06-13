import 'package:flutter/material.dart';
import 'package:speach_learning/Domain/Entity/PhraseItem.dart';
import 'package:speach_learning/Presentation/Read/Widget/SingleChildListTextView.dart';

class ContainerText extends StatelessWidget {
  const ContainerText({Key? key,required this.currentPhraseItem,required this.conceptPhraseItem}) : super(key: key);

  final PhraseItem currentPhraseItem,conceptPhraseItem;

  static Size size = const Size(0.0, 0.0);
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Center(
      heightFactor: 1,
      child: Container(
        height: size.height * 0.30,
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
        child: SingleChildListTextView(
          phraseItem: currentPhraseItem,
          context: context,
          conceptPhraseItem: conceptPhraseItem,
        ),
      ),
    );
  }
}
