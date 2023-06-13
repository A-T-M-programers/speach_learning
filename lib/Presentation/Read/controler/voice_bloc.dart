import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/utils/enums.dart';

part 'voice_event.dart';
part 'voice_state.dart';

class VoiceBloc extends Bloc<VoiceEvent, VoiceState> {
  VoiceBloc() : super(VoiceInitial()) {
    on<SetWordStateDuringVoiceEvent>(_setWordStateDuringVoice);
    on<GetRateDuringVoiceEvent>(_getRateDuringVoice);
    on<SetPhraseVoiceEvent>(_setPhraseDuringVoice);
  }

  FutureOr<void> _setWordStateDuringVoice(SetWordStateDuringVoiceEvent event, Emitter<VoiceState> emit) async {
    emit(const ChangeColorWordState(requestState: RequestState.loading));
    emit(ChangeColorWordState(requestState: RequestState.loaded,idWord: event.idWord,state: event.state));
  }
  FutureOr<void> _getRateDuringVoice(GetRateDuringVoiceEvent event, Emitter<VoiceState> emit) async {
    emit(const ChangeRateVoiceState(requestState: RequestState.loading));
    emit(ChangeRateVoiceState(requestState: RequestState.loaded,rate: event.rate));
  }

  FutureOr<void> _setPhraseDuringVoice(SetPhraseVoiceEvent event, Emitter<VoiceState> emit) async {
    emit(ChangePhraseVoiceState(requestState: RequestState.loaded,phrase: event.phrase));
  }

  @override
  Future<Function> close() async {
    print("Closed");
    super.close();
    return close();
  }
}
