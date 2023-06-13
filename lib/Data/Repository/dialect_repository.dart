import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:speach_learning/Data/DataSource/dialect_remote_dataSource.dart';
import 'package:speach_learning/Data/Model/dialect_model.dart';
import 'package:speach_learning/Domain/Repository/repository_dialects.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/core/error/exceptions.dart';
import 'package:speach_learning/core/error/failure.dart';


class DialectRepository extends BaseDialectsRepository<List<DialectModel>,GetAllDialectEvent>{
  final BaseDialectRemoteDataSource<List<DialectModel>,GetAllDialectEvent> baseDialectRemoteDataSource;


  DialectRepository(this.baseDialectRemoteDataSource);

  @override
  Future<Either<Failure,List<DialectModel>>> call(GetAllDialectEvent parameter) async{
    try {
      final result = await baseDialectRemoteDataSource(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statesCode,DioErrorType.badResponse));
    }on ServerDioException catch(dio){
      return Left(ServerFailure(dio.dioErrorModel.message,dio.dioErrorModel.stateCode!,dio.dioErrorModel.dioErrorType));
    }
  }
}