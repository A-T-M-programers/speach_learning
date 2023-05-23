import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:speach_learning/Domain/Entity/Participants.dart';
import 'package:speach_learning/Domain/UseCase/participant_usecase.dart';
import 'package:speach_learning/core/usecases/base_useCase.dart';
import 'package:speach_learning/core/utils/enums.dart';

part 'log_in_event.dart';

part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final BaseUseCase<int,GetParticipantIdEvent> baseUseCase;
  final BaseUseCase<int,GetParticipantWithEmailEvent> getParticipantWithEmailBaseUseCase;

  LogInBloc(this.baseUseCase, this.getParticipantWithEmailBaseUseCase) : super(const LogInState()) {
    on<GetParticipantIdEvent>(_getParticipantId);
    on<GetParticipantWithEmailEvent>(_getParticipantWithEmail);
  }

  FutureOr<void> _getParticipantId(GetParticipantIdEvent event, Emitter<LogInState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading));
    final response = await baseUseCase(event);
    response.fold(
        (l) => emit(state.cobyWith(requestState: RequestState.error, message: l.message)),
        (r) => emit(state.cobyWith(requestState: RequestState.loaded, participantsId: r)));
  }

  FutureOr<void> _getParticipantWithEmail(GetParticipantWithEmailEvent event, Emitter<LogInState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading));
    final response = await getParticipantWithEmailBaseUseCase(event);
    response.fold(
            (l) => emit(state.cobyWith(requestState: RequestState.error, message: l.message)),
            (r) => emit(state.cobyWith(requestState: RequestState.loaded, participantsId: r)));

  }
}
