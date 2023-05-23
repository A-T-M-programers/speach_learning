part of 'log_in_bloc.dart';

abstract class LogInEvent extends Equatable{

  const LogInEvent();

  @override
  List<Object> get props => [];
}

class GetParticipantIdEvent extends LogInEvent{}
class GetParticipantWithEmailEvent extends LogInEvent{
  final String email;

  const GetParticipantWithEmailEvent({required this.email});
  @override
  List<Object> get props => [email];
}