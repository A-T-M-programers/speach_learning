import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:speach_learning/Read/bloc/Bloc_Controler_Read.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



// ignore: camel_case_types
class Speech_To_Text{

  late BuildContext bc;

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
  Map<String,String> type = {};
  List<LocaleName> _localeNames = [];
  List<String> wordsProblem = [];
  final SpeechToText speech = SpeechToText();

  int indexword = 0;

  // ignore: non_constant_identifier_names
  List<Map<String, String>>? text_read;

  // ignore: non_constant_identifier_names
  Speech_To_Text({required this.text_read});

  Future<void> initSpeechState() async {
    _logEvent('Initialize');
    try {
      var hasSpeech = await speech.initialize(
        onError: errorListener,
        onStatus: statusListener,
        debugLogging: _logEvents,
      );
      if (hasSpeech) {
        // Get the list of languages installed on the supporting platform so they
        // can be displayed in the UI for selection by the user.
        _localeNames = await speech.locales();

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

  void startListening(BuildContext buildContext) {
    bc = buildContext;
    _logEvent('start listening');
    lastWords = '';
    lastError = '';
    speech.listen(
        onResult: resultListener,
        listenFor: const Duration(seconds: 10),
        pauseFor: const Duration(seconds: 5),
        partialResults: true,
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        listenMode: ListenMode.confirmation,
        onDevice: _onDevice,
        sampleRate: 1
    );
  }

  void stopListening() {
    _logEvent('stop');
    speech.stop();
      level = 0.0;
      hasSpeech = false;
  }

  void cancelListening() {
    _logEvent('cancel');
    speech.cancel();
      level = 0.0;
    hasSpeech = false;
  }

  /// This callback is invoked each time new recognition results are
  /// available after `listen` is called.
  void resultListener(SpeechRecognitionResult result) {
    _logEvent(
        'Result listener final: ${result.finalResult}, words: ${result.recognizedWords}');
      lastWords = '${result.recognizedWords} - ${result.finalResult}';
      List<String> l = result.recognizedWords.split(" ");
      String checkWord = text_read![indexword]["Name"]!.toLowerCase().split(',')[0];
      if (text_read!.isNotEmpty && checkWord == l.last.toLowerCase()) {
        text_read![indexword]["type"] = "1";
        type = {"Name":text_read![indexword]["Name"]!,"type":text_read![indexword]["type"]!};
        indexword++;
        text_read![indexword]["type"] = "3";
        cancelListening();
        bc.read<Bloc_Controler>().chang_color_Word(type);
      } else if (result.finalResult && text_read!.isNotEmpty && checkWord != l.last.toLowerCase()) {
        text_read![indexword]["type"] = "0";
        type = {"Name":text_read![indexword]["Name"]!,"type":text_read![indexword]["type"]!,"Problem":"Match","ProblemWord":l.last};
        wordsProblem.addAll([checkWord,l.last.toLowerCase(),"Their No Match"]);
        bc.read<Bloc_Controler>().chang_color_Word(type);
      }
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    // _logEvent('sound level $level: $minSoundLevel - $maxSoundLevel ');
    this.level = level;
    bc.read<Bloc_Controler>().chang_level(level);
  }

  void errorListener(SpeechRecognitionError error) {
    _logEvent(
        'Received error status: $error, listening: ${speech.isListening}');
    lastError = '${error.errorMsg} - ${error.permanent}';
    // ignore: avoid_print
    print(lastError);
    hasSpeech = false;
    switch(error.errorMsg){
      case 'error_network':
        type = {"Problem":"err_Network"};
        break;
      case 'error_speech_timeout':
        type = {"Problem":"err_speech"};
        break;
      case 'error_no_match':
        type = {"Problem":"err_speech"};
        break;
    }
    bc.read<Bloc_Controler>().chang_color_Word(type);
  }

  void statusListener(String status) {
    _logEvent(
        'Received listener status: $status, listening: ${speech.isListening}');
    // ignore: unnecessary_string_interpolations
    lastStatus = '$status';
  }

  void _logEvent(String eventDescription) {
    if (_logEvents) {
      var eventTime = DateTime.now().toIso8601String();
      // ignore: avoid_print
      print('$eventTime $eventDescription');
    }
  }

}