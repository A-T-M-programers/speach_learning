import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:speach_learning/Data/DataSource/level_remote_dataSource.dart';
import 'package:speach_learning/Data/Model/level_model.dart';
import 'package:speach_learning/Domain/Repository/repository_level.dart';
import 'package:speach_learning/Presentation/Home/controler/home_event.dart';
import 'package:speach_learning/Presentation/PhraseUI/controler/phrase_bloc.dart';
import 'package:speach_learning/core/error/exceptions.dart';
import 'package:speach_learning/core/error/failure.dart';

import '../../Domain/Entity/Level.dart';

class LevelRepository extends BaseLevelRepository<Level,GetLevelEvent>{
  final BaseLevelRemoteDataSource<LevelModel,GetLevelEvent> baseLevelRemoteDataSource;


  LevelRepository(this.baseLevelRemoteDataSource);

  @override
  Future<Either<Failure,Level>> call(GetLevelEvent parameter) async{
    try {
      final result = await baseLevelRemoteDataSource(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statesCode,DioErrorType.badResponse));
    }on ServerDioException catch(dio){
      return Left(ServerFailure(dio.dioErrorModel.message,dio.dioErrorModel.stateCode!,dio.dioErrorModel.dioErrorType));
    }
  }
}
class SetLevelStateRepository extends BaseLevelRepository<bool,SetLevelStateEvent>{
  final BaseLevelRemoteDataSource<bool,SetLevelStateEvent> baseLevelRemoteDataSource;


  SetLevelStateRepository(this.baseLevelRemoteDataSource);

  @override
  Future<Either<Failure,bool>> call(SetLevelStateEvent parameter) async{
    try {
      final result = await baseLevelRemoteDataSource(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statesCode,DioErrorType.badResponse));
    }on ServerDioException catch(dio){
      return Left(ServerFailure(dio.dioErrorModel.message,dio.dioErrorModel.stateCode!,dio.dioErrorModel.dioErrorType));
    }
  }
}