import 'package:dartz/dartz.dart';
import 'package:speach_learning/Domain/Entity/Dialects.dart';
import 'package:speach_learning/Domain/Repository/repository_dialects.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/usecases/base_useCase.dart';

class GetAllDialectsUseCase extends BaseUseCase<List<Dialects>,GetAllDialectEvent>{
  final BaseDialectsRepository<List<Dialects>,GetAllDialectEvent> baseDialectsRepository;

  GetAllDialectsUseCase(this.baseDialectsRepository);

  @override
  Future<Either<Failure,List<Dialects>>> call(GetAllDialectEvent param) async {
    return await baseDialectsRepository(param);
  }
}