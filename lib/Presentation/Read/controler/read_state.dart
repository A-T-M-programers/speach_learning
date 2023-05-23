part of 'read_bloc.dart';

class ReadState extends Equatable {
  final RequestState requestState;
  final ServerFailure error;

  const ReadState({
    this.requestState = RequestState.loading,
    this.error = const ServerFailure("", 200, DioErrorType.unknown)
  });

  ReadState cobyWith({
  RequestState? requestState,
    ServerFailure? error
}) => ReadState(requestState: requestState?? this.requestState,error: error?? this.error);

  @override
  List<Object> get props => [requestState,error];
}

