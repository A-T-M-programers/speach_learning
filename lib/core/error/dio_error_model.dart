import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';


class DioErrorModel extends Equatable{
  final DioErrorType dioErrorType;
  final String message;
  final int? stateCode;

  const DioErrorModel({
    this.dioErrorType = DioErrorType.unknown,
    this.message = "",
    this.stateCode = 403});

  @override
  List<Object> get props => [dioErrorType,message,stateCode ?? 403];
}