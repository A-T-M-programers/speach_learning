import 'package:dio/dio.dart';
import 'package:speach_learning/Data/DataSource/participant_locale_file.dart';
import 'package:speach_learning/Data/Model/participant_model.dart';
import 'package:speach_learning/Domain/Entity/Dialects.dart';
import 'package:speach_learning/Domain/Entity/Lang.dart';
import 'package:speach_learning/Domain/Entity/Participants.dart';
import 'package:speach_learning/core/error/exceptions.dart';
import 'package:speach_learning/core/network/api_constance.dart';
import 'package:speach_learning/core/network/error_message_model.dart';
import 'package:speach_learning/core/utils/enums.dart';


abstract class BaseParticipantRemoteDataSource{
  Future<ThemeApp> setThemeAppParticipantDataSource(ThemeApp mode,int id);
  Future<int> setLangParticipantDataSource(int lang,int id);
  Future<String> getLangParticipantDataSource();
  Future<String> setPhotoParticipantDataSource(String photoPath,int id);
  Future<String> getPhotoParticipantDataSource();
  Future<ParticipantModel> setParticipantDataSource(Participants participants);
  Future<ParticipantModel> getParticipantWithIdDataSource(int id);
}

class ParticipantRemoteDataSource extends BaseParticipantRemoteDataSource{

  final BaseParticipantLocalFile baseParticipantLocalFile;


  ParticipantRemoteDataSource(this.baseParticipantLocalFile);

  @override
  Future<ThemeApp> setThemeAppParticipantDataSource(ThemeApp mode, int id) async {

    // final response = await Dio().get(ApiConstance.participantPath);
    // if(response.statusCode == 200){
    //   return List<SectionsModel>.from(response.data);
    // }else{
    //   throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    // }
    return mode;
  }

  @override
  Future<String> getLangParticipantDataSource() async {

    // final response = await Dio().get(ApiConstance.participantPath);
    // if(response.statusCode == 200){
    //   return List<SectionsModel>.from(response.data);
    // }else{
    //   throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    // }
    return "en";
  }
  @override
  Future<int> setLangParticipantDataSource(int lang,int id) async {

    // final response = await Dio().get(ApiConstance.participantPath);
    // if(response.statusCode == 200){
    //   return List<SectionsModel>.from(response.data);
    // }else{
    //   throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    // }
    return lang;
  }

  @override
  Future<String> getPhotoParticipantDataSource() async {

    // final response = await Dio().get(ApiConstance.participantPath);
    // if(response.statusCode == 200){
    //   return List<SectionsModel>.from(response.data);
    // }else{
    //   throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    // }
    return "";
  }
  @override
  Future<String> setPhotoParticipantDataSource(String photoPath,int id) async {

    // final response = await Dio().get(ApiConstance.participantPath);
    // if(response.statusCode == 200){
    //   return List<SectionsModel>.from(response.data);
    // }else{
    //   throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    // }
    return photoPath;
  }

  @override
  Future<ParticipantModel> setParticipantDataSource(Participants participants) async {

    // final response = await Dio().get(ApiConstance.participantPath);
    // if(response.statusCode == 200){
    //   return List<SectionsModel>.from(response.data);
    // }else{
    //   throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    // }

    baseParticipantLocalFile.setIdParticipant(participants.id);
    return ParticipantModel(
        id: participants.id,
        name: participants.name,
        email: participants.email,
        imageParticipant:participants.imageParticipant,
        langApp: participants.langApp,
        themApp: participants.themApp,
        isAdmob:participants.isAdmob,
        learnWordCount: participants.learnWordCount,
        learnPhraseCount: participants.learnPhraseCount,
        dialects: participants.dialects);
  }

  @override
  Future<ParticipantModel> getParticipantWithIdDataSource(int id) async {

    final response = await Dio().get("${ApiConstance.getParticipantWithId}/$id");
    if(response.statusCode == 200){
      return ParticipantModel.fromJson(response.data["data"]);
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  //   return ParticipantModel(
  //       id: id,
  //       name: "tofiq daowd",
  //       email: "tofikdaowd@gmail.com",
  //       imageParticipant: const ImageParticipant(linkImage: "", stateImage: StateImage.local),
  //       langApp: "en",
  //       themApp: ThemeApp.dark,
  //       volume: 0.5,
  //       isAdmob:false,
  //       learnWordCount: 0,
  //       learnPhraseCount: 0,
  //       dialects: const Dialects(id: 0,locale: "en-US",key: "en-us-x-tpf-local",lang: Lang(id: 0,name: "English")));
  }
}