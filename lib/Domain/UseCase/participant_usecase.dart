import 'package:dartz/dartz.dart';
import 'package:speach_learning/Domain/Entity/Participants.dart';
import 'package:speach_learning/Domain/Repository/repository_participant.dart';
import 'package:speach_learning/Presentation/LogIn/controler/log_in_bloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileEvent.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/usecases/base_useCase.dart';
import 'package:speach_learning/core/utils/enums.dart';

class SetThemeAppParticipantUseCase extends BaseUseCase<ThemeApp,SetThemeAppParticipantEvent> {
  final BaseParticipantRepository<ThemeApp,SetThemeAppParticipantEvent> baseParticipantRepository;

  SetThemeAppParticipantUseCase(this.baseParticipantRepository);

  @override
  Future<Either<Failure, ThemeApp>> call(SetThemeAppParticipantEvent param) async {
    return await baseParticipantRepository(param);
  }
}

class SetLangParticipantUseCase extends BaseUseCase<int,SetLangParticipantEvent> {
  final BaseParticipantRepository<int,SetLangParticipantEvent> baseParticipantRepository;

  SetLangParticipantUseCase(this.baseParticipantRepository);

  @override
  Future<Either<Failure, int>> call(SetLangParticipantEvent param) async {
    return await baseParticipantRepository(param);
  }
}

class SetPhotoParticipantUseCase extends BaseUseCase<String,SetPhotoParticipantEvent> {
  final BaseParticipantRepository<String,SetPhotoParticipantEvent> baseParticipantRepository;

  SetPhotoParticipantUseCase(this.baseParticipantRepository);

  @override
  Future<Either<Failure, String>> call(SetPhotoParticipantEvent param) async {
    return await baseParticipantRepository(param);
  }
}

class SetParticipantDialectUseCase extends BaseUseCase<int,SetParticipantDialectEvent> {
  final BaseParticipantRepository<int,SetParticipantDialectEvent> baseParticipantRepository;

  SetParticipantDialectUseCase(this.baseParticipantRepository);

  @override
  Future<Either<Failure, int>> call(SetParticipantDialectEvent param) async {
    return await baseParticipantRepository(param);
  }
}

class SetParticipantUseCase extends BaseUseCase<int,SetParticipantEvent> {
  final BaseParticipantRepository<int,SetParticipantEvent> baseParticipantRepository;

  SetParticipantUseCase(this.baseParticipantRepository);

  @override
  Future<Either<Failure, int>> call(SetParticipantEvent param) async {
    return await baseParticipantRepository(param);
  }
}
class GetParticipantWithIdUseCase extends BaseUseCase<Participants,GetParticipantEvent> {
  final BaseParticipantRepository<Participants,GetParticipantEvent> baseParticipantRepository;

  GetParticipantWithIdUseCase(this.baseParticipantRepository);

  @override
  Future<Either<Failure, Participants>> call(GetParticipantEvent param) async {
    return await baseParticipantRepository(param);
  }
}

class GetParticipantWithEmailUseCase extends BaseUseCase<int,GetParticipantWithEmailEvent> {
  final BaseParticipantRepository<int,GetParticipantWithEmailEvent> baseParticipantRepository;

  GetParticipantWithEmailUseCase(this.baseParticipantRepository);

  @override
  Future<Either<Failure, int>> call(GetParticipantWithEmailEvent param) async {
    return await baseParticipantRepository(param);
  }
}

class GetParticipantIdUseCase extends BaseUseCase<int,GetParticipantIdEvent> {
  final BaseParticipantRepository<int,GetParticipantIdEvent> baseParticipantRepository;

  GetParticipantIdUseCase(this.baseParticipantRepository);

  @override
  Future<Either<Failure, int>> call(GetParticipantIdEvent param) async {
    return await baseParticipantRepository(param);
  }
}