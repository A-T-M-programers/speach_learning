import 'package:dartz/dartz.dart';
import 'package:speach_learning/Domain/Entity/Domains.dart';
import 'package:speach_learning/Domain/Repository/repository_domain_section.dart';
import 'package:speach_learning/Presentation/Home/controler/home_event.dart';
import 'package:speach_learning/core/error/failure.dart';
import 'package:speach_learning/core/usecases/base_useCase.dart';

class GetAllSectionsUseCase extends BaseUseCase<List<Domains>,GetAllSectionsEvent> {
  final BaseSectionsRepository<List<Domains>,GetAllSectionsEvent> baseSectionsRepository;

  GetAllSectionsUseCase(this.baseSectionsRepository);

  @override
  Future<Either<Failure,List<Domains>>> call(GetAllSectionsEvent param) async {
    return await baseSectionsRepository(param);
  }
}