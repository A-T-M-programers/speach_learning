import 'package:dartz/dartz.dart';
import 'package:speach_learning/Domain/Entity/Participants.dart';
import 'package:speach_learning/Domain/Repository/repository_participant.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/utils/enums.dart';

class ParticipantUseCase{
  final BaseParticipantRepository baseParticipantRepository;

  ParticipantUseCase(this.baseParticipantRepository);

  Future<Either<Failure,ThemeApp>> executeSetThemeAppParticipant(ThemeApp mode,int id) async {
    return await baseParticipantRepository.setThemeAppParticipant(mode,id);
  }

  Future<Either<Failure,int>> executeSetLangParticipant(int lang,int id) async {
    return await baseParticipantRepository.setLangParticipant(lang,id);
  }

  Future<Either<Failure,String>> executeGetLangParticipant() async {
    return await baseParticipantRepository.getLangParticipant();
  }

  Future<Either<Failure,String>> executeSetPhotoParticipant(String photoPath,int id) async {
    return await baseParticipantRepository.setPhotoParticipant(photoPath,id);
  }

  Future<Either<Failure,String>> executeGetPhotoParticipant() async {
    return await baseParticipantRepository.getPhotoParticipant();
  }

  Future<Either<Failure,Participants>> executeSetParticipant(Participants participants) async {
    return await baseParticipantRepository.setParticipant(participants);
  }

  Future<Either<Failure,int>> executeGetParticipantId() async {
    return await baseParticipantRepository.getParticipantId();
  }

  Future<Either<Failure,Participants>> executeGetParticipantWithId(int id) async {
    return await baseParticipantRepository.getParticipantWithId(id);
  }
}