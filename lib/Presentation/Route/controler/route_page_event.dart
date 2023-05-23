part of 'route_page_bloc.dart';

abstract class RoutePageEvent extends Equatable {

  const RoutePageEvent();

  @override
  List<Object> get props => [];
}

class TransitionRoutePageEvent extends RoutePageEvent{
  final BottomSheetOption bottomSheetOption;

  const TransitionRoutePageEvent(this.bottomSheetOption);

  @override
  List<Object> get props => [bottomSheetOption];
}
