import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:speach_learning/Domain/Entity/PhraseItem.dart';
import 'package:speach_learning/Domain/Entity/Word.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/Presentation/Read/controler/voice_bloc.dart';
import 'package:speach_learning/core/global/static/Filter_Text.dart';
import 'package:speach_learning/core/global/static/static_variable.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpeechToTextClass {
  late BuildContext bc;

  bool hasSpeech = false;
  final bool _logEvents = false;
  final bool _onDevice = false;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastError = '';
  String lastStatus = '';
  String lastWords = '',
      completeWord = '';
  String _currentLocaleId = '';
  List<String> wordsProblem = [];
  final SpeechToText speech = SpeechToText();

  int indexword = 0,
      indexCompoundPhrase = 0;

  PhraseItem? phraseItem;
  List<String> listCompoundPhrase = [];
  Map<int, String> mapUpdateStateWord = {};
  Word? word;
  Word? nextWord;

  SpeechToTextClass();

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

        var systemLocale = await speech.systemLocale();
        _currentLocaleId = systemLocale?.localeId ?? '';
      }
      this.hasSpeech = hasSpeech;
    } catch (e) {
      lastError = 'Speech recognition failed: ${e.toString()}';
      hasSpeech = false;
    }
  }

  void startListening(
      {PhraseItem? phraseItem, Word? word, Word? nextWord, BuildContext? context}) {
    this.phraseItem = phraseItem ?? this.phraseItem;
    this.word = word ?? this.word;
    bc = context ?? bc;
    this.nextWord = nextWord ?? this.nextWord;
    indexword = 0;
    if (this.phraseItem != null) {
      if (this.phraseItem!.listWord.any((element) => element.status != "C")) {
        for (var wordElement in this.phraseItem!.listWord) {
          if (wordElement.status != "C" && wordElement.status != "X") {
            break;
          }
          indexword++;
        }
      }
      if (indexword == this.phraseItem!.listWord.length) {
        indexword = 0;
      }
    }
    _logEvent('start listening');
    lastError = '';
    lastWords = '';
    speech.errorListener = errorListener;
    speech.listen(
        onResult: resultListener,
        listenFor: const Duration(seconds: 10),
        pauseFor: const Duration(seconds: 4),
        partialResults: true,
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        listenMode: ListenMode.confirmation,
        onDevice: _onDevice,
        sampleRate: 22050);
  }

  bool isInit() {
    return speech.isAvailable && (phraseItem != null || word != null);
  }

  void stopListening() async {
    _logEvent('stop');
    await speech.stop();
    hasSpeech = false;
  }

  void cancelListening() async {
    _logEvent('cancel');
    await speech.cancel();
    hasSpeech = false;
  }

  void isSuccessWord(String wordCheck) {
    int index = -1;
    List<int> listIndex = [];
    for (Word word in phraseItem!.listWord) {
      if (wordCheck.split(" ").where((element) => element.trim().toLowerCase() == Filter_Text.isCompoundPhrase(word.content.trim()).toLowerCase() || (Filter_Text.isCompoundPhrase(word.content).toLowerCase().split(" ").length > 1) && wordCheck.contains(Filter_Text.isCompoundPhrase(word.content).toLowerCase())).isNotEmpty ||
          wordCheck.trim().toLowerCase() == Filter_Text.isCompoundPhrase(word.content).toLowerCase()) {
        if (word.status != "C") {
          if(completeWord.isNotEmpty) {
            completeWord += " " + Filter_Text.isCompoundPhrase(word.content).toLowerCase();
          }else{
            completeWord += Filter_Text.isCompoundPhrase(word.content).toLowerCase();
          }
          setStateWord(word.phraseWordId, "C");
          indexword = phraseItem!.listWord.indexWhere((element) => element.phraseWordId == word.phraseWordId);
          indexword++;
          if (phraseItem!.listWord.length > indexword && indexword > phraseItem!.listWord.lastIndexWhere((element) => element.status == 'C' || element.status == 'X')) {
            if (phraseItem!.listWord[indexword].status != "S") {
              setStateWord(phraseItem!.listWord[indexword].phraseWordId, "S");
            }
          }
          index = phraseItem!.listWord.indexWhere((element) => element.phraseWordId == word.phraseWordId);
          if(!listIndex.contains(index)) {
            listIndex.add(index);
          }
        }
      } else {
        if (indexword + 1 >= phraseItem!.listWord.indexWhere((element) => element.phraseWordId == word.phraseWordId) && word.status != "C" && word.status != "X" && word.status != "F") {
          setStateWord(word.phraseWordId, "F");
        }
      }
    }
    listIndex.sort();
    listIndex = listIndex.reversed.toList();
    for(int i in listIndex){
      if(phraseItem!.listWord.length >= i){
        phraseItem!.listWord.removeAt(i);
      }
    }
  }

  /// This callback is invoked each time new recognition results are
  /// available after `listen` is called.
  void resultListener(SpeechRecognitionResult result) {
    _logEvent('Result listener final: ${result.finalResult}, words: ${result
        .recognizedWords}');
    //check all words in the list text_read
    bc.read<VoiceBloc>().add(SetPhraseVoiceEvent(result.recognizedWords));
    result.recognizedWords.split(" ").removeWhere((element) => completeWord.split(" ").toList().any((elementComplete) => elementComplete == element));
    if (result.recognizedWords.isNotEmpty && lastWords != result.recognizedWords) {
      if (phraseItem != null && indexword < phraseItem!.listWord.length) {
        isSuccessWord(result.recognizedWords.replaceAll(RegExp(completeWord.split(" ").toList().join("|")), ""));
        if (result.finalResult) {
          checkSuccess();
        }
      }
      // check only one word
      else if (word != null) {
        List<String> l = result.recognizedWords.split(" ");
        if (Filter_Text.isCompoundPhrase(word!.content).toLowerCase() == l.last.toLowerCase()) {
          if (word!.status == "C") {
            ScaffoldMessenger.of(bc).showSnackBar(SnackBar(content: Text("excellent", style: TextStyle(color: Theme.of(bc).textTheme.headlineSmall!.color),).tr(), backgroundColor: Theme.of(bc).dialogBackgroundColor,));
            return;
          } else {
            setSingleWordState(word!, "C");
          }
          if (nextWord != null && nextWord!.status != "C") {
            nextWord!.setState("S");
            bc.read<ReadBloc>().add(SetWordStateEvent(nextWord!.phraseWordId, "S", StaticVariable.participants.id,0));
          }
        } else if (word!.content.toLowerCase() != l.last.toLowerCase() && l.last != "") {
          indexCompoundPhrase = 0;
          listCompoundPhrase = [];
          if (word!.status != "F") {
            setSingleWordState(word!, "F");
          }
          setProblemVoice({
            "Name": word!.content,
            "Problem": "match",
            "ProblemWord": l.last
          });
        }
        cancelListening();
      }
      lastWords = result.recognizedWords;
    }
  }

  void setProblemVoice(Map<String, String> voiceError) {
    bc.read<ReadBloc>().add(ShowBottomSheetEvent(voiceError));
  }

  void setSingleWordState(Word word, String state) {
    word.setState(state);
    if (phraseItem != null) {
      if (phraseItem!.listWord.any((element) =>
      element.phraseWordId == word.phraseWordId && ((element.status != "C" && state == "C") ||
          (element.status != "C" && element.status != "X" && state == "X") ||
          (element.status != "C" && element.status != "X" &&
              element.status != "S" && state == "S")))) {
        bc.read<ReadBloc>().add(SetWordStateEvent(word.phraseWordId, state, StaticVariable.participants.id,0));
      }
    }
    bc.read<VoiceBloc>().add(SetWordStateDuringVoiceEvent(word.phraseWordId, state));
  }

  void checkSuccess() {
    try {
      int successRate = (phraseItem!.listWord.length * 80) ~/ 100;
      int actualSuccessRate = phraseItem!.listWord.where((element) => element.status == "C").length;
      int actualSkippedRate = phraseItem!.listWord.where((element) => element.status == "C" || element.status == "X").length;
      print(mapUpdateStateWord);
      if (mapUpdateStateWord.isNotEmpty) {
        if (successRate <= actualSuccessRate) {
          if (phraseItem!.type != "C") {
            phraseItem!.setType("C");
            bc.read<ReadBloc>().add(SetListWordAndPhraseStateEvent(StaticVariable.participants.id, "C", phraseItem!.id, mapUpdateStateWord));
          }else{

          }
          setProblemVoice({"Problem": "final"});
        } else if (successRate <= actualSkippedRate) {
          if (phraseItem!.type != "X" && phraseItem!.type != "C") {
            phraseItem!.setType("X");
            bc.read<ReadBloc>().add(SetListWordAndPhraseStateEvent(
                StaticVariable.participants.id, "X", phraseItem!.id,
                mapUpdateStateWord));
          }
          setProblemVoice({"Problem": "skipped"});
        } else if (phraseItem!.type != "S" && phraseItem!.type != "X" &&
            phraseItem!.type != "C") {
          phraseItem!.setType("S");
          bc.read<ReadBloc>().add(SetListWordAndPhraseStateEvent(
              StaticVariable.participants.id, "S", phraseItem!.id,
              mapUpdateStateWord));
        } else if (mapUpdateStateWord.values.any((element) => element == "F")) {
          setProblemVoice({
            "Problem": "tryAgain",
            "method": "try"
          });
        }
        mapUpdateStateWord = {};
      }
    } catch (error) {
      print(error.toString());
    }
  }

  void setStateWord(int idWord, String state) {
    // if(phraseItem!.type != "C" && (phraseItem!.type =="X" && !phraseItem!.listWord.any((element) => element.id == idWord && element.status != "C") && (state == "C"))){
    if (phraseItem!.listWord.any((element) => !(element.phraseWordId == idWord && element.status == "C") && ((element.phraseWordId == idWord && element.status == "X" && state == "C") || (element.phraseWordId == idWord && element.status == "S" && (state == "C" || state == "X")) || (element.phraseWordId == idWord && element.status == "") || (element.phraseWordId == idWord && element.status == "F" && state != "F")))) {
      if (mapUpdateStateWord.containsKey(idWord)) {
        mapUpdateStateWord.update(idWord, (value) => state);
      } else {
        mapUpdateStateWord.addAll({idWord: state});
      }
    }
    // }
    bc.read<VoiceBloc>().add(SetWordStateDuringVoiceEvent(idWord, state));
  }

  void soundLevelListener(double level) {
    bc.read<VoiceBloc>().add(GetRateDuringVoiceEvent(level));
  }

  void errorListener(SpeechRecognitionError error) {
    _logEvent(
        'Received error status: $error, listening: ${speech.isListening}');
    lastError = '${error.errorMsg} - ${error.permanent}';
    showError(error.errorMsg);
  }

  void showError(String lastError) {
    // ignore: avoid_print
    print(lastError);
    try {
      setProblemVoice({"Problem": lastError});
      hasSpeech = false;
    } catch (e, s) {
      // ignore: avoid_print
      print(s);
    }
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
