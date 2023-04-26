import 'package:equatable/equatable.dart';
import 'package:speach_learning/Domain/Entity/Domains.dart';
import 'package:speach_learning/Domain/Entity/Participants.dart';
import 'package:speach_learning/Domain/Entity/domain_participant.dart';
import 'package:speach_learning/core/utils/enums.dart';

class HomeState extends Equatable {
  final List<Domains> allSections;
  final RequestState requestState;
  final DomainParticipant participantDomain;
  final Participants? participants;
  final String message;

  const HomeState(
      {this.allSections = const [],
        this.participantDomain = const DomainParticipant(idParticipant: 0, idDomain: 0, stateDomain: StateDomain.luck),
        this.participants,
      this.requestState = RequestState.loading,
      this.message = ''});

  HomeState copyWith({List<Domains>? allSections,RequestState? requestState,DomainParticipant? domainParticipant,Participants? participants,String? message}) => HomeState(
    allSections: allSections ?? this.allSections,
    requestState: requestState ?? this.requestState,
    participantDomain: domainParticipant ?? participantDomain,
    participants: participants ?? this.participants,
    message: message ?? this.message
  );

  @override
  List<Object> get props => [allSections, requestState, message,participantDomain];
}
