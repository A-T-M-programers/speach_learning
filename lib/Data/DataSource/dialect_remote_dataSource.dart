import 'package:dio/dio.dart';
import 'package:speach_learning/Data/Model/dialect_model.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/core/error/exceptions.dart';
import 'package:speach_learning/core/global/static/static_variable.dart';
import 'package:speach_learning/core/network/api_constance.dart';
import 'package:speach_learning/core/network/check_connection.dart';
import 'package:speach_learning/core/error/dio_error_model.dart';
import 'package:speach_learning/core/error/error_message_model.dart';
import 'package:speach_learning/core/services/services_locator.dart';

abstract class BaseDialectRemoteDataSource<T,Parameter> {
  Future<T> call(Parameter parameter);
}

class GetAllDialectsRemoteDataSource extends BaseDialectRemoteDataSource<List<DialectModel>,GetAllDialectEvent>{

  GetAllDialectsRemoteDataSource();

  @override
  Future<List<DialectModel>> call(GetAllDialectEvent parameter) async {
    if(await CheckConnection.getCheckConnectionNetWork()) {
      try {
        while(!sl.isRegistered<Dio>(instanceName: "Dio")) {
          await Future.delayed(const Duration(milliseconds: 500));
        }
        final response = await sl<Dio>(instanceName: "Dio").get(ApiConstance.apiAllDialectsKey);
        if (response.statusCode == 200) {
          List<DialectModel> list = [];
          int idLanguage = response.data.firstWhere((element) => element["id"] == StaticVariable.participants.idDialects)["language_id"];
          for(int i = 0 ; i < response.data.length; i++){
            if(response.data[i]["language_id"] == idLanguage) list.add(DialectModel.fromJson(response.data[i]));
          }
          return list;
        } else {
          throw ServerException(
              errorMessageModel: ErrorMessageModel.fromJson(response.data));
        }
      }on DioError catch(error){
        throw ServerDioException(dioErrorModel: DioErrorModel(stateCode: error.response != null ? error.response!.statusCode : 403, message: error.message?? "", dioErrorType: error.type));
      }
    }else{
      throw const ServerDioException(dioErrorModel: DioErrorModel(stateCode: 400, message: "err_network", dioErrorType: DioErrorType.connectionError));
    }
  }
}