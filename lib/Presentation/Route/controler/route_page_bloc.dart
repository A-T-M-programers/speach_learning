import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:speach_learning/Domain/Entity/Participants.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileEvent.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/usecases/base_useCase.dart';
import 'package:speach_learning/core/utils/enums.dart';

part 'route_page_event.dart';
part 'route_page_state.dart';

class RoutePageBloc extends Bloc<RoutePageEvent, RoutePageState> {
  final BaseUseCase<Participants,GetParticipantEvent> getParticipantBaseUseCase;

  RoutePageBloc(this.getParticipantBaseUseCase) : super(const RoutePageState()) {
    on<TransitionRoutePageEvent>(_getTransitionPage);
    on<GetParticipantEvent>(_checkIfParticipantFound);

  }

  FutureOr<void> _getTransitionPage(TransitionRoutePageEvent event, Emitter<RoutePageState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading));
    emit(state.cobyWith(requestState: RequestState.loaded,bottomSheetOption: event.bottomSheetOption));
  }
  FutureOr<void> _checkIfParticipantFound(GetParticipantEvent event, Emitter<RoutePageState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading));
    final response = await getParticipantBaseUseCase(event);
    response.fold(
            (l) => emit(state.cobyWith(requestState: RequestState.error, error: l as ServerFailure,checkParticipantFound: false)),
            (r) => emit(state.cobyWith(requestState: RequestState.loaded, checkParticipantFound: true)));

  }
}
