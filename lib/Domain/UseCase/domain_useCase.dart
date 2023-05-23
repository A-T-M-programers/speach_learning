import 'package:dartz/dartz.dart';
import 'package:speach_learning/Domain/Repository/repository_domain_section.dart';
import 'package:speach_learning/Presentation/Home/controler/home_event.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/usecases/base_useCase.dart';

class SetDomainStateUseCase extends BaseUseCase<bool,SetDomainStateEvent>{
  final BaseSectionsRepository<bool,SetDomainStateEvent> baseLevelRepository;

  SetDomainStateUseCase(this.baseLevelRepository);

  @override
  Future<Either<Failure,bool>> call(SetDomainStateEvent param) async {
    return await baseLevelRepository(param);
  }
}