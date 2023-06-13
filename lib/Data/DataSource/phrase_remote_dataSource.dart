import 'package:dio/dio.dart';
import 'package:speach_learning/Data/Model/phrase_model.dart';
import 'package:speach_learning/Presentation/PhraseUI/controler/phrase_bloc.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/core/error/dio_error_model.dart';
import 'package:speach_learning/core/error/error_message_model.dart';
import 'package:speach_learning/core/error/exceptions.dart';
import 'package:speach_learning/core/network/api_constance.dart';
import 'package:speach_learning/core/network/check_connection.dart';
import 'package:speach_learning/core/services/services_locator.dart';

abstract class BasePhraseRemoteDataSource<T,Parameter> {
  Future<T> call(Parameter parameter);
}

class SetPhraseStateRemoteDataSource extends BasePhraseRemoteDataSource<bool,SetPhraseStateEvent>{

  SetPhraseStateRemoteDataSource();

  @override
  Future<bool> call(SetPhraseStateEvent parameter) async {
    if(await CheckConnection.getCheckConnectionNetWork()) {
      try {
        while(!sl.isRegistered<Dio>(instanceName: "Dio")) {
          await Future.delayed(const Duration(milliseconds: 500));
        }
        final formData = FormData.fromMap({
          "phrase": parameter.idPhrase,
          "status":parameter.state,
        });
        final response = await sl<Dio>(instanceName: "Dio").post("${ApiConstance.setPhraseState}/${parameter.idParticipant}", data: formData);
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

class SetListWordAndPhraseStateRemoteDataSource extends BasePhraseRemoteDataSource<int,SetListWordAndPhraseStateEvent>{

  SetListWordAndPhraseStateRemoteDataSource();

  @override
  Future<int> call(SetListWordAndPhraseStateEvent parameter) async {
    if(await CheckConnection.getCheckConnectionNetWork()) {
      try {
        while(!sl.isRegistered<Dio>(instanceName: "Dio")) {
          await Future.delayed(const Duration(milliseconds: 500));
        }
        final formData = FormData.fromMap({
          "phrase_id":parameter.idPhrase,
          "phrase_status":parameter.statePhrase,
          "words":List.generate(parameter.mapWordState.length, (index) {
            return {"phrase_word_id": parameter.mapWordState.keys.elementAt(index), "phrase_word_status":parameter.mapWordState.values.elementAt(index)};})
        });
        final response = await sl<Dio>(instanceName: "Dio").post("${ApiConstance.setListWordAndPhraseState}/${parameter.idParticipant}", data: formData);
        if (response.statusCode == 200) {
          return response.data["next_phrase_id"];
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

class GetPhraseRemoteDataSource extends BasePhraseRemoteDataSource<PhraseModel,GetPhraseEvent>{

  GetPhraseRemoteDataSource();

  @override
  Future<PhraseModel> call(GetPhraseEvent parameter) async {
    if(await CheckConnection.getCheckConnectionNetWork()) {
      try {
        while(!sl.isRegistered<Dio>(instanceName: "Dio")) {
          await Future.delayed(const Duration(milliseconds: 500));
        }
        final response = await sl<Dio>(instanceName: "Dio").get("${ApiConstance.getPhrase}/${parameter.idParticipant}?phrase_id=${parameter.idPhrase}");
        if (response.statusCode == 200 && response.data["data"].isNotEmpty && response.data["data"] != null) {
          return PhraseModel.fromJson(response.data["data"][0]);
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