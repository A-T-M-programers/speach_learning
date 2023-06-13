part of 'phrase_bloc.dart';

class PhraseState extends Equatable {
  final Level level;
  final RequestState requestState;
  final ServerFailure error;
  final List<PhraseItem> listPhraseItem;

  const PhraseState(
      {this.level = const Level(
          id: 0, title: "", description: "", phraseCount: 0, order: 0,idDomain: 0,listPhraseItem: []),
      this.requestState = RequestState.loading,
        this.listPhraseItem = const [],
      this.error = const ServerFailure("", 200, DioErrorType.unknown)});

  PhraseState cobyWith(
          {Level? level, RequestState? requestState, ServerFailure? error , List<PhraseItem>? listPhraseItem}) =>
      PhraseState(
          level: level ?? this.level,
          requestState: requestState ?? this.requestState,
          listPhraseItem: listPhraseItem?? this.listPhraseItem,
          error: error ?? this.error);

  @override
  List<Object> get props => [level, requestState, error,listPhraseItem];
}
