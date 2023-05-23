import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:speach_learning/core/utils/enums.dart';

part 'route_page_event.dart';
part 'route_page_state.dart';

class RoutePageBloc extends Bloc<RoutePageEvent, RoutePageState> {
  RoutePageBloc() : super(const RoutePageState()) {
    on<TransitionRoutePageEvent>(_getTransitionPage);
  }

  FutureOr<void> _getTransitionPage(TransitionRoutePageEvent event, Emitter<RoutePageState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading));
    emit(state.cobyWith(requestState: RequestState.loaded,bottomSheetOption: event.bottomSheetOption));
  }
}
