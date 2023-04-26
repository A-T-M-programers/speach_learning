part of 'log_in_bloc.dart';

class LogInState extends Equatable {
  final RequestState requestState;
  final Participants? participants;
  final int participantsId;
  final String message;

  const LogInState(
      {this.requestState = RequestState.loading,
      this.participants ,
        this.participantsId = 0,
      this.message = ""});

  LogInState cobyWith(
          {
            RequestState? requestState,
            Participants? participants,
            int? participantsId,
            String? message}) =>
      LogInState(
          requestState: requestState ?? this.requestState,
          message: message ?? this.message,
          participantsId: participantsId ?? this.participantsId,
          participants: participants ?? this.participants);

  @override
  List<Object> get props => [requestState, participants ?? Participants.empty() , participantsId, message];
}
