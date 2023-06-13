part of 'log_in_bloc.dart';

class LogInState extends Equatable {
  final RequestState requestState;
  final Participants? participants;
  final int participantsId;
  final String message,token;
  final String isCheckSuccessLogIn;

  const LogInState(
      {this.requestState = RequestState.loading,
      this.participants ,
        this.participantsId = 0,
      this.message = "",
      this.token = "",
      this.isCheckSuccessLogIn = ""});

  LogInState cobyWith(
          {
            RequestState? requestState,
            Participants? participants,
            int? participantsId,
            String? message,
          String? token,
          String? isCheckSuccessLogIn}) =>
      LogInState(
          requestState: requestState ?? this.requestState,
          message: message ?? this.message,
          token: token?? this.token,
          participantsId: participantsId ?? this.participantsId,
          participants: participants ?? this.participants,
      isCheckSuccessLogIn: isCheckSuccessLogIn?? this.isCheckSuccessLogIn
      );

  @override
  List<Object> get props => [requestState, participants ?? Participants.empty() , participantsId, message,token,isCheckSuccessLogIn];
}
