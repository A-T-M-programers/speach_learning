import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:speach_learning/Domain/Entity/Level.dart';
import 'package:speach_learning/Domain/Entity/PhraseItem.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/global/static/static_variable.dart';
import 'package:speach_learning/core/usecases/base_useCase.dart';
import 'package:speach_learning/core/utils/enums.dart';

part 'phrase_event.dart';

part 'phrase_state.dart';

class PhraseBloc extends Bloc<PhraseEvent, PhraseState> {
  final BaseUseCase<Level, GetLevelEvent> getLevelBaseUseCase;
  final BaseUseCase<bool, SetPhraseStateEvent> setPhraseBaseUseCase;
  final BaseUseCase<bool, SetWordStateEvent> setWordBaseUseCase;

  PhraseBloc(this.getLevelBaseUseCase,this.setPhraseBaseUseCase,this.setWordBaseUseCase) : super(const PhraseState()) {
    on<GetLevelEvent>(_getLevel);
    on<SetPhraseStateEvent>(_setPhraseState);
    on<SetWordStateEvent>(_setWordState);
    on<SearchListPhraseEvent>(_searchListPhrase);
  }

  FutureOr<void> _getLevel(GetLevelEvent event, Emitter<PhraseState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading));
    final response = await getLevelBaseUseCase(event);
    response.fold(
        (l) => emit(state.cobyWith(requestState: RequestState.error, error: l as ServerFailure)),
        (r) {
          if(r.id != 0 && r.listPhraseItem.isNotEmpty){
            try {
              checkStateAll(r, event);
            }catch(error){
              print(error);
            }
            emit(state.cobyWith(requestState: RequestState.loaded, level: r,listPhraseItem: r.listPhraseItem));
          }
        });
  }

  FutureOr<void> _setPhraseState(SetPhraseStateEvent event, Emitter<PhraseState> emit) async {
    final response = await setPhraseBaseUseCase(event);
    response.fold(
            (l) => emit(state.cobyWith(requestState: RequestState.error, error: l as ServerFailure)),
            (r) => null/*r ? add(GetLevelEvent(idLevel: event.idLevel, idParticipant: event.idParticipant)):null)*/);
  }
  FutureOr<void> _setWordState(SetWordStateEvent event, Emitter<PhraseState> emit) async {
    final response = await setWordBaseUseCase(event);
    response.fold(
            (l) => emit(state.cobyWith(requestState: RequestState.error, error: l as ServerFailure)),
            (r) => null/*r ? add(GetLevelEvent(idLevel: event.idLevel, idParticipant: event.idParticipant)):null)*/);
  }
  FutureOr<void> _searchListPhrase(SearchListPhraseEvent event, Emitter<PhraseState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading));
    emit(state.cobyWith(requestState: RequestState.loaded,listPhraseItem: event.listPhraseItem));
  }

  void checkStateAll(Level r,GetLevelEvent event) {
    if(r.listPhraseItem.isNotEmpty){
      for(var phrase in r.listPhraseItem) {
        if(phrase.listWord.isNotEmpty) {
          switch (phrase.type) {
            case "C":
              break;
            case "X":
              if (!(phrase.listWord.any((element) => element.status != "C"))) {
                add(SetPhraseStateEvent(StaticVariable.participants.id, phrase.id, "C",event.idLevel));
              }
              break;
            case "S":
              if (!(phrase.listWord.any((element) => element.status != "C"))) {
                add(SetPhraseStateEvent(StaticVariable.participants.id,phrase.id ,"C",event.idLevel));
              }
              if (!(phrase.listWord.any((element) => element.status != "C" && element.status != "X"))) {
                add(SetPhraseStateEvent(StaticVariable.participants.id,phrase.id, "X",event.idLevel));
              }
              break;
            default:
              if (!(phrase.listWord.any((element) => element.status != "C"))) {
                add(SetPhraseStateEvent(StaticVariable.participants.id, phrase.id,"C",event.idLevel));
              } else
              if (!(phrase.listWord.any((element) => element.status != "C" || element.status != "X"))) {
                add(SetPhraseStateEvent(StaticVariable.participants.id,phrase.id ,"X",event.idLevel));
              } else
              if (phrase.listWord.any((element) => element.status == "S")) {
                add(SetPhraseStateEvent(StaticVariable.participants.id, phrase.id,"X",event.idLevel));
              }
          }
        }
      }

      if(r.listPhraseItem[0].type != "S" && r.listPhraseItem[0].type != "X" && r.listPhraseItem[0].type != "C"){
        add(SetPhraseStateEvent(event.idParticipant, r.listPhraseItem[0].id, "S",event.idLevel));
      }
      if(r.listPhraseItem[0].listWord.isNotEmpty){
        if(r.listPhraseItem[0].listWord[0].status != "S" && r.listPhraseItem[0].listWord[0].status != "X" && r.listPhraseItem[0].listWord[0].status != "C"){
          add(SetWordStateEvent(r.listPhraseItem[0].listWord[0].phraseWordId, "S",event.idParticipant,event.idLevel));
        }
      }
    }
    for(int i = 1; i < r.listPhraseItem.length ;i++){
      if((r.listPhraseItem[i -1].type == "C" || r.listPhraseItem[i -1].type == "X") && r.listPhraseItem[i].type == ""){
        add(SetPhraseStateEvent(event.idParticipant, r.listPhraseItem[i].id, "S",event.idLevel));
      }else{
        if(r.listPhraseItem[i].listWord.isNotEmpty) {
          if ((r.listPhraseItem[i].listWord.length == 1 && r.listPhraseItem[i].type == "S") || (r.listPhraseItem[i].type == "S" && r.listPhraseItem[i].listWord[0].status == "")) {
            if (r.listPhraseItem[i].listWord[0].status != "S") {
              add(SetWordStateEvent(r.listPhraseItem[i].listWord[0].phraseWordId,"S", event.idParticipant,event.idLevel));
            }
          }
        }
      }
    }
  }
}
