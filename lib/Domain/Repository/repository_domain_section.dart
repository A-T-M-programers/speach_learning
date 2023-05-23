import 'package:dartz/dartz.dart';
import 'package:speach_learning/Domain/Entity/Domains.dart';
import 'package:speach_learning/core/error/failure.dart';

abstract class BaseSectionsRepository<T,Parameter>{
  Future<Either<Failure,T>> call(Parameter parameter);
}