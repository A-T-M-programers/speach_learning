part of 'voice_bloc.dart';

@immutable
abstract class VoiceEvent extends Equatable{

  const VoiceEvent();

  @override
  List<Object> get props => [];
}

class SetWordStateDuringVoiceEvent extends VoiceEvent{
  final int idWord;
  final String state;

  const SetWordStateDuringVoiceEvent(this.idWord, this.state);

  @override
  List<Object> get props => [idWord,state];
}
class GetRateDuringVoiceEvent extends VoiceEvent{
  final double rate;

  const GetRateDuringVoiceEvent(this.rate);

  @override
  List<Object> get props => [rate];
}
class SetPhraseVoiceEvent extends VoiceEvent{
  final String phrase;

  const SetPhraseVoiceEvent(this.phrase);

  @override
  List<Object> get props => [phrase];
}
