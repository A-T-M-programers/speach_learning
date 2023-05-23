import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:speach_learning/Data/DataSource/sections_remote_datasourse.dart';
import 'package:speach_learning/Data/Model/domains_model.dart';
import 'package:speach_learning/Domain/Entity/Domains.dart';
import 'package:speach_learning/Domain/Repository/repository_domain_section.dart';
import 'package:speach_learning/Presentation/Home/controler/home_event.dart';
import 'package:speach_learning/core/error/exceptions.dart';
import 'package:speach_learning/core/error/failure.dart';

class SectionsRepository extends BaseSectionsRepository<List<Domains>,GetAllSectionsEvent>{
  final BaseSectionsRemoteDataSource<List<DomainsModel>,GetAllSectionsEvent> baseSectionsRemoteDataSource;


  SectionsRepository(this.baseSectionsRemoteDataSource);

  @override
  Future<Either<Failure,List<Domains>>> call(GetAllSectionsEvent parameter) async{
    try {
      final result = await baseSectionsRemoteDataSource(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statesCode,DioErrorType.badResponse));
    }on ServerDioException catch(dio){
      return Left(ServerFailure(dio.dioErrorModel.message,dio.dioErrorModel.stateCode!,dio.dioErrorModel.dioErrorType));
    }
  }
}

class SetDomainStateRepository extends BaseSectionsRepository<bool,SetDomainStateEvent>{
  final BaseSectionsRemoteDataSource<bool,SetDomainStateEvent> baseSectionsRemoteDataSource;


  SetDomainStateRepository(this.baseSectionsRemoteDataSource);

  @override
  Future<Either<Failure,bool>> call(SetDomainStateEvent parameter) async{
    try {
      final result = await baseSectionsRemoteDataSource(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statesCode,DioErrorType.badResponse));
    }on ServerDioException catch(dio){
      return Left(ServerFailure(dio.dioErrorModel.message,dio.dioErrorModel.stateCode!,dio.dioErrorModel.dioErrorType));
    }
  }
}