import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final String message;
  final int stateCode;
  final DioErrorType dioErrorType;

  const Failure(this.message,this.stateCode,this.dioErrorType);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure{
  const ServerFailure(super.message,super.stateCode,super.dioErrorType);
}
