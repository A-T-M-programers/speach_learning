part of 'phrase_bloc.dart';

class PhraseState extends Equatable {
  final Level level;
  final RequestState requestState;
  final ServerFailure error;

  const PhraseState(
      {this.level = const Level(
          id: 0, title: "", description: "", phraseCount: 0, order: 0,listPhraseItem: []),
      this.requestState = RequestState.loading,
      this.error = const ServerFailure("", 200, DioErrorType.unknown)});

  PhraseState cobyWith(
          {Level? level, RequestState? requestState, ServerFailure? error}) =>
      PhraseState(
          level: level ?? this.level,
          requestState: requestState ?? this.requestState,
          error: error ?? this.error);

  @override
  List<Object> get props => [level, requestState, error];
}
