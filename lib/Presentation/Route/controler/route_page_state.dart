part of 'route_page_bloc.dart';

class RoutePageState extends Equatable {
  final RequestState requestState;
  final String message;
  final BottomSheetOption bottomSheetOption;

  const RoutePageState({
    this.requestState = RequestState.loading,
    this.message = "",
    this.bottomSheetOption = BottomSheetOption.empty});

  RoutePageState cobyWith({
  RequestState? requestState,
    String? message,
    BottomSheetOption? bottomSheetOption
}) => RoutePageState(
      requestState: requestState?? this.requestState,
    message: message?? this.message,
    bottomSheetOption: bottomSheetOption?? this.bottomSheetOption
  );

  @override
  List<Object> get props => [requestState,message,bottomSheetOption];
}

