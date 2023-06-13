import 'dart:io';

import 'package:dio/dio.dart';
import 'package:speach_learning/Data/DataSource/participant_locale_file.dart';
import 'package:speach_learning/Data/Model/participant_model.dart';
import 'package:speach_learning/Presentation/LogIn/controler/log_in_bloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileEvent.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/core/error/exceptions.dart';
import 'package:speach_learning/core/global/static/static_variable.dart';
import 'package:speach_learning/core/network/api_constance.dart';
import 'package:speach_learning/core/network/check_connection.dart';
import 'package:speach_learning/core/error/dio_error_model.dart';
import 'package:speach_learning/core/network/download_image.dart';
import 'package:speach_learning/core/error/error_message_model.dart';
import 'package:speach_learning/core/services/services_locator.dart';
import 'package:speach_learning/core/utils/enums.dart';


abstract class BaseParticipantRemoteDataSource<T,Parameter>{
  Future<T> call(Parameter parameter);
}

class SetThemeParticipantRemoteDataSource extends BaseParticipantRemoteDataSource<ThemeApp,SetThemeAppParticipantEvent> {
  SetThemeParticipantRemoteDataSource();

  @override
  Future<ThemeApp> call(SetThemeAppParticipantEvent parameter) async {
    if(await CheckConnection.getCheckConnectionNetWork()) {
      try {
        while(!sl.isRegistered<Dio>(instanceName: "Dio")) {
          await Future.delayed(const Duration(milliseconds: 500));
        }
        final formData = FormData.fromMap({
          "_method": "patch",
          "theme_app": parameter.themeApp == ThemeApp.light ? "L" : "D",
        });
        final response = await sl<Dio>(instanceName: "Dio").post(
            "${ApiConstance.apiParticipantKey}/${parameter.id}",
            data: formData);
        if (response.statusCode == 200) {
          return parameter.themeApp;
        } else {
          throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
        }
      }on DioError catch(error){
        throw ServerDioException(dioErrorModel: DioErrorModel(stateCode: error.response != null ? error.response!.statusCode : 403, message: error.message ?? "", dioErrorType: error.type));
      }
    }else{
      throw const ServerDioException(dioErrorModel: DioErrorModel(stateCode: 400, message: "err_network", dioErrorType: DioErrorType.connectionError));
    }
  }
}
class SetLangParticipantRemoteDataSource extends BaseParticipantRemoteDataSource<int,SetLangParticipantEvent> {
  SetLangParticipantRemoteDataSource();

  @override
  Future<int> call(SetLangParticipantEvent parameter) async {
    if(await CheckConnection.getCheckConnectionNetWork()) {
      try {
        while(!sl.isRegistered<Dio>(instanceName: "Dio")) {
          await Future.delayed(const Duration(milliseconds: 500));
        }
        final formData = FormData.fromMap({
          "_method": "patch",
          "lang_app": parameter.lang,
        });
        final response = await sl<Dio>(instanceName: "Dio").post(
            "${ApiConstance.apiParticipantKey}/${parameter.id}",
            data: formData);
        if (response.statusCode == 200) {
          return parameter.lang;
        } else {
          throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
        }
      }on DioError catch(error){
        throw ServerDioException(dioErrorModel: DioErrorModel(stateCode: error.response != null ? error.response!.statusCode : 403, message: error.message ?? "", dioErrorType: error.type));
      }
    }else{
      throw const ServerDioException(dioErrorModel: DioErrorModel(stateCode: 400, message: "err_network", dioErrorType: DioErrorType.connectionError));
    }
  }
}
class SetPhotoParticipantRemoteDataSource extends BaseParticipantRemoteDataSource<String,SetPhotoParticipantEvent> {
  SetPhotoParticipantRemoteDataSource();

  @override
  Future<String> call(SetPhotoParticipantEvent parameter) async {
    if(await CheckConnection.getCheckConnectionNetWork()) {
      try {
        while(!sl.isRegistered<Dio>(instanceName: "Dio")) {
          await Future.delayed(const Duration(milliseconds: 500));
        }
        final formData = FormData.fromMap({
          "_method": "patch",
          "avatar": await MultipartFile.fromFile(parameter.photoPath, filename: "avatar.jpg"),
        });
        final response = await sl<Dio>(instanceName: "Dio").post(
            "${ApiConstance.apiParticipantKey}/${parameter.id}",
            data: formData);
        if (response.statusCode == 200) {
          return ApiConstance.urlParticipantStorageImage + "/" + parameter.id.toString() + "." + "jpg";
        } else {
          throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
        }
      }on DioError catch(error){
        throw ServerDioException(dioErrorModel: DioErrorModel(stateCode: error.response != null ? error.response!.statusCode : 403, message: error.message ?? "", dioErrorType: error.type));
      }
    }else{
      throw const ServerDioException(dioErrorModel: DioErrorModel(stateCode: 400, message: "err_network", dioErrorType: DioErrorType.connectionError));
    }
  }
}

class SetParticipantDialectRemoteDataSource extends BaseParticipantRemoteDataSource<int,SetParticipantDialectEvent> {
  SetParticipantDialectRemoteDataSource();

  @override
  Future<int> call(SetParticipantDialectEvent parameter) async {
    if(await CheckConnection.getCheckConnectionNetWork()) {
      try {
        while(!sl.isRegistered<Dio>(instanceName: "Dio")) {
          await Future.delayed(const Duration(milliseconds: 500));
        }
        final formData = FormData.fromMap({
          "_method": "patch",
          "dialect_id": parameter.idDialect,
        });
        final response = await sl<Dio>(instanceName: "Dio").post(
            "${ApiConstance.apiParticipantKey}/${parameter.idParticipant}",
            data: formData);
        if (response.statusCode == 200) {
          StaticVariable.participants.setIdDialect(parameter.idDialect);
          return parameter.idDialect;
        } else {
          throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
        }
      }on DioError catch(error){
        throw ServerDioException(dioErrorModel: DioErrorModel(stateCode: error.response != null ? error.response!.statusCode : 403, message: error.message ?? "", dioErrorType: error.type));
      }
    }else{
      throw const ServerDioException(dioErrorModel: DioErrorModel(stateCode: 400, message: "err_network", dioErrorType: DioErrorType.connectionError));
    }
  }
}

class SetParticipantRemoteDataSource extends BaseParticipantRemoteDataSource<int,SetParticipantEvent> {

  final BaseParticipantLocalFile<void,int> baseParticipantLocalFile;

  SetParticipantRemoteDataSource(this.baseParticipantLocalFile);

  @override
  Future<int> call(SetParticipantEvent parameter) async {
    if(await CheckConnection.getCheckConnectionNetWork()) {
      try {
        while(!sl.isRegistered<Dio>(instanceName: "Dio")) {
          await Future.delayed(const Duration(milliseconds: 500));
        }
        File? file;
        if(parameter.participants.imageParticipant.linkImage != ""){
          file = await DownloadImage(parameter.participants.imageParticipant.linkImage).downloadFileImage();
        }
        final formData = FormData.fromMap({
          "name": parameter.participants.name,
          "email":parameter.participants.email,
          "avatar": await MultipartFile.fromFile(file!.path, filename: "avatar.jpg"),
          "theme_app":parameter.participants.themApp == ThemeApp.light ? "L" : "D",
          "is_admob": parameter.participants.isAdmob ? "1" : "0",
          "lang_app":parameter.participants.langApp.toString(),
          "dialect_id":parameter.participants.idDialects
        });
        final response = await sl<Dio>(instanceName: "Dio").post(
            ApiConstance.apiParticipantKey,
            data: formData);
        if (response.statusCode == 200) {
          baseParticipantLocalFile(response.data["id"]);
          return response.data["id"];
        } else {
          throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
        }
      }on DioError catch(error){
        throw ServerDioException(dioErrorModel: DioErrorModel(stateCode: error.response != null ? error.response!.statusCode : 403, message: error.message ?? "", dioErrorType: error.type));
      }
    }else{
      throw const ServerDioException(dioErrorModel: DioErrorModel(stateCode: 400, message: "err_network", dioErrorType: DioErrorType.connectionError));
    }
  }
}
class GetParticipantWithIdRemoteDataSource extends BaseParticipantRemoteDataSource<ParticipantModel,GetParticipantEvent> {

  GetParticipantWithIdRemoteDataSource();

  @override
  Future<ParticipantModel> call(GetParticipantEvent parameter) async {
    if(await CheckConnection.getCheckConnectionNetWork()) {
    try {
      while(!sl.isRegistered<Dio>(instanceName: "Dio")) {
        await Future.delayed(const Duration(milliseconds: 500));
      }
      final response = await sl<Dio>(instanceName: "Dio").get("${ApiConstance.apiParticipantKey}/${parameter.id}");
      if (response.statusCode == 200) {
        return ParticipantModel.fromJson(response.data["data"]);
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
class GetIdParticipantWithEmailRemoteDataSource extends BaseParticipantRemoteDataSource<int,GetParticipantWithEmailEvent> {

  GetIdParticipantWithEmailRemoteDataSource();

  @override
  Future<int> call(GetParticipantWithEmailEvent parameter) async {
    if(await CheckConnection.getCheckConnectionNetWork()) {
    try {
      while(!sl.isRegistered<Dio>(instanceName: "Dio")) {
        await Future.delayed(const Duration(milliseconds: 500));
      }
      final response = await sl<Dio>(instanceName: "Dio").get("${ApiConstance.getParticipantWithEmail}=${parameter.email}");
      if (response.statusCode == 200) {
        return response.data["data"]["id"];
      } else {
        throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    }on DioError catch(error){
      throw ServerDioException(dioErrorModel: DioErrorModel(stateCode: error.response != null ? error.response!.statusCode : 403, message: error.message ?? "", dioErrorType: error.type));
    }
    }else{
      throw const ServerDioException(dioErrorModel: DioErrorModel(stateCode: 400, message: "err_network", dioErrorType: DioErrorType.connectionError));
    }
  }
}
