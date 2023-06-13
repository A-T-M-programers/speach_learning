import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:speach_learning/Domain/Entity/Participants.dart';
import 'package:speach_learning/core/usecases/base_useCase.dart';
import 'package:speach_learning/core/utils/enums.dart';

part 'log_in_event.dart';

part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final BaseUseCase<int,GetParticipantIdEvent> baseUseCase;
  final BaseUseCase<int,GetParticipantWithEmailEvent> getParticipantWithEmailBaseUseCase;
  final BaseUseCase<String, GetTokenEvent> getTokenBaseUseCase;
  final BaseUseCase<String, CheckIsSuccessLogInEvent> getPermittingBaseUseCase;

  LogInBloc(
      this.baseUseCase,
      this.getParticipantWithEmailBaseUseCase,
      this.getTokenBaseUseCase,
      this.getPermittingBaseUseCase) : super(const LogInState()) {
    on<GetParticipantIdEvent>(_getParticipantId);
    on<GetParticipantWithEmailEvent>(_getParticipantWithEmail);
    on<GetTokenEvent>(_getToken);
    on<CheckIsSuccessLogInEvent>(_getPermitting);
  }

  FutureOr<void> _getParticipantId(GetParticipantIdEvent event, Emitter<LogInState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading));
    await baseUseCase(event).then((value) {
      value.fold(
              (l) => emit(state.cobyWith(requestState: RequestState.error, message: l.message)),
              (r) => r != 0 ? emit(state.cobyWith(requestState: RequestState.loaded, participantsId: r)) : null);
    });
  }

  FutureOr<void> _getParticipantWithEmail(GetParticipantWithEmailEvent event, Emitter<LogInState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading));
    final response = await getParticipantWithEmailBaseUseCase(event);
    response.fold(
            (l) => emit(state.cobyWith(requestState: RequestState.error, message: l.message)),
            (r) => emit(state.cobyWith(requestState: RequestState.loaded, participantsId: r)));

  }
  FutureOr<void> _getToken(GetTokenEvent event, Emitter<LogInState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading));
    await getTokenBaseUseCase(event).then((value) {
      value.fold(
              (l) => emit(state.cobyWith(requestState: RequestState.error, message: l.message)),
              (r) => r.isNotEmpty ? emit(state.cobyWith(requestState: RequestState.loaded,token: r)) : null);
    });
  }

  FutureOr<void> _getPermitting(CheckIsSuccessLogInEvent event, Emitter<LogInState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading));
    await getPermittingBaseUseCase(event).then((value) {
      value.fold(
              (l) => emit(state.cobyWith(requestState: RequestState.error, message: l.message)),
              (r) => r.isNotEmpty ? emit(state.cobyWith(requestState: RequestState.loaded,isCheckSuccessLogIn: r)) : null);
    });
  }
}
