import 'package:dartz/dartz.dart';
import 'package:speach_learning/core/error/failure.dart';

abstract class BaseWordRepository<T,Parameter>{
  Future<Either<Failure,T>> call(Parameter parameter);
}