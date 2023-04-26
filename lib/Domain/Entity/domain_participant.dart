import 'package:equatable/equatable.dart';
import 'package:speach_learning/core/utils/enums.dart';

class DomainParticipant extends Equatable {
  final int idParticipant;

  final int idDomain;

  final StateDomain stateDomain;

  const DomainParticipant(
      {required this.idParticipant,
       required this.idDomain,
       required this.stateDomain,
       });

  @override
  List<Object> get props => [idParticipant,idDomain,stateDomain];
}