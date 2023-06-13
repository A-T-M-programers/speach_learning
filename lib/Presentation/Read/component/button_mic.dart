import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Domain/Entity/PhraseItem.dart';
import 'package:speach_learning/Presentation/Read/controle/Speech_To_Text.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/core/utils/enums.dart';

class ButtonMic extends StatelessWidget {
  const ButtonMic({Key? key,required this.speechToText,required this.phraseItem}) : super(key: key);

  final SpeechToTextClass speechToText;
  final PhraseItem phraseItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadBloc,ReadState>(
      buildWhen: (previous, current) {
        if(previous.requestState != current.requestState){
          switch(current.readPageStateBuild){
            case ReadPageStateBuild.main:
              return true;
            case ReadPageStateBuild.level1:
              return false;
            case ReadPageStateBuild.level2:
              return false;
            case ReadPageStateBuild.level3:
              return true;
            case ReadPageStateBuild.level4:
              return false;
          }
        }
        return false;
      },
      builder: (context,state){
          return Stack(
            children: <Widget>[
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    color: const Color(0xffd4af37),
                    borderRadius:const BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    border: Border.all(
                        width: 1.0, color: const Color(0xffd4af37)),
                    boxShadow: const [
                      BoxShadow(color: Colors.white70, blurRadius: 10)
                    ]),
              ),
        SizedBox(
        width: 48 ,
        height: 32.0,
        child: IconButton(
            icon:const Icon(Icons.mic,color: Colors.white70,size: 30,),
            onPressed: () {
                speechToText.startListening(phraseItem: phraseItem,context: context);
            },
            style: ButtonStyle(
              alignment: Alignment.centerLeft,
                padding: MaterialStateProperty.all(const EdgeInsets.all(0.0)),
                backgroundColor: MaterialStateProperty.all(Colors.transparent)
            ),
          ))]);
    },);
  }
}
