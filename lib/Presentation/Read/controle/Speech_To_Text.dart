import 'dart:math';
import 'package:flutter/material.dart';
import 'package:speach_learning/Domain/Entity/PhraseItem.dart';
import 'package:speach_learning/Domain/Entity/Word.dart';
import 'package:speach_learning/Presentation/Read/bloc/Bloc_Controler_Read.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: camel_case_types
class Speech_To_Text {
  BuildContext bc;

  bool hasSpeech = false;
  final bool _logEvents = false;
  final bool _onDevice = false;
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastWords = '';
  String lastError = '';
  String lastStatus = '';
  String _currentLocaleId = '';
  List<String> wordsProblem = [];
  final SpeechToText speech = SpeechToText();

  int indexword = 0;
  int indexPhrase = 0;

  // ignore: non_constant_identifier_names
  PhraseItem? phraseItem;
  Word? word;
  Word? nextWord;

  // ignore: non_constant_identifier_names
  Speech_To_Text({this.word,this.nextWord,this.phraseItem, required this.bc});

  void setTextRead(PhraseItem phraseItem){
    this.phraseItem = phraseItem;
  }

  Future<void> initSpeechState() async {
    // _logEvent('Initialize');
    try {
      var hasSpeech = await speech.initialize(
        onError: errorListener,
        onStatus: statusListener,
        debugLogging: _logEvents,
      );
      if (hasSpeech) {
        // Get the list of languages installed on the supporting platform so they
        // can be displayed in the UI for selection by the user.

        var systemLocale = await speech.systemLocale();
        _currentLocaleId = systemLocale?.localeId ?? '';
      }
      this.hasSpeech = hasSpeech;
    } catch (e) {
      lastError = 'Speech recognition failed: ${e.toString()}';
      // ignore: unnecessary_this
      this.hasSpeech = false;
    }
  }

  void startListening() {
    // indexPhrase = 0;
    indexword = 0;
      // for (var phrase in phraseItem!) {
      //   indexword = 0;
      //   for (var word in phrase.listWord) {
      //     // if (word.uwrb.type == "1" || word.uwrb.type == "4") {
      //     //   indexword++;
      //     // }
      //   }
      //   if (indexword == phrase.wordCount && indexPhrase < text_read!.length) {
      //     indexPhrase++;
      //   }
      // }
        if (indexword == phraseItem!.listWord.length) {
          indexword = 0;
        }
    // _logEvent('start listening');
    lastWords = '';
    lastError = '';
    speech.errorListener = errorListener;
    speech.listen(
        onResult: resultListener,
        listenFor: const Duration(seconds: 10),
        pauseFor: const Duration(seconds: 4),
        partialResults: true,
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        listenMode: ListenMode.search,
        onDevice: _onDevice,
        sampleRate: 44100);
  }

  void stopListening() async {
    // _logEvent('stop');
    await speech.stop();
    level = 0.0;
    hasSpeech = false;
  }

  void cancelListening() async {
    // _logEvent('cancel');
    await speech.cancel();
    level = 0.0;
    hasSpeech = false;
  }

  /// This callback is invoked each time new recognition results are
  /// available after `listen` is called.
  void resultListener(SpeechRecognitionResult result) {
    // _logEvent('Result listener final: ${result.finalResult}, words: ${result.recognizedWords}');
    //check all words in the list text_read
    if(result.recognizedWords != "") {
      // if (phraseItem.listWord. && indexPhrase < text_read!.length) {
        lastWords = '${result.recognizedWords} - ${result.finalResult}';
        List<String> l = result.recognizedWords.split(" ");
        Word checkWord = phraseItem!.listWord[indexword];
        if (phraseItem!.listWord.isNotEmpty && checkWord.content.toLowerCase() == l.last.toLowerCase()) {
          // if (checkWord.uwrb.type == "1" && result.finalResult) {
          //   ScaffoldMessenger.of(bc).showSnackBar(SnackBar(content: const Text("excellent", style: TextStyle(color: Colors.white70),).tr(), backgroundColor: Colors.black87,));
          //   return;
          // } else if (checkWord.uwrb.type != "1") {
          //   callBlockUpdateState({"id-Word": checkWord.id, "type": "1" /*,"Problem":"excellent"*/});
          //   bc.read<Bloc_CheckLevel>().CheckLevel({"id-Word":checkWord.id});
          // }
          indexword++;
          if (indexword < phraseItem!.listWord.length) {
            Word nextWord = phraseItem!.listWord[indexword];
            // if(nextWord.uwrb.type != "1") {
            //   callBlockUpdateState({"id-Word": nextWord.id, "type": "3"});
            // }
          }
          // else if (indexPhrase < (phraseItem.length - 1)) {
          //   indexPhrase++;
          //   indexword = 0;
          //   Word nextWord = text_read![indexPhrase].listWord[indexword];
          //   // if(nextWord.uwrb.type != "1") {
          //   //   callBlockUpdateState({
          //   //     "id-Word": nextWord.id,
          //   //     "type": "3",
          //   //     "index-Phrase-Plus": '$indexPhrase'
          //   //   });
          //   // }else{
          //   //   callBlockUpdateState({"index-Phrase-Plus": '$indexPhrase'});
          //   // }
          // }
          else {
            callBlockUpdateState({"Problem": "final"});
            cancelListening();
          }
        } else if (phraseItem!.listWord.isNotEmpty && checkWord.content.toLowerCase() != l.last.toLowerCase() && l.last != "") {
          Word previos = phraseItem!.listWord[indexword - 1];
          // if (result.finalResult && checkWord.uwrb.type == "3" && previos.content.toLowerCase() == l.last) {
          //   callBlockUpdateState({
          //     "Name": previos.content,
          //     "id-Word": previos.id,
          //     // "type": previos.uwrb.type,
          //     "Problem": "continue"
          //   });
          //   return;
          // }
          callBlockUpdateState({
            "Name": checkWord.content,
            "id-Word": checkWord.id.toString(),
            "type": "0",
            "Problem": "Match",
            "ProblemWord": l.last
          });
          cancelListening();
        }
      // }
      //check only one word
      // else if (word != null) {
      //   lastWords = '${result.recognizedWords} - ${result.finalResult}';
      //   List<String> l = result.recognizedWords.split(" ");
      //   if (word!.content.toLowerCase() == l.last.toLowerCase()) {
      //     // if (word!.uwrb.type == "1") {
      //     //   ScaffoldMessenger.of(bc).showSnackBar(SnackBar(content: Text("excellent", style: TextStyle(color: Theme.of(bc).textTheme.headline2!.color),).tr(), backgroundColor: Theme.of(bc).dialogBackgroundColor,));
      //     //   return;
      //     // }
      //     callBlockUpdateState({
      //       "id-Word": word!.id.toString(),
      //       "type": "1" /*,"Problem":"excellent"*/,
      //     });
      //     bc.read<Bloc_CheckLevel>().CheckLevel({"id-Word":word!.id.toString()});
      //     // if (nextWord != null && nextWord!.uwrb.type != "1") {
      //     //   callBlockUpdateState({"id-Word": nextWord!.id, "type": "3"});
      //     // } else {
      //     //   callBlockUpdateState({"Problem": "final"});
      //     //   cancelListening();
      //     // }
      //   } else if (word!.content.toLowerCase() != l.last.toLowerCase() &&
      //       l.last != "") {
      //     callBlockUpdateState({
      //       "Name": word!.content,
      //       "id-Word": word!.id.toString(),
      //       "type": "0",
      //       "Problem": "Match",
      //       "ProblemWord": l.last
      //     });
      //     cancelListening();
      //   }
      // }
    }
  }

  void callBlockUpdateState(Map<String, dynamic> state) {
    bc.read<Bloc_chang_color_Word>().chang_color_Word(state);
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    // _logEvent('sound level $level: $minSoundLevel - $maxSoundLevel ');
    this.level = level;
    bc.read<Bloc_Controler>().chang_level(level);
  }

  void errorListener(SpeechRecognitionError error) {
    // _logEvent('Received error status: $error, listening: ${speech.isListening}');
    lastError = '${error.errorMsg} - ${error.permanent}';
    showError(error.errorMsg);
  }

  void showError(String lastError) {
    // ignore: avoid_print
    print(lastError);
    try {
      switch (lastError) {
        case 'error_network':
          callBlockUpdateState({"Problem": "err_Network"});
          break;
        case 'error_speech_timeout':
          callBlockUpdateState({"Problem": "err_speech"});
          break;
        case 'error_no_match':
          callBlockUpdateState({"Problem": "err_speech"});
          break;
      }
      hasSpeech = false;
    } catch (e, s) {
      // ignore: avoid_print
      print(s);
    }
  }

  void statusListener(String status) {
    // _logEvent('Received listener status: $status, listening: ${speech.isListening}');
    // ignore: unnecessary_string_interpolations
    lastStatus = '$status';
  }

// void _logEvent(String eventDescription) {
//   if (_logEvents) {
//     var eventTime = DateTime.now().toIso8601String();
//     // ignore: avoid_print
//     print('$eventTime $eventDescription');
//   }
// }
}
