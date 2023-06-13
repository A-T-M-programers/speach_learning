part of 'read_bloc.dart';

class ReadState extends Equatable {
  final RequestState requestState;
  final ServerFailure error;
  final String key;
  final List<Dialects> listDialects;
  final int idDialect,idNextPhrase,idCurrentPhrase;
  final ReadPageStateBuild readPageStateBuild;
  final PhraseItem phraseItem;
  final Map<String,String> voiceError;

  const ReadState({
    this.requestState = RequestState.loading,
    this.error = const ServerFailure("", 200, DioErrorType.unknown),
    this.key = "",
    this.listDialects = const [],
    this.idDialect = 0,
    this.idNextPhrase = 0,
    this.idCurrentPhrase = 0,
    this.readPageStateBuild = ReadPageStateBuild.main,
    this.phraseItem = const PhraseItem(),
    this.voiceError = const {},
  });

  ReadState cobyWith({
  RequestState? requestState,
    ReadPageStateBuild? readPageStateBuild,
    ServerFailure? error,
    List<Dialects>? listDialects,
    String? key,
    int? idDialect,
    int? idNextPhrase,
    int? idCurrentPhrase,
    PhraseItem? phraseItem,
    Map<String,String>? voiceError,
}) => ReadState(
    readPageStateBuild: readPageStateBuild?? this.readPageStateBuild,
      requestState: requestState?? this.requestState,
      error: error?? this.error,
  listDialects: listDialects?? this.listDialects,
    key: key?? this.key,
    idDialect: idDialect??this.idDialect,
    idNextPhrase: idNextPhrase??this.idNextPhrase,
    idCurrentPhrase: idCurrentPhrase??this.idCurrentPhrase,
    phraseItem: phraseItem??this.phraseItem,
    voiceError: voiceError?? this.voiceError,
  );

  @override
  List<Object> get props => [requestState,error,listDialects,key,idDialect,readPageStateBuild,idNextPhrase,idCurrentPhrase,phraseItem,voiceError];
}

