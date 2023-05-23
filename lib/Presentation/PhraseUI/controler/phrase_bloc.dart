import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:speach_learning/Domain/Entity/Level.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/usecases/base_useCase.dart';
import 'package:speach_learning/core/utils/enums.dart';

part 'phrase_event.dart';

part 'phrase_state.dart';

class PhraseBloc extends Bloc<PhraseEvent, PhraseState> {
  final BaseUseCase<Level, GetLevelEvent> getLevelBaseUseCase;
  final BaseUseCase<bool, SetPhraseStateEvent> setPhraseBaseUseCase;

  PhraseBloc(this.getLevelBaseUseCase,this.setPhraseBaseUseCase) : super(const PhraseState()) {
    on<GetLevelEvent>(_getLevel);
    on<SetPhraseStateEvent>(_setPhraseState);
  }

  FutureOr<void> _getLevel(GetLevelEvent event, Emitter<PhraseState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading));
    final response = await getLevelBaseUseCase(event);
    response.fold(
        (l) => emit(state.cobyWith(
            requestState: RequestState.error, error: l as ServerFailure)),
        (r) => r.id != 0 ? emit(state.cobyWith(requestState: RequestState.loaded, level: r)) : null);
  }

  FutureOr<void> _setPhraseState(SetPhraseStateEvent event, Emitter<PhraseState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading));
    final response = await setPhraseBaseUseCase(event);
    response.fold(
            (l) => emit(state.cobyWith(
            requestState: RequestState.error, error: l as ServerFailure)),
            (r) => r ? add(GetLevelEvent(idLevel: state.level.id, idParticipant: event.idPhrase)):null);
  }
}
