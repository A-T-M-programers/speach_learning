import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseParticipantLocalFile{
  Future<void> setIdParticipant(int id);
  Future<int> getParticipantId();
}

class ParticipantLocaleFile extends BaseParticipantLocalFile{

  @override
  Future<void> setIdParticipant(int id) async {
    await _saveOptionValue(id);
  }

  @override
  Future<int> getParticipantId() async {
    return await getOption(0);
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