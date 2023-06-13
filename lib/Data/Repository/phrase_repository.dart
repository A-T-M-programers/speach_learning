import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:speach_learning/Data/DataSource/phrase_remote_dataSource.dart';
import 'package:speach_learning/Data/Model/phrase_model.dart';
import 'package:speach_learning/Domain/Repository/repository_Phrase.dart';
import 'package:speach_learning/Presentation/PhraseUI/controler/phrase_bloc.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/core/error/exceptions.dart';
import 'package:speach_learning/core/error/failure.dart';

class SetPhraseStateRepository extends BasePhraseRepository<bool,SetPhraseStateEvent>{
  final BasePhraseRemoteDataSource<bool,SetPhraseStateEvent> basePhraseRemoteDataSource;


  SetPhraseStateRepository(this.basePhraseRemoteDataSource);

  @override
  Future<Either<Failure,bool>> call(SetPhraseStateEvent parameter) async{
    try {
      final result = await basePhraseRemoteDataSource(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statesCode,DioErrorType.badResponse));
    }on ServerDioException catch(dio){
      return Left(ServerFailure(dio.dioErrorModel.message,dio.dioErrorModel.stateCode!,dio.dioErrorModel.dioErrorType));
    }
  }
}

class SetListWordAndPhraseStateRepository extends BasePhraseRepository<int,SetListWordAndPhraseStateEvent>{
  final BasePhraseRemoteDataSource<int,SetListWordAndPhraseStateEvent> basePhraseRemoteDataSource;


  SetListWordAndPhraseStateRepository(this.basePhraseRemoteDataSource);

  @override
  Future<Either<Failure,int>> call(SetListWordAndPhraseStateEvent parameter) async{
    try {
      final result = await basePhraseRemoteDataSource(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statesCode,DioErrorType.badResponse));
    }on ServerDioException catch(dio){
      return Left(ServerFailure(dio.dioErrorModel.message,dio.dioErrorModel.stateCode!,dio.dioErrorModel.dioErrorType));
    }
  }
}
class GetPhraseRepository extends BasePhraseRepository<PhraseModel,GetPhraseEvent>{
  final BasePhraseRemoteDataSource<PhraseModel,GetPhraseEvent> basePhraseRemoteDataSource;


  GetPhraseRepository(this.basePhraseRemoteDataSource);

  @override
  Future<Either<Failure,PhraseModel>> call(GetPhraseEvent parameter) async{
    try {
      final result = await basePhraseRemoteDataSource(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statesCode,DioErrorType.badResponse));
    }on ServerDioException catch(dio){
      return Left(ServerFailure(dio.dioErrorModel.message,dio.dioErrorModel.stateCode!,dio.dioErrorModel.dioErrorType));
    }
  }
}