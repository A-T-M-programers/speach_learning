import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:speach_learning/Domain/Entity/Domains.dart';
import 'package:speach_learning/Domain/Entity/domain_participant.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/utils/enums.dart';

class HomeState extends Equatable {
  final List<Domains> allSections;
  final RequestState requestState;
  final DomainParticipant participantDomain;
  final ServerFailure error;
  final int participantId;

  const HomeState(
      {this.allSections = const [],
        this.participantDomain = const DomainParticipant(idParticipant: 0, idDomain: 0, stateDomain: StateDomain.luck,name: "EN"),
      this.requestState = RequestState.loading,
        this.participantId = 0,
      this.error = const ServerFailure("", 200, DioErrorType.unknown)});

  HomeState copyWith({
    List<Domains>? allSections,
    RequestState? requestState,
    DomainParticipant? domainParticipant,
    String? nameLang,
    int? participantId,
    ServerFailure? error
  }) => HomeState(
    allSections: allSections ?? this.allSections,
    requestState: requestState ?? this.requestState,
    participantDomain: domainParticipant ?? participantDomain,
    error: error ?? this.error,
      participantId: participantId?? this.participantId
  );

  @override
  List<Object> get props => [allSections, requestState, error ,participantDomain,participantId];
}
