import 'package:dartz/dartz.dart';
import 'package:speach_learning/Domain/Entity/Domains.dart';
import 'package:speach_learning/Domain/Repository/repository_domain_section.dart';
import 'package:speach_learning/core/error/failure.dart';

class GetAllSectionsUseCase{
  final BaseSectionsRepository baseSectionsRepository;

  GetAllSectionsUseCase(this.baseSectionsRepository);

  Future<Either<Failure,List<Domains>>> execute() async {
    return await baseSectionsRepository.getAllSectionsFromDataBase();
  }
}