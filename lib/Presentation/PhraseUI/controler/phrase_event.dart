part of 'phrase_bloc.dart';

@immutable
abstract class PhraseEvent extends Equatable {

  @override
  List<Object> get props =>[];
}

class GetLevelEvent extends PhraseEvent{

  final int idParticipant, idLevel;

  GetLevelEvent({required this.idLevel,required this.idParticipant});

  @override
  List<Object> get props =>[idLevel,idParticipant];
}

class SetPhraseStateEvent extends PhraseEvent{

  final int idParticipant,idPhrase;
  final String state;

  SetPhraseStateEvent(this.idParticipant, this.idPhrase, this.state);

  @override
  List<Object> get props =>[idPhrase,idParticipant,state];
}

