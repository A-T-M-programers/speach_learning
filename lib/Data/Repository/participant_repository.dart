import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:speach_learning/Data/DataSource/participant_locale_file.dart';
import 'package:speach_learning/Data/DataSource/participant_remote_datasourc.dart';
import 'package:speach_learning/Data/Model/participant_model.dart';
import 'package:speach_learning/Domain/Entity/Participants.dart';
import 'package:speach_learning/Domain/Repository/repository_participant.dart';
import 'package:speach_learning/Presentation/LogIn/controler/log_in_bloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileEvent.dart';
import 'package:speach_learning/core/error/exceptions.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/utils/enums.dart';

class SetThemeAppParticipantRepository extends BaseParticipantRepository<ThemeApp,SetThemeAppParticipantEvent> {
  final BaseParticipantRemoteDataSource<ThemeApp,SetThemeAppParticipantEvent> baseParticipantRemoteDataSource;


  SetThemeAppParticipantRepository(this.baseParticipantRemoteDataSource);

  @override
  Future<Either<Failure, ThemeApp>> call(SetThemeAppParticipantEvent parameter) async {
    try {
      final result = await baseParticipantRemoteDataSource(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statesCode,DioErrorType.badResponse));
    }on ServerDioException catch(dio){
      return Left(ServerFailure(dio.dioErrorModel.message,dio.dioErrorModel.stateCode!,dio.dioErrorModel.dioErrorType));
    }
  }
}
class SetLangParticipantRepository extends BaseParticipantRepository<int,SetLangParticipantEvent> {
  final BaseParticipantRemoteDataSource<int,SetLangParticipantEvent> baseParticipantRemoteDataSource;


  SetLangParticipantRepository(this.baseParticipantRemoteDataSource);

  @override
  Future<Either<Failure, int>> call(SetLangParticipantEvent parameter) async {
    try {
      final result = await baseParticipantRemoteDataSource(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statesCode,DioErrorType.badResponse));
    }on ServerDioException catch(dio){
      return Left(ServerFailure(dio.dioErrorModel.message,dio.dioErrorModel.stateCode!,dio.dioErrorModel.dioErrorType));
    }
  }
}
class SetPhotoParticipantRepository extends BaseParticipantRepository<String,SetPhotoParticipantEvent> {
  final BaseParticipantRemoteDataSource<String,SetPhotoParticipantEvent> baseParticipantRemoteDataSource;


  SetPhotoParticipantRepository(this.baseParticipantRemoteDataSource);

  @override
  Future<Either<Failure, String>> call(SetPhotoParticipantEvent parameter) async {
    try {
      final result = await baseParticipantRemoteDataSource(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statesCode,DioErrorType.badResponse));
    }on ServerDioException catch(dio){
      return Left(ServerFailure(dio.dioErrorModel.message,dio.dioErrorModel.stateCode!,dio.dioErrorModel.dioErrorType));
    }
  }
}
class SetParticipantRepository extends BaseParticipantRepository<int,SetParticipantEvent> {
  final BaseParticipantRemoteDataSource<int,SetParticipantEvent> baseParticipantRemoteDataSource;


  SetParticipantRepository(this.baseParticipantRemoteDataSource);

  @override
  Future<Either<Failure, int>> call(SetParticipantEvent parameter) async {
    try {
      final result = await baseParticipantRemoteDataSource(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statesCode,DioErrorType.badResponse));
    }on ServerDioException catch(dio){
      return Left(ServerFailure(dio.dioErrorModel.message,dio.dioErrorModel.stateCode!,dio.dioErrorModel.dioErrorType));
    }
  }
}

class GetParticipantWithIdRepository extends BaseParticipantRepository<Participants,GetParticipantEvent> {
  final BaseParticipantRemoteDataSource<ParticipantModel,GetParticipantEvent> baseParticipantRemoteDataSource;


  GetParticipantWithIdRepository(this.baseParticipantRemoteDataSource);

  @override
  Future<Either<Failure, Participants>> call(GetParticipantEvent parameter) async {
    try {
      final result = await baseParticipantRemoteDataSource(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statesCode,DioErrorType.badResponse));
    }on ServerDioException catch(dio){
      return Left(ServerFailure(dio.dioErrorModel.message,dio.dioErrorModel.stateCode!,dio.dioErrorModel.dioErrorType));
    }
  }
}

class GetParticipantWithEmailRepository extends BaseParticipantRepository<int,GetParticipantWithEmailEvent> {
  final BaseParticipantRemoteDataSource<int,GetParticipantWithEmailEvent> baseParticipantRemoteDataSource;


  GetParticipantWithEmailRepository(this.baseParticipantRemoteDataSource);

  @override
  Future<Either<Failure, int>> call(GetParticipantWithEmailEvent parameter) async {
    try {
      final result = await baseParticipantRemoteDataSource(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statesCode,DioErrorType.badResponse));
    }on ServerDioException catch(dio){
      return Left(ServerFailure(dio.dioErrorModel.message,dio.dioErrorModel.stateCode!,dio.dioErrorModel.dioErrorType));
    }
  }
}

class GetParticipantIdRepository extends BaseParticipantRepository<int,GetParticipantIdEvent> {
  final BaseParticipantLocalFile<int,GetParticipantIdEvent> baseParticipantLocalFile;

  GetParticipantIdRepository(this.baseParticipantLocalFile);

  @override
  Future<Either<Failure, int>> call(GetParticipantIdEvent parameter) async {
    try {
      final result = await baseParticipantLocalFile(parameter);
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage,failure.errorMessageModel.statesCode,DioErrorType.badResponse));
    }on ServerDioException catch(dio){
      return Left(ServerFailure(dio.dioErrorModel.message,dio.dioErrorModel.stateCode!,dio.dioErrorModel.dioErrorType));
    }
  }
}