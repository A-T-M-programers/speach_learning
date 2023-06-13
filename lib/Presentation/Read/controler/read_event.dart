part of 'read_bloc.dart';

abstract class ReadEvent extends PhraseEvent{


  const ReadEvent();

  @override
  List<Object> get props =>[];
}

class EmptyEvent extends ReadEvent{

  const EmptyEvent();

  @override
  List<Object> get props =>[];
}

class SetWordStateEvent extends ReadEvent{
  final int idParticipant,idWord,idLevel;
  final String state;

  const SetWordStateEvent(this.idWord,this.state,this.idParticipant,this.idLevel);

  @override
  List<Object> get props =>[idParticipant,idWord,state,idLevel];
}
class GetAllDialectEvent extends ReadEvent{

  const GetAllDialectEvent();

  @override
  List<Object> get props =>[];
}

class SetParticipantDialectEvent extends ReadEvent{

  final int idParticipant,idDialect;

  const SetParticipantDialectEvent(this.idParticipant,this.idDialect);

  @override
  List<Object> get props =>[idParticipant,idDialect];
}
class SetListWordAndPhraseStateEvent extends ReadEvent{

  final int idParticipant,idPhrase;
  final String statePhrase;
  final Map<int,String> mapWordState;

  const SetListWordAndPhraseStateEvent(this.idParticipant,this.statePhrase,this.idPhrase,this.mapWordState);

  @override
  List<Object> get props =>[idParticipant,idPhrase,statePhrase,mapWordState];
}
class GetPhraseEvent extends ReadEvent{

  final int idParticipant,idPhrase;

  const GetPhraseEvent(this.idParticipant,this.idPhrase);

  @override
  List<Object> get props =>[idParticipant,idPhrase];
}

class ShowBottomSheetEvent extends ReadEvent{

  final Map<String,String> voiceError;

  const ShowBottomSheetEvent(this.voiceError);

  @override
  List<Object> get props =>[voiceError];
}