import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Domain/Entity/Domains.dart';
import 'package:speach_learning/Domain/UseCase/get_participant_domain.dart';
import 'package:speach_learning/Presentation/Home/controler/home_event.dart';
import 'package:speach_learning/Presentation/Home/controler/home_state.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/usecases/base_useCase.dart';
import 'package:speach_learning/core/utils/enums.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final BaseUseCase<List<Domains>,GetAllSectionsEvent> getAllSectionsUseCase;
  final GetParticipantDomainUseCase getParticipantDomainUseCase;
  final BaseUseCase<bool,SetLevelStateEvent> setStateLevelUseCase;
  final BaseUseCase<bool,SetDomainStateEvent> setDomainStateUseCase;

  HomeBloc(this.getAllSectionsUseCase,this.getParticipantDomainUseCase,this.setStateLevelUseCase,this.setDomainStateUseCase) : super(const HomeState()) {
    on<GetAllSectionsEvent>(_getAllSections);
    on<GetParticipantDomainEvent>(_getParticipantDomain);
    on<SetLevelStateEvent>(_setLevelState);
    on<SetDomainStateEvent>(_setDomainState);
  }

  FutureOr<void> _getAllSections(GetAllSectionsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(requestState: RequestState.loading));
    final response = await getAllSectionsUseCase(event);
    response.fold(
            (l) => emit(state.copyWith(requestState: RequestState.error, error: l as ServerFailure,participantId: event.idParticipant)),
            (r) => emit(state.copyWith(requestState: RequestState.loaded, allSections: r)));
  }

  FutureOr<void> _getParticipantDomain(GetParticipantDomainEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(requestState: RequestState.loading));
    final response = await getParticipantDomainUseCase.execute(event.id);
    response.fold(
            (l) => emit(state.copyWith(requestState: RequestState.error, error: l as ServerFailure,participantId: event.id)),
            (r) => r.idParticipant != 0 ? emit(state.copyWith(requestState: RequestState.loaded, domainParticipant: r)) : null);
  }

  FutureOr<void> _setLevelState(SetLevelStateEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(requestState: RequestState.loading));
    final response = await setStateLevelUseCase(event);
    response.fold(
            (l) => emit(state.copyWith(requestState: RequestState.error, error: l as ServerFailure)),
            (r) {
              r ? add(GetAllSectionsEvent(idParticipant: event.idParticipant)) : null;
            });
  }
  FutureOr<void> _setDomainState(SetDomainStateEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(requestState: RequestState.loading));
    final response = await setDomainStateUseCase(event);
    response.fold(
            (l) => emit(state.copyWith(requestState: RequestState.error, error: l as ServerFailure)),
            (r) {
          r ? add(GetAllSectionsEvent(idParticipant: event.idParticipant)) : null;
        });
  }
}
