import 'package:dartz/dartz.dart';
import 'package:speach_learning/Domain/Entity/Level.dart';
import 'package:speach_learning/Domain/Repository/repository_level.dart';
import 'package:speach_learning/Presentation/Home/controler/home_event.dart';
import 'package:speach_learning/Presentation/PhraseUI/controler/phrase_bloc.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/usecases/base_useCase.dart';

class GetLevelTreeUseCase extends BaseUseCase<Level,GetLevelEvent>{
  final BaseLevelRepository<Level,GetLevelEvent> baseLevelRepository;

  GetLevelTreeUseCase(this.baseLevelRepository);

  @override
  Future<Either<Failure,Level>> call(GetLevelEvent param) async {
    return await baseLevelRepository(param);
  }
}

class SetStateLevelUseCase extends BaseUseCase<bool,SetLevelStateEvent>{
  final BaseLevelRepository<bool,SetLevelStateEvent> baseLevelRepository;

  SetStateLevelUseCase(this.baseLevelRepository);

  @override
  Future<Either<Failure,bool>> call(SetLevelStateEvent param) async {
    return await baseLevelRepository(param);
  }
}