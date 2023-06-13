import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:speach_learning/Domain/Entity/Dialects.dart';
import 'package:speach_learning/Domain/Entity/Domains.dart';
import 'package:speach_learning/Domain/Entity/Level.dart';
import 'package:speach_learning/Domain/Entity/PhraseItem.dart';
import 'package:speach_learning/Presentation/Home/controler/home_event.dart';
import 'package:speach_learning/Presentation/PhraseUI/controler/phrase_bloc.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/global/static/static_variable.dart';
import 'package:speach_learning/core/usecases/base_useCase.dart';
import 'package:speach_learning/core/utils/enums.dart';

part 'read_event.dart';

part 'read_state.dart';

class ReadBloc extends Bloc<ReadEvent, ReadState> {
  final BaseUseCase<bool, SetWordStateEvent> setWordBaseUseCase;
  final BaseUseCase<List<Dialects>, GetAllDialectEvent>
      getAllDialectsBaseUseCase;
  final BaseUseCase<int, SetParticipantDialectEvent>
      setParticipantDialectsBaseUseCase;
  final BaseUseCase<int, SetListWordAndPhraseStateEvent>
      setListWordAndPhraseState;
  final BaseUseCase<PhraseItem, GetPhraseEvent> getPhraseItem;
  final BaseUseCase<Level, GetLevelEvent> getLevelBaseUseCase;
  final BaseUseCase<bool, SetLevelStateEvent> setStateLevelUseCase;
  final BaseUseCase<List<Domains>, GetAllSectionsEvent> getAllSectionsUseCase;

  ReadBloc(
      this.setWordBaseUseCase,
      this.getAllDialectsBaseUseCase,
      this.setParticipantDialectsBaseUseCase,
      this.setListWordAndPhraseState,
      this.getPhraseItem,
      this.getLevelBaseUseCase,
      this.setStateLevelUseCase,
      this.getAllSectionsUseCase)
      : super(const ReadState()) {
    on<SetWordStateEvent>(_setWordState);
    on<EmptyEvent>(_setEmptyEvent);
    on<GetAllDialectEvent>(_getAllDialectsEvent);
    on<SetParticipantDialectEvent>(_setParticipantDialectsEvent);
    on<SetListWordAndPhraseStateEvent>(_setListWordAndPhraseState);
    on<GetPhraseEvent>(_getPhrase);
    on<ShowBottomSheetEvent>(_showBottomSheetEvent);
  }

  FutureOr<void> _setWordState(
      SetWordStateEvent event, Emitter<ReadState> emit) async {
    emit(state.cobyWith(
        requestState: RequestState.loading,
        readPageStateBuild: ReadPageStateBuild.level2));
    final response = await setWordBaseUseCase(event);
    response.fold(
        (l) => emit(state.cobyWith(
            requestState: RequestState.error,
            error: l as ServerFailure,
            readPageStateBuild: ReadPageStateBuild.level2)),
        (r) => r
            ? emit(state.cobyWith(
                requestState: RequestState.loaded,
                readPageStateBuild: ReadPageStateBuild.level2))
            : null);
  }

  FutureOr<void> _setEmptyEvent(
      EmptyEvent event, Emitter<ReadState> emit) async {
    emit(state.cobyWith(
        requestState: RequestState.loaded,
        readPageStateBuild: ReadPageStateBuild.main));
  }

  FutureOr<void> _getAllDialectsEvent(GetAllDialectEvent event, Emitter<ReadState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading, readPageStateBuild: ReadPageStateBuild.level1));
    final response = await getAllDialectsBaseUseCase(event);
    response.fold(
        (l) => emit(state.cobyWith(requestState: RequestState.error, error: l as ServerFailure, readPageStateBuild: ReadPageStateBuild.level1)),
        (r) => r.isNotEmpty ? emit(state.cobyWith(requestState: RequestState.loaded, listDialects: r, readPageStateBuild: ReadPageStateBuild.level1)) : null);
  }

  FutureOr<void> _setParticipantDialectsEvent(
      SetParticipantDialectEvent event, Emitter<ReadState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading, readPageStateBuild: ReadPageStateBuild.level1));
    final response = await setParticipantDialectsBaseUseCase(event);
    response.fold(
        (l) => emit(state.cobyWith(requestState: RequestState.error, error: l as ServerFailure, readPageStateBuild: ReadPageStateBuild.level1)),
        (r) => r != 0 ? emit(state.cobyWith(requestState: RequestState.loaded, idDialect: r, readPageStateBuild: ReadPageStateBuild.level1)) : null);
  }

  FutureOr<void> _setListWordAndPhraseState(
      SetListWordAndPhraseStateEvent event, Emitter<ReadState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading, readPageStateBuild: ReadPageStateBuild.level2));
    final response = await setListWordAndPhraseState(event);
    response.fold(
        (l) => emit(state.cobyWith(requestState: RequestState.error, error: l as ServerFailure, readPageStateBuild: ReadPageStateBuild.level2)), (r) async {
      if (event.statePhrase == "C" || event.statePhrase == "X") {
        final response3 = await getPhraseItem(GetPhraseEvent(event.idParticipant, event.idPhrase));
        response3.fold(
            (l) => emit(state.cobyWith(requestState: RequestState.error, error: l as ServerFailure, readPageStateBuild: ReadPageStateBuild.level2)), (r1) async {
          final response1 = await getLevelBaseUseCase(GetLevelEvent(idLevel: r1.idLevel, idParticipant: event.idParticipant));
          response1.fold(
              (l) => emit(state.cobyWith(requestState: RequestState.error, error: l as ServerFailure, readPageStateBuild: ReadPageStateBuild.main)), (r2) async {
            if (r2.listPhraseItem.isNotEmpty) {
              if (r2.type != "C" && r2.type != "X" && r2.listPhraseItem.where((element) => element.type == "C" || element.type == "X").length == r2.listPhraseItem.length) {
                await setStateLevelUseCase(SetLevelStateEvent(idParticipant: event.idParticipant, state: "X", idLevel: r2.id))
                    .whenComplete(() {
                  emit(state.cobyWith(requestState: RequestState.loaded, idNextPhrase: r, readPageStateBuild: ReadPageStateBuild.level2));
                });
              } else if (r2.type != "C" && !r2.listPhraseItem.any((element) => element.type != "C")) {
                await setStateLevelUseCase(SetLevelStateEvent(idParticipant: event.idParticipant, state: "C", idLevel: r2.id))
                    .whenComplete(() {
                  emit(state.cobyWith(requestState: RequestState.loaded, idNextPhrase: r, readPageStateBuild: ReadPageStateBuild.level2));
                });
              }
            }
          });
        });
      }
    });
  }

  FutureOr<void> _getPhrase(GetPhraseEvent event, Emitter<ReadState> emit) async {
    emit(state.cobyWith(requestState: RequestState.loading, readPageStateBuild: ReadPageStateBuild.main));
    final response = await getPhraseItem(event);
    await response.fold(
            (l) async => emit(state.cobyWith(requestState: RequestState.error, idCurrentPhrase: event.idPhrase, error: l as ServerFailure, readPageStateBuild: ReadPageStateBuild.main)),
            (r) async {
      try {
        if (r.type == "C" || r.type == "X") {
          final nextPhraseId = await searchNextPhraseId(r);
          nextPhraseId.fold(
                  (l) => emit(state.cobyWith(requestState: RequestState.loaded, phraseItem: r, readPageStateBuild: ReadPageStateBuild.main, idNextPhrase: 0)),
                  (rNextIdPhrase) {
                    emit(state.cobyWith(requestState: RequestState.loaded, phraseItem: r, readPageStateBuild: ReadPageStateBuild.main, idNextPhrase: rNextIdPhrase));
                  });
        }else{
          emit(state.cobyWith(requestState: RequestState.loaded, phraseItem: r, readPageStateBuild: ReadPageStateBuild.main, idNextPhrase: 0));
        }
      } catch (error) {
        print(error);
      }
    });
  }

  Future<Either<void,int>> searchNextPhraseId(PhraseItem r) async{
    try {
      int nextPhraseId = 0;
      final responseGetLevel = await getLevelBaseUseCase(GetLevelEvent(idLevel: r.idLevel, idParticipant: StaticVariable.participants.id)); /*.then((value) {*/
      await responseGetLevel.fold((l) => null, (rLevel) async {
        if (rLevel.listPhraseItem.firstWhere((element) => element.id > r.id, orElse: () => const PhraseItem()) != const PhraseItem()) {
          nextPhraseId = rLevel.listPhraseItem.firstWhere((element) => element.id > r.id).id;
        } else {
          final responseDomain = await getAllSectionsUseCase(GetAllSectionsEvent(idParticipant: StaticVariable.participants.id));
          responseDomain.fold((l) => null, (rDomain) {
            if (rDomain.isNotEmpty) {
              if (rDomain.firstWhere((element) => element.id > rLevel.idDomain).id != 0) {
                nextPhraseId = rDomain.firstWhere((element) => element.id > rLevel.idDomain).listLevel.first.listPhraseItem.first.id;
              }
            }
          });
        }
      });
      return Right(nextPhraseId);
    }catch(_){
      return const Left(null);
    }
  }

  FutureOr<void> _showBottomSheetEvent(ShowBottomSheetEvent event, Emitter<ReadState> emit) async {
    emit(state.cobyWith(readPageStateBuild: ReadPageStateBuild.level4, requestState: RequestState.loading));
    emit(state.cobyWith(readPageStateBuild: ReadPageStateBuild.level4, requestState: RequestState.loaded, voiceError: event.voiceError));
  }
}
