import 'package:dartz/dartz.dart';
import 'package:speach_learning/Domain/Repository/repository_word.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/usecases/base_useCase.dart';

class SetStateWordUseCase extends BaseUseCase<bool,SetWordStateEvent>{
  final BaseWordRepository<bool,SetWordStateEvent> baseWordRepository;

  SetStateWordUseCase(this.baseWordRepository);

  @override
  Future<Either<Failure,bool>> call(SetWordStateEvent param) async {
    return await baseWordRepository(param);
  }
}