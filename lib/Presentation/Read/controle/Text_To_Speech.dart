import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speach_learning/Domain/Entity/Dialects.dart';

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

class TextToSpeech{
  FlutterTts flutterTts = FlutterTts();
  String? engine;
  double volume = 1.0;
  double pitch = 1.0;
  double rate = 0.44300;
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

    _setAwaitOptions();

    if (isAndroid) {
      _getDefaultEngine();
      _getDefaultVoice();
    }

    flutterTts.setStartHandler(() {
        ttsState = TtsState.playing;
    });

    flutterTts.setCompletionHandler(() {
        ttsState = TtsState.stopped;
    });

    flutterTts.setCancelHandler(() {
        ttsState = TtsState.stopped;
    });

    flutterTts.setPauseHandler(() {
        ttsState = TtsState.paused;
    });

    flutterTts.setContinueHandler(() {
        ttsState = TtsState.continued;
    });

    flutterTts.setErrorHandler((msg) {
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

  Future speak(String? textVoice,Dialects dialects) async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    await flutterTts.setLanguage(dialects.locale);
    await flutterTts.setVoice({"name":dialects.key, "locale":dialects.locale});

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