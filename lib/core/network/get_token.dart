import 'package:dio/dio.dart';
import 'package:speach_learning/Data/DataSource/participant_locale_file.dart';
import 'api_constance.dart';
import 'check_connection.dart';

class GetToken {
  final BaseParticipantLocalFile<void,String> baseParticipantLocalFile;
  final GetParticipantTokenLocaleFile getParticipantTokenLocaleFile;


  GetToken(this.baseParticipantLocalFile, this.getParticipantTokenLocaleFile);

  Future<bool> call() async {
      if (await CheckConnection.getCheckConnectionNetWork()) {
        try {
          final response = await Dio().post(ApiConstance.getTokenByLogIn, data: {"email": "voca@test.com", "password": "password"});
          if (response.statusCode == 200) {
            ApiConstance.token = response.data["token"];
            await baseParticipantLocalFile(response.data["token"]);
            return true;
          } else {
            return false;
          }
        } on DioError catch (_) {
          return false;
        }
      } else {
        return false;
      }
  }
}
