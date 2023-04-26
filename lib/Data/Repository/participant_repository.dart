import 'package:dartz/dartz.dart';
import 'package:speach_learning/Data/DataSource/participant_locale_file.dart';
import 'package:speach_learning/Data/DataSource/participant_remote_datasourc.dart';
import 'package:speach_learning/Domain/Entity/Participants.dart';
import 'package:speach_learning/Domain/Repository/repository_participant.dart';
import 'package:speach_learning/core/error/exceptions.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/services/services_locator.dart';
import 'package:speach_learning/core/utils/enums.dart';

class ParticipantRepository extends BaseParticipantRepository{
  final BaseParticipantRemoteDataSource baseParticipantRemoteDataSource;
  final BaseParticipantLocalFile baseParticipantLocalFile;


  ParticipantRepository(this.baseParticipantRemoteDataSource,this.baseParticipantLocalFile);

  @override
  Future<Either<Failure,ThemeApp>> setThemeAppParticipant(ThemeApp mode,int id) async{
    final result = await baseParticipantRemoteDataSource.setThemeAppParticipantDataSource(mode,id);
    try {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, String>> getLangParticipant() async {
    final result = await baseParticipantRemoteDataSource.getLangParticipantDataSource();
    try {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, int>> setLangParticipant(int lang,int id) async {
    final result = await baseParticipantRemoteDataSource.setLangParticipantDataSource(lang,id);
    try {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, String>> getPhotoParticipant() async {
    final result = await baseParticipantRemoteDataSource.getPhotoParticipantDataSource();
    try {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, String>> setPhotoParticipant(String photoPath,int id) async {
    final result = await baseParticipantRemoteDataSource.setPhotoParticipantDataSource(photoPath,id);
    try {
      Participants.from(sl()).setImageParticipant(ImageParticipant(linkImage: result, stateImage: StateImage.local));
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Participants>> setParticipant(Participants participants) async {
    final result = await baseParticipantRemoteDataSource.setParticipantDataSource(participants);
    try {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, int>> getParticipantId() async {
    final result = await baseParticipantLocalFile.getParticipantId();
    try {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Participants>> getParticipantWithId(int id) async {
    final result = await baseParticipantRemoteDataSource.getParticipantWithIdDataSource(id);
    try {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

}