import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Domain/UseCase/get_all_sections_usecase.dart';
import 'package:speach_learning/Domain/UseCase/get_participant_domain.dart';
import 'package:speach_learning/Domain/UseCase/participant_usecase.dart';
import 'package:speach_learning/Presentation/Home/controler/home_event.dart';
import 'package:speach_learning/Presentation/Home/controler/home_state.dart';
import 'package:speach_learning/core/utils/enums.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final GetAllSectionsUseCase getAllSectionsUseCase;
  final GetParticipantDomainUseCase getParticipantDomainUseCase;
  final ParticipantUseCase participantUseCase;

  HomeBloc(this.getAllSectionsUseCase,this.getParticipantDomainUseCase,this.participantUseCase) : super(const HomeState()) {
    on<GetAllSectionsEvent>(_getAllSections);
    on<GetParticipantDomainEvent>(_getParticipantDomain);
  }

  FutureOr<void> _getAllSections(GetAllSectionsEvent event, Emitter<HomeState> emit) async {
    final response = await getAllSectionsUseCase.execute();
    response.fold(
            (l) => emit(
            state.copyWith(requestState: RequestState.error, message: l.message)),
            (r) => emit(
                state.copyWith(requestState: RequestState.loaded, allSections: r)));
  }

  FutureOr<void> _getParticipantDomain(GetParticipantDomainEvent event, Emitter<HomeState> emit) async {
    final response = await getParticipantDomainUseCase.execute(event.id);
    response.fold(
            (l) => emit(
                state.copyWith(requestState: RequestState.error, message: l.message)),
            (r) => emit(
                state.copyWith(requestState: RequestState.loaded, domainParticipant: r)));
  }
}
