import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:speach_learning/Data/DataSource/participants_domain_remote_datasource.dart';
import 'package:speach_learning/Domain/Entity/domain_participant.dart';
import 'package:speach_learning/Domain/Repository/repository_domain_participant_domain.dart';
import 'package:speach_learning/core/error/exceptions.dart';
import 'package:speach_learning/core/error/failure.dart';

class ParticipantDomainRepository extends BaseParticipantDomainRepository{
  final BaseParticipantDomainDataSource baseParticipantDomainDataSource;


  ParticipantDomainRepository(this.baseParticipantDomainDataSource);

  @override
  Future<Either<Failure,DomainParticipant>> getParticipantDomain(int idParticipant) async{
    try {
      final result = await baseParticipantDomainDataSource.getParticipantDomainDataSource(idParticipant);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statesCode,DioErrorType.badResponse));
    }on ServerDioException catch(dio){
      return Left(ServerFailure(dio.dioErrorModel.message,dio.dioErrorModel.stateCode!,dio.dioErrorModel.dioErrorType));
    }
  }
}