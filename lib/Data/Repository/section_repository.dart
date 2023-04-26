import 'package:dartz/dartz.dart';
import 'package:speach_learning/Data/DataSource/sections_remote_datasourse.dart';
import 'package:speach_learning/Domain/Entity/Domains.dart';
import 'package:speach_learning/Domain/Repository/repository_domain_section.dart';
import 'package:speach_learning/core/error/exceptions.dart';
import 'package:speach_learning/core/error/failure.dart';

class SectionsRepository extends BaseSectionsRepository{
  final BaseSectionsRemoteDataSource baseSectionsRemoteDataSource;


  SectionsRepository(this.baseSectionsRemoteDataSource);

  @override
  Future<Either<Failure,List<Domains>>> getAllSectionsFromDataBase() async{
    final result = await baseSectionsRemoteDataSource.getAllSectionsDataSource();
    try {
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}