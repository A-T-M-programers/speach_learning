import 'package:dartz/dartz.dart';
import 'package:speach_learning/Domain/Entity/Domains.dart';
import 'package:speach_learning/core/error/failure.dart';

abstract class BaseSectionsRepository{
  Future<Either<Failure,List<Domains>>> getAllSectionsFromDataBase();
}