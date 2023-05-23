import 'package:shared_preferences/shared_preferences.dart';
import 'package:speach_learning/Presentation/LogIn/controler/log_in_bloc.dart';
import 'package:speach_learning/core/network/api_constance.dart';

abstract class BaseParticipantLocalFile<T,Parameter>{
  Future<T> call(Parameter parameter);
}

class SetParticipantIdLocaleFile extends BaseParticipantLocalFile<void,int>{

  @override
  Future<void> call(int parameter) async {
    await _saveOptionValue(parameter);
  }

  Future<void> _saveOptionValue(int optionValue) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('id_participant', optionValue);
    // ignore: avoid_print
    print('Saving option value as $optionValue successfully');
  }

  Future<int> getOption(int optionValue) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int option = preferences.getInt('id_participant') ?? optionValue;
    return option;
  }

}

class SetParticipantTokenLocaleFile extends BaseParticipantLocalFile<void,String>{

  @override
  Future<void> call(String parameter) async {
    await _saveOptionValue(parameter);
  }

  Future<void> _saveOptionValue(String parameter) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('token', parameter);
    // ignore: avoid_print
    print('Saving option value as $parameter successfully');
  }
}
class GetParticipantTokenLocaleFile{

  Future<String> getOption() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String option = preferences.getString('token') ?? "";
    if(option != ""){
      ApiConstance.token = option;
    }
    return option;
  }
}

class GetParticipantIdLocaleFile extends BaseParticipantLocalFile<int,GetParticipantIdEvent>{

  @override
  Future<int> call(GetParticipantIdEvent parameter) async {
    return await getOption(0);
  }

  Future<int> getOption(int optionValue) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int option = preferences.getInt('id_participant') ?? optionValue;
    return option;
  }

}