import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/usecases/base_useCase.dart';
import 'package:speach_learning/core/utils/enums.dart';

part 'read_event.dart';
part 'read_state.dart';

class ReadBloc extends Bloc<ReadEvent, ReadState> {
  final BaseUseCase<bool, SetWordStateEvent> setWordBaseUseCase;

  ReadBloc(this.setWordBaseUseCase) : super(const ReadState()) {
    on<SetWordStateEvent>(_setWordState);
    on<EmptyEvent>(_setEmptyEvent);
  }

  FutureOr<void> _setWordState(SetWordStateEvent event, Emitter<ReadState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading));
    final response = await setWordBaseUseCase(event);
    response.fold(
            (l) => emit(state.cobyWith(requestState: RequestState.error,error: l as ServerFailure)),
            (r) => r ? emit(state.cobyWith(requestState: RequestState.loaded)) : null);
  }

  FutureOr<void> _setEmptyEvent(EmptyEvent event, Emitter<ReadState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loaded));
  }
}
