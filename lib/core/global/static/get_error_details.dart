import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetErrorDetails{
  GetErrorDetails();

  IconData getIconError(DioErrorType dioErrorType){
    switch(dioErrorType){
      case DioErrorType.connectionTimeout:
        return Icons.wifi_off_rounded;
      case DioErrorType.sendTimeout:
        return Icons.wifi_off_rounded;
      case DioErrorType.receiveTimeout:
        return Icons.wifi_off_rounded;
      case DioErrorType.badCertificate:
        return Icons.error_outline_rounded;
      case DioErrorType.badResponse:
        return Icons.error_outline_rounded;
      case DioErrorType.cancel:
        return Icons.error_outline_rounded;
      case DioErrorType.connectionError:
        return Icons.wifi_off_rounded;
      case DioErrorType.unknown:
        return Icons.error_outline_rounded;
    }
  }
}