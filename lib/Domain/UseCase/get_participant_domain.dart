import 'package:dartz/dartz.dart';
import 'package:speach_learning/Domain/Entity/domain_participant.dart';
import 'package:speach_learning/Domain/Repository/repository_domain_participant_domain.dart';
import 'package:speach_learning/core/error/failure.dart';

class GetParticipantDomainUseCase{
  final BaseParticipantDomainRepository baseParticipantDomainRepository;

  GetParticipantDomainUseCase(this.baseParticipantDomainRepository);

  Future<Either<Failure,DomainParticipant>> execute(int idParticipant) async {
    return await baseParticipantDomainRepository.getParticipantDomain(idParticipant);
  }
}