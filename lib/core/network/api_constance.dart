class ApiConstance{
  static const String baseUrlApi = "http://voca.najeeb-edu.sy/api";
  static const String baseUrlPermitting = "https://sales-mangment.000webhostapp.com";
  static const String baseUrlStorage = "http://voca.najeeb-edu.sy/storage";
  static const String apiParticipantKey = "$baseUrlApi/participants";
  static const String apiParticipantEmailKey = "$baseUrlApi/participant-email";
  static const String apiLogInKey = "$baseUrlApi/auth";
  static const String apiLevelKey = "$apiParticipantKey/LevelStatus";
  static const String apiAllDialectsKey = "$baseUrlApi/dialects";


  static const String getParticipantWithEmail = "$apiParticipantEmailKey?email";
  static const String getDomainAllByParticipant = "$apiParticipantKey/DomainsStatus";
  static const String getTokenByLogIn = "$apiLogInKey/login";
  static const String urlParticipantStorageImage = "$baseUrlStorage/participant-images";
  static const String setLevelState = "$apiParticipantKey/attachLevel";
  static const String setDomainState = "$apiParticipantKey/attachDomain";
  static const String setPhraseState = "$apiParticipantKey/attachPhrase";
  static const String setWordState = "$apiParticipantKey/attachWord";
  static const String getPhrase = "$apiParticipantKey/phraseStatus";
  static const String setListWordAndPhraseState = "$apiParticipantKey/handlePhraseTree";
  static const String getPermitting = "$baseUrlPermitting/Speech_Learning";
  // static const String allSectionsPath = "$baseUrl/ ?api_key=$apiKey";
  // static const String participantsDomainPath = "$baseUrl/ ?api_key=$apiKey";
  // static const String participantPath = "$baseUrl/ ?api_key=$apiKey";

}