part of 'read_bloc.dart';

abstract class ReadEvent extends Equatable{


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
  final int idParticipant,idWord;
  final String state;

  const SetWordStateEvent(this.idWord,this.state,this.idParticipant);

  @override
  List<Object> get props =>[idParticipant,idWord,state];
}