import 'package:speach_learning/Domain/Entity/domain_participant.dart';

class ParticipantDomainModel extends DomainParticipant {
  const ParticipantDomainModel({
    required super.idParticipant,
    required super.idDomain,
    required super.stateDomain,
    required super.name
  });

  factory ParticipantDomainModel.fromJson(Map<String, dynamic> json) =>
      ParticipantDomainModel(
          idParticipant: json["participant_id"],
          idDomain: json["domain_id"],
          stateDomain: json["status"],
          name: json["name"],
          );
}