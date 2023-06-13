import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/Read/controler/voice_bloc.dart';
import 'package:speach_learning/core/utils/enums.dart';

class ContainerSpeechText extends StatelessWidget {
  ContainerSpeechText({Key? key}) : super(key: key){
    phrase = "";
  }

  static String phrase = "";

  static Size size = const Size(0.0, 0.0);
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BlocBuilder<VoiceBloc,VoiceState>(
      buildWhen: (previous, current) {
        if(current.requestState == RequestState.loaded && current is ChangePhraseVoiceState){
          if(current.phrase.isNotEmpty){
            phrase = current.phrase;
            return true;
          }
        }
        return false;
      },
      builder: (context,state){
      switch(state.requestState){
        case RequestState.loading:
          return const SizedBox();
        case RequestState.loaded:
         return Center(
            heightFactor: 1,
            child: Container(
              height: size.height * 0.1,
              margin:EdgeInsets.only(top: 36.0 + (size.height * 0.3)),
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
              child: Text(phrase,textDirection: TextDirection.ltr,style: TextStyle(color: Theme.of(context).textTheme.headlineSmall!.color,fontSize: 18.0,fontWeight: FontWeight.w600),)
            ),
          );
        case RequestState.error:
          return const SizedBox();
      }
    },);
  }
}
