import 'package:dartz/dartz.dart';
import 'package:speach_learning/Domain/Entity/domain_participant.dart';
import 'package:speach_learning/core/error/failure.dart';

abstract class BaseParticipantDomainRepository{
  Future<Either<Failure,DomainParticipant>> getParticipantDomain(int idParticipant);
}