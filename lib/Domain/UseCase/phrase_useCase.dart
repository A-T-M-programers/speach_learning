import 'package:dartz/dartz.dart';
import 'package:speach_learning/Domain/Repository/repository_Phrase.dart';
import 'package:speach_learning/Presentation/PhraseUI/controler/phrase_bloc.dart';
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