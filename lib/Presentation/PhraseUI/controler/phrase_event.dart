part of 'phrase_bloc.dart';

@immutable
abstract class PhraseEvent extends Equatable {

  @override
  List<Object> get props =>[];

  const PhraseEvent();
}

class GetLevelEvent extends PhraseEvent{

  final int idParticipant, idLevel;

  const GetLevelEvent({required this.idLevel,required this.idParticipant});

  @override
  List<Object> get props =>[idLevel,idParticipant];
}

class SetPhraseStateEvent extends PhraseEvent{

  final int idParticipant,idPhrase,idLevel;
  final String state;

  const SetPhraseStateEvent(this.idParticipant, this.idPhrase, this.state,this.idLevel);

  @override
  List<Object> get props =>[idPhrase,idParticipant,state,idLevel];
}

class SearchListPhraseEvent extends PhraseEvent{

  final List<PhraseItem> listPhraseItem;

  const SearchListPhraseEvent(this.listPhraseItem);

  @override
  List<Object> get props =>[listPhraseItem];
}

