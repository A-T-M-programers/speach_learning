part of 'route_page_bloc.dart';

class RoutePageState extends Equatable {
  final RequestState requestState;
  final ServerFailure error;
  final BottomSheetOption bottomSheetOption;
  final bool checkParticipantFound;

  const RoutePageState({
    this.requestState = RequestState.loading,
    this.error = const ServerFailure("", 200, DioErrorType.unknown),
    this.checkParticipantFound = false,
    this.bottomSheetOption = BottomSheetOption.empty});

  RoutePageState cobyWith({
  RequestState? requestState,
    ServerFailure? error,
    BottomSheetOption? bottomSheetOption,
    bool? checkParticipantFound,
}) => RoutePageState(
      requestState: requestState?? this.requestState,
      error: error?? this.error,
    bottomSheetOption: bottomSheetOption?? this.bottomSheetOption,
    checkParticipantFound: checkParticipantFound?? this.checkParticipantFound
  );

  @override
  List<Object> get props => [requestState,error,bottomSheetOption,checkParticipantFound];
}

