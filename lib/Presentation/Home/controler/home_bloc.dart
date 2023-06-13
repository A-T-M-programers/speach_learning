import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Domain/Entity/Domains.dart';
import 'package:speach_learning/Domain/Entity/Level.dart';
import 'package:speach_learning/Domain/UseCase/get_participant_domain.dart';
import 'package:speach_learning/Presentation/Home/controler/home_event.dart';
import 'package:speach_learning/Presentation/Home/controler/home_state.dart';
import 'package:speach_learning/Presentation/PhraseUI/controler/phrase_bloc.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/global/static/static_variable.dart';
import 'package:speach_learning/core/usecases/base_useCase.dart';
import 'package:speach_learning/core/utils/enums.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final BaseUseCase<List<Domains>,GetAllSectionsEvent> getAllSectionsUseCase;
  final BaseUseCase<Level, GetLevelEvent> getLevelBaseUseCase;
  final GetParticipantDomainUseCase getParticipantDomainUseCase;
  final BaseUseCase<bool,SetLevelStateEvent> setStateLevelUseCase;
  final BaseUseCase<bool,SetDomainStateEvent> setDomainStateUseCase;

  HomeBloc(this.getAllSectionsUseCase,this.getParticipantDomainUseCase,this.setStateLevelUseCase,this.setDomainStateUseCase,this.getLevelBaseUseCase) : super(const HomeState()) {
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
            (r) async {
              if(r.isNotEmpty){
                for(var section in r) {
                  switch (section.type) {
                    case "C":
                      // if(section.listLevel.isNotEmpty){
                      //   if(section.listLevel.any((element) => element.type == "S")){
                      //     add(SetDomainStateEvent(idParticipant: StaticVariable.participants.id, state: "S", idDomain: section.id));
                      //     return;
                      //   }else if(section.listLevel.any((element) => element.type == "X")){
                      //     add(SetDomainStateEvent(idParticipant: StaticVariable.participants.id, state: "X", idDomain: section.id));
                      //     return;
                      //   }
                      // }
                      break;
                    case "X":
                      if (section.listLevel.isNotEmpty){
                        if(!(section.listLevel.any((element) => element.type != "C"))){
                          add(SetDomainStateEvent(idParticipant: StaticVariable.participants.id, state: "C", idDomain: section.id));
                          return;
                        }
                      }
                      break;
                    case "S":
                      if (section.listLevel.isNotEmpty){
                        if(!(section.listLevel.any((element) => element.type != "C"))){
                          add(SetDomainStateEvent(idParticipant: StaticVariable.participants.id, state: "C", idDomain: section.id));
                          return;
                        }
                        if(!(section.listLevel.any((element) => element.type != "C" && element.type != "X"))){
                          add(SetDomainStateEvent(idParticipant: StaticVariable.participants.id, state: "X", idDomain: section.id));
                          return;
                        }
                      }
                      break;
                    default:
                      if (section.listLevel.isNotEmpty){
                        if(!(section.listLevel.any((element) => element.type != "C"))){
                          add(SetDomainStateEvent(idParticipant: StaticVariable.participants.id, state: "C", idDomain: section.id));
                          return;
                        } else if(!(section.listLevel.any((element) => element.type != "C" && element.type != "X"))){
                          add(SetDomainStateEvent(idParticipant: StaticVariable.participants.id, state: "X", idDomain: section.id));
                          return;
                        } else if(section.listLevel.any((element) => element.type == "S")){
                          add(SetDomainStateEvent(idParticipant: StaticVariable.participants.id, state: "S", idDomain: section.id));
                          return;
                        }
                      }
                  }
                }
                if(r[0].type != "S" && r[0].type != "X" && r[0].type != "C"){
                  add(SetDomainStateEvent(idParticipant: event.idParticipant, state: "S", idDomain: r[0].id));
                  return;
                }
                if(r[0].listLevel.isNotEmpty){
                  if(r[0].listLevel[0].type != "S" && r[0].listLevel[0].type != "X" && r[0].listLevel[0].type != "C"){
                    add(SetLevelStateEvent(idParticipant: event.idParticipant, state: "S", idLevel: r[0].listLevel[0].id));
                    return;
                  }
                }
                for(int i = 1; i < r.length ;i++){
                  if((r[i -1].type == "C" || r[i -1].type == "X") && r[i].type != "S"){
                    add(SetDomainStateEvent(idParticipant: event.idParticipant, state: "S", idDomain: r[i].id));
                    return;
                  }else{
                    if(r[i].listLevel.isNotEmpty) {
                      if ((r[i].listLevel.length == 1 && r[i].type == "S") || (r[i].type == "S" && r[i].listLevel[0].type == "")) {
                        if (r[i].listLevel[0].type != "S") {
                          add(SetLevelStateEvent(idParticipant: event.idParticipant, state: "S", idLevel: r[i].listLevel[0].id));
                          return;
                        }
                      } else {
                        for (int j = 1; j < r[i].listLevel.length; j++) {
                          if ((r[i].listLevel[j - 1].type == "C" || r[i].listLevel[j - 1].type == "X") && r[i].listLevel[j].type != "S") {
                            add(SetLevelStateEvent(idParticipant: event.idParticipant, state: "S", idLevel: r[i].listLevel[j].id));
                            return;
                          }
                        }
                      }
                    }
                  }
                }
                emit(state.copyWith(requestState: RequestState.loaded, allSections: r));
              }
            });
  }

  FutureOr<void> _getParticipantDomain(GetParticipantDomainEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(requestState: RequestState.loading));
    final response = await getParticipantDomainUseCase.execute(event.idLang);
    response.fold(
            (l) => emit(state.copyWith(requestState: RequestState.error, error: l as ServerFailure,participantId: event.idLang)),
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
