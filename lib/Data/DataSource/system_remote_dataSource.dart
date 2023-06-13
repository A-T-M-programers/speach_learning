import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:speach_learning/Data/DataSource/participant_locale_file.dart';
import 'package:speach_learning/Presentation/LogIn/controler/log_in_bloc.dart';
import 'package:speach_learning/core/error/dio_error_model.dart';
import 'package:speach_learning/core/error/error_message_model.dart';
import 'package:speach_learning/core/error/exceptions.dart';
import 'package:speach_learning/core/network/api_constance.dart';
import 'package:speach_learning/core/network/check_connection.dart';
import 'package:speach_learning/core/services/services_locator.dart';

abstract class BaseSystemRemoteDataSource<T,Parameter> {
  Future<T> call(Parameter parameter);
}

class GetTokenRemoteDataSource extends BaseSystemRemoteDataSource<String,GetTokenEvent>{
  final BaseParticipantLocalFile<void, String> baseParticipantLocalFile;

  GetTokenRemoteDataSource(this.baseParticipantLocalFile);

  @override
  Future<String> call(GetTokenEvent parameter) async {
    if(await CheckConnection.getCheckConnectionNetWork()) {
      try {
        final formData = FormData.fromMap({"email": parameter.email, "password": parameter.password});
        final response = await Dio().post(ApiConstance.getTokenByLogIn, data: formData);
        if (response.statusCode == 200) {
          if(sl.isRegistered<Dio>(instanceName: "Dio")){

          }else {
            /// init Options
            BaseOptions option = BaseOptions(
              headers: {
                HttpHeaders.authorizationHeader: "Bearer " +
                    response.data["token"]
              },
              connectTimeout: const Duration(seconds: 5),
              receiveTimeout: const Duration(seconds: 10),
              receiveDataWhenStatusError: true,
            );

            /// init Dio
            sl.registerFactory(() => Dio(option), instanceName: "Dio");
          }
          await baseParticipantLocalFile(response.data["token"]);
          return response.data["token"];
        } else {
          throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
        }
      }on DioError catch(error){
        throw ServerDioException(dioErrorModel: DioErrorModel(stateCode: error.response != null ? error.response!.statusCode : 403, message: error.message?? "", dioErrorType: error.type));
      }
    }else{
      throw const ServerDioException(dioErrorModel: DioErrorModel(stateCode: 400, message: "err_network", dioErrorType: DioErrorType.connectionError));
    }
  }
}

class GetPermittingRemoteDataSource extends BaseSystemRemoteDataSource<String,CheckIsSuccessLogInEvent>{

  GetPermittingRemoteDataSource();

  @override
  Future<String> call(CheckIsSuccessLogInEvent parameter) async {
    if(await CheckConnection.getCheckConnectionNetWork()) {
      try {
        final response = await Dio().get('${ApiConstance.getPermitting}/getPermation.php');
        print(response.data);
        if (response.statusCode == 200) {
          return jsonDecode(response.data)["message"];
        } else {
          throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
        }
      }on DioError catch(error){
        throw ServerDioException(dioErrorModel: DioErrorModel(stateCode: error.response != null ? error.response!.statusCode : 403, message: error.message?? "", dioErrorType: error.type));
      }
    }else{
      throw const ServerDioException(dioErrorModel: DioErrorModel(stateCode: 400, message: "err_network", dioErrorType: DioErrorType.connectionError));
    }
  }
}