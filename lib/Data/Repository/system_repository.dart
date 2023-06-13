import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:speach_learning/Data/DataSource/system_remote_dataSource.dart';
import 'package:speach_learning/Domain/Repository/repository_system.dart';
import 'package:speach_learning/Presentation/LogIn/controler/log_in_bloc.dart';
import 'package:speach_learning/core/error/exceptions.dart';
import 'package:speach_learning/core/error/failure.dart';

class GetTokenRepository extends BaseSystemRepository<String,GetTokenEvent>{
  final BaseSystemRemoteDataSource<String,GetTokenEvent> baseSystemRemoteDataSource;


  GetTokenRepository(this.baseSystemRemoteDataSource);

  @override
  Future<Either<Failure,String>> call(GetTokenEvent parameter) async{
    try {
      final result = await baseSystemRemoteDataSource(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statesCode,DioErrorType.badResponse));
    }on ServerDioException catch(dio){
      return Left(ServerFailure(dio.dioErrorModel.message,dio.dioErrorModel.stateCode!,dio.dioErrorModel.dioErrorType));
    }
  }
}

class GetPermittingRepository extends BaseSystemRepository<String,CheckIsSuccessLogInEvent>{
  final BaseSystemRemoteDataSource<String,CheckIsSuccessLogInEvent> baseSystemRemoteDataSource;


  GetPermittingRepository(this.baseSystemRemoteDataSource);

  @override
  Future<Either<Failure,String>> call(CheckIsSuccessLogInEvent parameter) async{
    try {
      final result = await baseSystemRemoteDataSource(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statesCode,DioErrorType.badResponse));
    }on ServerDioException catch(dio){
      return Left(ServerFailure(dio.dioErrorModel.message,dio.dioErrorModel.stateCode!,dio.dioErrorModel.dioErrorType));
    }
  }
}