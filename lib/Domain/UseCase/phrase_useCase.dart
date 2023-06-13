import 'package:dartz/dartz.dart';
import 'package:speach_learning/Domain/Entity/PhraseItem.dart';
import 'package:speach_learning/Domain/Repository/repository_Phrase.dart';
import 'package:speach_learning/Presentation/PhraseUI/controler/phrase_bloc.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/usecases/base_useCase.dart';

class SetStatePhraseUseCase extends BaseUseCase<bool,SetPhraseStateEvent>{
  final BasePhraseRepository<bool,SetPhraseStateEvent> basePhraseRepository;

  SetStatePhraseUseCase(this.basePhraseRepository);

  @override
  Future<Either<Failure,bool>> call(SetPhraseStateEvent param) async {
    return await basePhraseRepository(param);
  }
}

class SetListWordAndPhraseStateUseCase extends BaseUseCase<int,SetListWordAndPhraseStateEvent>{
  final BasePhraseRepository<int,SetListWordAndPhraseStateEvent> basePhraseRepository;

  SetListWordAndPhraseStateUseCase(this.basePhraseRepository);

  @override
  Future<Either<Failure,int>> call(SetListWordAndPhraseStateEvent param) async {
    return await basePhraseRepository(param);
  }
}
class GetPhraseUseCase extends BaseUseCase<PhraseItem,GetPhraseEvent>{
  final BasePhraseRepository<PhraseItem,GetPhraseEvent> basePhraseRepository;

  GetPhraseUseCase(this.basePhraseRepository);

  @override
  Future<Either<Failure,PhraseItem>> call(GetPhraseEvent param) async {
    return await basePhraseRepository(param);
  }
}