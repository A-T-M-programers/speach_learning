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
class GetTokenEvent extends LogInEvent{
  final String email,password;

  const GetTokenEvent(this.email,this.password);
  @override
  List<Object> get props => [email,password];
}
class CheckIsSuccessLogInEvent extends LogInEvent{
  const CheckIsSuccessLogInEvent();
  @override
  List<Object> get props => [];
}

