import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}

const languages = [
  Language('English', 'en_US'),
  Language('Hindi', 'hi'),
  Language('Francais', 'fr_FR'),
  Language('Pусский', 'ru_RU'),
  Language('Italiano', 'it_IT'),
  Language('Español', 'es_ES'),
];

enum TtsState { playing, stopped, paused, continued }

class Text_To_Speech{
  late List<String> t;
  late FlutterTts flutterTts;
  String? language;
  String? engine;
  double volume = 1.0;
  double pitch = 1.7;
  double rate = 0.44100;
  bool isCurrentLanguageInstalled = false;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;

  get isPaused => ttsState == TtsState.paused;

  get isContinued => ttsState == TtsState.continued;

  bool get isIOS => !kIsWeb && Platform.isIOS;

  bool get isAndroid => !kIsWeb && Platform.isAndroid;

  bool get isWindows => !kIsWeb && Platform.isWindows;

  bool get isWeb => kIsWeb;

  String transcription = '';

  //String _currentLocale = 'en_US';
  Language selectedLang = languages.first;

  List<Object?>? voices;

  List<String>? jsonVoices;

  List? availVoices;

  initTts() {
    flutterTts = FlutterTts();

    _setAwaitOptions();

    if (isAndroid) {
      _getDefaultEngine();
      _getDefaultVoice();
    }

    flutterTts.setStartHandler(() {
        print("Playing");
        ttsState = TtsState.playing;
    });

    flutterTts.setCompletionHandler(() {
        print("Complete");
        ttsState = TtsState.stopped;
    });

    flutterTts.setCancelHandler(() {
        print("Cancel");
        ttsState = TtsState.stopped;
    });

    flutterTts.setPauseHandler(() {
        print("Paused");
        ttsState = TtsState.paused;
    });

    flutterTts.setContinueHandler(() {
        print("Continued");
        ttsState = TtsState.continued;
    });

    flutterTts.setErrorHandler((msg) {
        print("error: $msg");
        ttsState = TtsState.stopped;
    });
  }

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
    }
  }

  Future _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {
    }
    voices = await flutterTts.getVoices;
    jsonVoices = voices!.map((e) => jsonEncode(e)).toList();
    availVoices = jsonVoices!.map((e) => jsonDecode(e)).toList();
  }

  Future speak(String? textVoice,Map<String,String> voice) async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    await flutterTts.setLanguage("en_US");
    await flutterTts.setVoice(voice);

    if (textVoice != null) {
      if (textVoice.isNotEmpty) {
        await flutterTts.speak(textVoice);
      }
    }
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }
  stop(){
    flutterTts.stop();
  }

}