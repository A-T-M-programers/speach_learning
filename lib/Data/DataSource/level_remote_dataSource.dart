import 'package:dio/dio.dart';
import 'package:speach_learning/Data/Model/level_model.dart';
import 'package:speach_learning/Presentation/Home/controler/home_event.dart';
import 'package:speach_learning/Presentation/PhraseUI/controler/phrase_bloc.dart';
import 'package:speach_learning/core/error/exceptions.dart';
import 'package:speach_learning/core/error/filter_error.dart';
import 'package:speach_learning/core/network/api_constance.dart';
import 'package:speach_learning/core/network/check_connection.dart';
import 'package:speach_learning/core/error/dio_error_model.dart';
import 'package:speach_learning/core/error/error_message_model.dart';
import 'package:speach_learning/core/services/services_locator.dart';

abstract class BaseLevelRemoteDataSource<T,Parameter> {
  Future<T> call(Parameter parameter);
}

class GetLevelRemoteDataSource extends BaseLevelRemoteDataSource<LevelModel,GetLevelEvent>{

  GetLevelRemoteDataSource();

  @override
  Future<LevelModel> call(GetLevelEvent parameter) async {
    if(await CheckConnection.getCheckConnectionNetWork()) {
      try {
        while(!sl.isRegistered<Dio>(instanceName: "Dio")) {
          await Future.delayed(const Duration(milliseconds: 500));
        }
        final response = await sl<Dio>(instanceName: "Dio").get("${ApiConstance.apiLevelKey}/${parameter.idParticipant}?level_id=${parameter.idLevel}");
        if (response.statusCode == 200) {
          return LevelModel.fromJson(response.data["data"]);
        } else {
          throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
        }
      }on DioError catch(error){
        throw ServerDioException(dioErrorModel: DioErrorModel(stateCode: error.response != null ? error.response!.statusCode : 403, message: FilterErrorBySectionNumber(error.response != null ? error.response!.statusCode?? 403 : 403).call(), dioErrorType: error.type));
      }
    }else{
      throw const ServerDioException(dioErrorModel: DioErrorModel(stateCode: 400, message: "err_network", dioErrorType: DioErrorType.connectionError));
    }
  }
}

class SetLevelStateRemoteDataSource extends BaseLevelRemoteDataSource<bool,SetLevelStateEvent>{

  SetLevelStateRemoteDataSource();

  @override
  Future<bool> call(SetLevelStateEvent parameter) async {
    if(await CheckConnection.getCheckConnectionNetWork()) {
      try {
        while(!sl.isRegistered<Dio>(instanceName: "Dio")) {
          await Future.delayed(const Duration(milliseconds: 500));
        }
        final formData = FormData.fromMap({
          "level": parameter.idLevel,
          "status":parameter.state,
        });
        final response = await sl<Dio>(instanceName: "Dio").post("${ApiConstance.setLevelState}/${parameter.idParticipant}", data: formData);
        if (response.statusCode == 200) {
          return true;
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