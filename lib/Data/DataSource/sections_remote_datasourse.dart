import 'package:dio/dio.dart';
import 'package:speach_learning/Data/Model/domains_model.dart';
import 'package:speach_learning/Presentation/Home/controler/home_event.dart';
import 'package:speach_learning/core/error/exceptions.dart';
import 'package:speach_learning/core/network/api_constance.dart';
import 'package:speach_learning/core/network/check_connection.dart';
import 'package:speach_learning/core/error/dio_error_model.dart';
import 'package:speach_learning/core/error/error_message_model.dart';
import 'package:speach_learning/core/services/services_locator.dart';

abstract class BaseSectionsRemoteDataSource<T, Parameter> {
  Future<T> call(Parameter parameter);
}

class SectionsRemoteDataSource extends BaseSectionsRemoteDataSource<List<DomainsModel>, GetAllSectionsEvent> {
  @override
  Future<List<DomainsModel>> call(GetAllSectionsEvent parameter) async {
    if(await CheckConnection.getCheckConnectionNetWork()) {
      try {
        while(!sl.isRegistered<Dio>(instanceName: "Dio")) {
          await Future.delayed(const Duration(milliseconds: 500));
        }
        final response = await sl<Dio>(instanceName: "Dio").get('${ApiConstance.getDomainAllByParticipant}/${parameter.idParticipant}');
        if (response.statusCode == 200) {
          return List.generate(response.data["data"].length, (index) => DomainsModel.fromJson(response.data["data"][index]));
        } else {
          throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
        }
      } on DioError catch (error) {
        throw ServerDioException(dioErrorModel: DioErrorModel(stateCode: error.response != null ? error.response!.statusCode : 403, message: error.response != null ? error.response!.statusMessage! : error.message ?? "", dioErrorType: error.type));
      }
    }else{
      throw const ServerDioException(dioErrorModel: DioErrorModel(stateCode: 400, message: "err_network", dioErrorType: DioErrorType.connectionError));
    }
  }
}

class SetDomainStateRemoteDataSource extends BaseSectionsRemoteDataSource<bool,SetDomainStateEvent>{

  SetDomainStateRemoteDataSource();

  @override
  Future<bool> call(SetDomainStateEvent parameter) async {
    if(await CheckConnection.getCheckConnectionNetWork()) {
      try {
        while(!sl.isRegistered<Dio>(instanceName: "Dio")) {
          await Future.delayed(const Duration(milliseconds: 500));
        }
        final formData = FormData.fromMap({
          "domain": parameter.idDomain,
          "status":parameter.state,
        });
        final response = await sl<Dio>(instanceName: "Dio").post("${ApiConstance.setDomainState}/${parameter.idParticipant}", data: formData);
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
