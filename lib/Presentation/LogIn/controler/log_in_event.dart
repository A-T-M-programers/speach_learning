part of 'log_in_bloc.dart';

abstract class LogInEvent extends Equatable{

  const LogInEvent();

  @override
  List<Object> get props => [];
}

class GetParticipantIdEvent extends LogInEvent{}