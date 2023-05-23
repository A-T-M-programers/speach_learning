import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:speach_learning/Data/DataSource/word_remote_dataSource.dart';
import 'package:speach_learning/Domain/Repository/repository_word.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/core/error/exceptions.dart';
import 'package:speach_learning/core/error/failure.dart';

class SetWordStateRepository extends BaseWordRepository<bool,SetWordStateEvent>{
  final BaseWordRemoteDataSource<bool,SetWordStateEvent> baseWordRemoteDataSource;


  SetWordStateRepository(this.baseWordRemoteDataSource);

  @override
  Future<Either<Failure,bool>> call(SetWordStateEvent parameter) async{
    try {
      final result = await baseWordRemoteDataSource(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statesCode,DioErrorType.badResponse));
    }on ServerDioException catch(dio){
      return Left(ServerFailure(dio.dioErrorModel.message,dio.dioErrorModel.stateCode!,dio.dioErrorModel.dioErrorType));
    }
  }
}