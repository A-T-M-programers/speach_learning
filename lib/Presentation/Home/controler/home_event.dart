import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable{
  const HomeEvent();

  @override
  List<Object> get props =>[];
}
class GetAllSectionsEvent extends HomeEvent {
  final int idParticipant;

  const GetAllSectionsEvent({required this.idParticipant});

  @override
  List<Object> get props =>[idParticipant];
}
class GetParticipantDomainEvent extends HomeEvent {
  final int idLang;

  const GetParticipantDomainEvent({required this.idLang});

  @override
  List<Object> get props =>[idLang];
}
class SetLevelStateEvent extends HomeEvent {
  final int idParticipant,idLevel;
  final String state;

  const SetLevelStateEvent({required this.idParticipant,required this.state,required this.idLevel});

  @override
  List<Object> get props =>[idParticipant,idLevel,state];
}

class SetDomainStateEvent extends HomeEvent {
  final int idParticipant,idDomain;
  final String state;

  const SetDomainStateEvent({required this.idParticipant,required this.state,required this.idDomain});

  @override
  List<Object> get props =>[idParticipant,idDomain,state];
}