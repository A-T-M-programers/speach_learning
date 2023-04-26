import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:speach_learning/Domain/Entity/Dialects.dart';
import 'package:speach_learning/Domain/Entity/Participants.dart';
import 'package:speach_learning/Domain/UseCase/participant_usecase.dart';
import 'package:speach_learning/core/utils/enums.dart';

part 'log_in_event.dart';

part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final ParticipantUseCase participantUseCase;

  LogInBloc(this.participantUseCase) : super(const LogInState()) {
    on<GetParticipantIdEvent>(_getParticipantId);
  }

  FutureOr<void> _getParticipantId(GetParticipantIdEvent event, Emitter<LogInState> emit) async {
    final response = await participantUseCase.executeGetParticipantId();
    response.fold(
        (l) => emit(state.cobyWith(requestState: RequestState.error, message: l.message)),
        (r) => emit(state.cobyWith(requestState: RequestState.loaded, participantsId: r)));
  }
}
