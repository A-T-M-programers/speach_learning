import 'package:dartz/dartz.dart';
import 'package:speach_learning/Domain/Entity/Participants.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/utils/enums.dart';

abstract class BaseParticipantRepository{
  Future<Either<Failure,ThemeApp>> setThemeAppParticipant(ThemeApp mode,int id);
  Future<Either<Failure,String>> getLangParticipant();
  Future<Either<Failure,int>> setLangParticipant(int lang, int id);
  Future<Either<Failure,String>> getPhotoParticipant();
  Future<Either<Failure,String>> setPhotoParticipant(String photoPath, int id);
  Future<Either<Failure,Participants>> setParticipant(Participants participants);
  Future<Either<Failure,int>> getParticipantId();
  Future<Either<Failure,Participants>> getParticipantWithId(int id);
}