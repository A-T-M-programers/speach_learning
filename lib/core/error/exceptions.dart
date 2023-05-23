import 'package:speach_learning/core/error/dio_error_model.dart';
import 'package:speach_learning/core/error/error_message_model.dart';

class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});
}

class ServerDioException implements Exception{
  final DioErrorModel dioErrorModel;

  const ServerDioException({required this.dioErrorModel});
}