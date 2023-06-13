part of 'voice_bloc.dart';

@immutable
abstract class VoiceState extends Equatable{
  final RequestState requestState;
  final ServerFailure error;
  const VoiceState({
    this.requestState = RequestState.loading,
    this.error = const ServerFailure("", 200, DioErrorType.unknown),
});

  @override
  List<Object> get props =>[error,requestState];
}

class VoiceInitial extends VoiceState {}

class ChangeColorWordState extends VoiceState{
  final int idWord;
  final String state;

  const ChangeColorWordState({
    super.requestState = RequestState.loading,
    super.error = const ServerFailure("", 200, DioErrorType.unknown),
    this.idWord = 0,
    this.state = ""});

  ChangeColorWordState copyWith({
  RequestState? requestState,
    ServerFailure? error,
    int? idWord,
    String? state
}) => ChangeColorWordState(
    requestState: requestState?? this.requestState,
    error: error?? this.error,
    idWord: idWord?? this.idWord,
    state: state?? this.state
  );

  @override
  List<Object> get props =>[error,requestState,idWord,state];
}
class ChangeRateVoiceState extends VoiceState{
  final double rate;

  const ChangeRateVoiceState({
    super.requestState = RequestState.loading,
    super.error = const ServerFailure("", 200, DioErrorType.unknown),
    this.rate = 0.0});

  ChangeRateVoiceState copyWith({
    RequestState? requestState,
    ServerFailure? error,
    double? rate,
  }) => ChangeRateVoiceState(
      requestState: requestState?? this.requestState,
      error: error?? this.error,
      rate: rate?? this.rate,
  );

  @override
  List<Object> get props =>[error,requestState,rate];
}

class ChangePhraseVoiceState extends VoiceState{
  final String phrase;

  const ChangePhraseVoiceState({
    super.requestState = RequestState.loading,
    super.error = const ServerFailure("", 200, DioErrorType.unknown),
    this.phrase = ""});

  ChangePhraseVoiceState copyWith({
    RequestState? requestState,
    ServerFailure? error,
    String? phrase,
  }) => ChangePhraseVoiceState(
    requestState: requestState?? this.requestState,
    error: error?? this.error,
    phrase: phrase?? this.phrase,
  );

  @override
  List<Object> get props =>[error,requestState,phrase];
}
