import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:speach_learning/Domain/Entity/Dialects.dart';
import 'package:speach_learning/Presentation/Read/controle/Text_To_Speech.dart';
import 'package:speach_learning/core/services/services_locator.dart';

class ButtonVoice extends StatelessWidget {
  const ButtonVoice({Key? key , required this.text,required this.dialects}) : super(key: key);

  final String text ;
  final Dialects dialects;

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: const Color(0xffd4af37)
              ),
              child: IconButton(
            icon:const Icon(Icons.volume_up_rounded),
            iconSize: 30.0,
            color: Colors.white70,
            onPressed: (){
              try {
                sl<TextToSpeech>().speak(text,dialects);
              } catch (e, s) {
                if (kDebugMode) {
                  print(s);
                }
              }
            },));
  }
}
