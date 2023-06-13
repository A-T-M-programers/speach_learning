import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:speach_learning/Data/DataSource/dialect_remote_dataSource.dart';
import 'package:speach_learning/Data/DataSource/level_remote_dataSource.dart';
import 'package:speach_learning/Data/DataSource/participant_locale_file.dart';
import 'package:speach_learning/Data/DataSource/participant_remote_datasourc.dart';
import 'package:speach_learning/Data/DataSource/participants_domain_remote_datasource.dart';
import 'package:speach_learning/Data/DataSource/phrase_remote_dataSource.dart';
import 'package:speach_learning/Data/DataSource/sections_remote_datasourse.dart';
import 'package:speach_learning/Data/DataSource/system_remote_dataSource.dart';
import 'package:speach_learning/Data/DataSource/word_remote_dataSource.dart';
import 'package:speach_learning/Data/Model/dialect_model.dart';
import 'package:speach_learning/Data/Model/domains_model.dart';
import 'package:speach_learning/Data/Model/level_model.dart';
import 'package:speach_learning/Data/Model/participant_model.dart';
import 'package:speach_learning/Data/Model/phrase_model.dart';
import 'package:speach_learning/Data/Repository/dialect_repository.dart';
import 'package:speach_learning/Data/Repository/level_repository.dart';
import 'package:speach_learning/Data/Repository/participant_domain_repository.dart';
import 'package:speach_learning/Data/Repository/participant_repository.dart';
import 'package:speach_learning/Data/Repository/phrase_repository.dart';
import 'package:speach_learning/Data/Repository/section_repository.dart';
import 'package:speach_learning/Data/Repository/system_repository.dart';
import 'package:speach_learning/Data/Repository/word_repository.dart';
import 'package:speach_learning/Domain/Entity/Dialects.dart';
import 'package:speach_learning/Domain/Entity/Domains.dart';
import 'package:speach_learning/Domain/Entity/Level.dart';
import 'package:speach_learning/Domain/Entity/Participants.dart';
import 'package:speach_learning/Domain/Entity/PhraseItem.dart';
import 'package:speach_learning/Domain/Repository/repository_Phrase.dart';
import 'package:speach_learning/Domain/Repository/repository_dialects.dart';
import 'package:speach_learning/Domain/Repository/repository_domain_participant_domain.dart';
import 'package:speach_learning/Domain/Repository/repository_domain_section.dart';
import 'package:speach_learning/Domain/Repository/repository_level.dart';
import 'package:speach_learning/Domain/Repository/repository_participant.dart';
import 'package:speach_learning/Domain/Repository/repository_system.dart';
import 'package:speach_learning/Domain/Repository/repository_word.dart';
import 'package:speach_learning/Domain/UseCase/dialects_useCase.dart';
import 'package:speach_learning/Domain/UseCase/domain_useCase.dart';
import 'package:speach_learning/Domain/UseCase/get_all_sections_usecase.dart';
import 'package:speach_learning/Domain/UseCase/get_participant_domain.dart';
import 'package:speach_learning/Domain/UseCase/level_useCase.dart';
import 'package:speach_learning/Domain/UseCase/participant_usecase.dart';
import 'package:speach_learning/Domain/UseCase/phrase_useCase.dart';
import 'package:speach_learning/Domain/UseCase/system_useCase.dart';
import 'package:speach_learning/Domain/UseCase/word_useCase.dart';
import 'package:speach_learning/Presentation/Home/controler/home_bloc.dart';
import 'package:speach_learning/Presentation/Home/controler/home_event.dart';
import 'package:speach_learning/Presentation/LogIn/controler/log_in_bloc.dart';
import 'package:speach_learning/Presentation/PhraseUI/controler/phrase_bloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileBloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileEvent.dart';
import 'package:speach_learning/Presentation/Read/controle/Text_To_Speech.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/Presentation/Read/controler/voice_bloc.dart';
import 'package:speach_learning/Presentation/Route/controler/route_page_bloc.dart';
import 'package:speach_learning/core/global/static/get_error_details.dart';
import 'package:speach_learning/core/usecases/base_useCase.dart';
import 'package:speach_learning/core/utils/enums.dart';
import 'package:speach_learning/core/utils/google_auth.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init(){

    /// Bloc
    sl.registerFactory(() => HomeBloc(sl(),sl(),sl(),sl(),sl()));
    sl.registerLazySingleton(() => ProfileBloc(sl(),sl(),sl(),sl(),sl()));
    sl.registerLazySingleton(() => PhraseBloc(sl(),sl(),sl()));
    sl.registerFactory(() => LogInBloc(sl(),sl(),sl(),sl()));
    sl.registerFactory(() => ReadBloc(sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl()));
    sl.registerFactory(() => RoutePageBloc(sl()));
    sl.registerFactory(() => VoiceBloc());

    /// Use Case
    /// Domain
    sl.registerLazySingleton<BaseUseCase<List<Domains>,GetAllSectionsEvent>>(() => GetAllSectionsUseCase(sl()));
    sl.registerLazySingleton<BaseUseCase<bool,SetDomainStateEvent>>(() => SetDomainStateUseCase(sl()));
    /// Participant
    sl.registerLazySingleton(() => GetParticipantDomainUseCase(sl()));
    sl.registerLazySingleton<BaseUseCase<ThemeApp,SetThemeAppParticipantEvent>>(() => SetThemeAppParticipantUseCase(sl()));
    sl.registerLazySingleton<BaseUseCase<int,SetLangParticipantEvent>>(() => SetLangParticipantUseCase(sl()));
    sl.registerLazySingleton<BaseUseCase<String,SetPhotoParticipantEvent>>(() => SetPhotoParticipantUseCase(sl()));
    sl.registerLazySingleton<BaseUseCase<int,SetParticipantDialectEvent>>(() => SetParticipantDialectUseCase(sl()));
    sl.registerLazySingleton<BaseUseCase<int,SetParticipantEvent>>(() => SetParticipantUseCase(sl()));
    sl.registerLazySingleton<BaseUseCase<Participants,GetParticipantEvent>>(() => GetParticipantWithIdUseCase(sl()));
    sl.registerLazySingleton<BaseUseCase<int,GetParticipantWithEmailEvent>>(() => GetParticipantWithEmailUseCase(sl()));
    sl.registerLazySingleton<BaseUseCase<int,GetParticipantIdEvent>>(() => GetParticipantIdUseCase(sl()));
    /// Level
    sl.registerLazySingleton<BaseUseCase<Level,GetLevelEvent>>(() => GetLevelTreeUseCase(sl()));
    sl.registerLazySingleton<BaseUseCase<bool,SetLevelStateEvent>>(() => SetStateLevelUseCase(sl()));
    /// Phrase
    sl.registerLazySingleton<BaseUseCase<bool,SetPhraseStateEvent>>(() => SetStatePhraseUseCase(sl()));
    sl.registerLazySingleton<BaseUseCase<int,SetListWordAndPhraseStateEvent>>(() => SetListWordAndPhraseStateUseCase(sl()));
    sl.registerLazySingleton<BaseUseCase<PhraseItem,GetPhraseEvent>>(() => GetPhraseUseCase(sl()));
    /// Word
    sl.registerLazySingleton<BaseUseCase<bool,SetWordStateEvent>>(() => SetStateWordUseCase(sl()));
    /// Dialects
    sl.registerLazySingleton<BaseUseCase<List<Dialects>,GetAllDialectEvent>>(() => GetAllDialectsUseCase(sl()));
    /// System
    sl.registerLazySingleton<BaseUseCase<String,GetTokenEvent>>(() => GetTokenUseCase(sl()));
    sl.registerLazySingleton<BaseUseCase<String,CheckIsSuccessLogInEvent>>(() => GetPermittingUseCase(sl()));

    /// Repository
    /// Domain
    sl.registerLazySingleton<BaseSectionsRepository<List<Domains>,GetAllSectionsEvent>>(() => SectionsRepository(sl()));
    sl.registerLazySingleton<BaseSectionsRepository<bool,SetDomainStateEvent>>(() => SetDomainStateRepository(sl()));
    /// Participant
    sl.registerLazySingleton<BaseParticipantDomainRepository>(() => ParticipantDomainRepository(sl()));
    sl.registerLazySingleton<BaseParticipantRepository<ThemeApp,SetThemeAppParticipantEvent>>(() => SetThemeAppParticipantRepository(sl()));
    sl.registerLazySingleton<BaseParticipantRepository<int,SetLangParticipantEvent>>(() => SetLangParticipantRepository(sl()));
    sl.registerLazySingleton<BaseParticipantRepository<String,SetPhotoParticipantEvent>>(() => SetPhotoParticipantRepository(sl()));
    sl.registerLazySingleton<BaseParticipantRepository<int,SetParticipantDialectEvent>>(() => SetParticipantDialectRepository(sl()));
    sl.registerLazySingleton<BaseParticipantRepository<int,SetParticipantEvent>>(() => SetParticipantRepository(sl()));
    sl.registerLazySingleton<BaseParticipantRepository<Participants,GetParticipantEvent>>(() => GetParticipantWithIdRepository(sl()));
    sl.registerLazySingleton<BaseParticipantRepository<int,GetParticipantWithEmailEvent>>(() => GetParticipantWithEmailRepository(sl()));
    sl.registerLazySingleton<BaseParticipantRepository<int,GetParticipantIdEvent>>(() => GetParticipantIdRepository(sl()));
    /// Level
    sl.registerLazySingleton<BaseLevelRepository<Level,GetLevelEvent>>(() => LevelRepository(sl()));
    sl.registerLazySingleton<BaseLevelRepository<bool,SetLevelStateEvent>>(() => SetLevelStateRepository(sl()));
    /// Phrase
    sl.registerLazySingleton<BasePhraseRepository<bool,SetPhraseStateEvent>>(() => SetPhraseStateRepository(sl()));
    sl.registerLazySingleton<BasePhraseRepository<int,SetListWordAndPhraseStateEvent>>(() => SetListWordAndPhraseStateRepository(sl()));
    sl.registerLazySingleton<BasePhraseRepository<PhraseItem,GetPhraseEvent>>(() => GetPhraseRepository(sl()));
    /// Word
    sl.registerLazySingleton<BaseWordRepository<bool,SetWordStateEvent>>(() => SetWordStateRepository(sl()));
    /// Dialects
    sl.registerLazySingleton<BaseDialectsRepository<List<Dialects>,GetAllDialectEvent>>(() => DialectRepository(sl()));
    /// System
    sl.registerLazySingleton<BaseSystemRepository<String,GetTokenEvent>>(() => GetTokenRepository(sl()));
    sl.registerLazySingleton<BaseSystemRepository<String,CheckIsSuccessLogInEvent>>(() => GetPermittingRepository(sl()));

    /// Data Source
    /// Domain
    sl.registerLazySingleton<BaseSectionsRemoteDataSource<List<DomainsModel>,GetAllSectionsEvent>>(() => SectionsRemoteDataSource());
    sl.registerLazySingleton<BaseSectionsRemoteDataSource<bool,SetDomainStateEvent>>(() => SetDomainStateRemoteDataSource());
    ///Participant
    sl.registerLazySingleton<BaseParticipantDomainDataSource>(() => ParticipantDomainRemoteDataSource());
    sl.registerLazySingleton<BaseParticipantRemoteDataSource<ThemeApp,SetThemeAppParticipantEvent>>(() => SetThemeParticipantRemoteDataSource());
    sl.registerLazySingleton<BaseParticipantRemoteDataSource<int,SetLangParticipantEvent>>(() => SetLangParticipantRemoteDataSource());
    sl.registerLazySingleton<BaseParticipantRemoteDataSource<String,SetPhotoParticipantEvent>>(() => SetPhotoParticipantRemoteDataSource());
    sl.registerLazySingleton<BaseParticipantRemoteDataSource<int,SetParticipantDialectEvent>>(() => SetParticipantDialectRemoteDataSource());
    sl.registerLazySingleton<BaseParticipantRemoteDataSource<int,SetParticipantEvent>>(() => SetParticipantRemoteDataSource(sl()));
    sl.registerLazySingleton<BaseParticipantRemoteDataSource<ParticipantModel,GetParticipantEvent>>(() => GetParticipantWithIdRemoteDataSource());
    sl.registerLazySingleton<BaseParticipantRemoteDataSource<int,GetParticipantWithEmailEvent>>(() => GetIdParticipantWithEmailRemoteDataSource());
    /// Level
    sl.registerLazySingleton<BaseLevelRemoteDataSource<LevelModel,GetLevelEvent>>(() => GetLevelRemoteDataSource());
    sl.registerLazySingleton<BaseLevelRemoteDataSource<bool,SetLevelStateEvent>>(() => SetLevelStateRemoteDataSource());
    /// Phrase
    sl.registerLazySingleton<BasePhraseRemoteDataSource<bool,SetPhraseStateEvent>>(() => SetPhraseStateRemoteDataSource());
    sl.registerLazySingleton<BasePhraseRemoteDataSource<int,SetListWordAndPhraseStateEvent>>(() => SetListWordAndPhraseStateRemoteDataSource());
    sl.registerLazySingleton<BasePhraseRemoteDataSource<PhraseModel,GetPhraseEvent>>(() => GetPhraseRemoteDataSource());
    /// Word
    sl.registerLazySingleton<BaseWordRemoteDataSource<bool,SetWordStateEvent>>(() => SetWordStateRemoteDataSource());
    /// Dialect
    sl.registerLazySingleton<BaseDialectRemoteDataSource<List<DialectModel>,GetAllDialectEvent>>(() => GetAllDialectsRemoteDataSource());
    ///System
    sl.registerLazySingleton<BaseSystemRemoteDataSource<String,GetTokenEvent>>(() => GetTokenRemoteDataSource(sl()));
    sl.registerLazySingleton<BaseSystemRemoteDataSource<String,CheckIsSuccessLogInEvent>>(() => GetPermittingRemoteDataSource());

    /// Local File
    /// Participant
    sl.registerLazySingleton<BaseParticipantLocalFile<void,int>>(() => SetParticipantIdLocaleFile());
    sl.registerLazySingleton<BaseParticipantLocalFile<void,String>>(() => SetParticipantTokenLocaleFile());
    sl.registerLazySingleton<BaseParticipantLocalFile<int,GetParticipantIdEvent>>(() => GetParticipantIdLocaleFile());
    sl.registerLazySingleton(() => GetParticipantTokenLocaleFile());
  }

  void initParticipants() async {
    /// init google gmail
    sl.registerFactory(() => GoogleSignIn());

    /// init GoogleAuth
    sl.registerFactory(() => GoogleAuth(sl()));
    sl<GoogleAuth>().init();

    /// init Error Details Class
    sl.registerFactory(() => GetErrorDetails());


    /// register Flutter TTS
    TextToSpeech textToSpeech = TextToSpeech();
    textToSpeech.initTts();
    sl.registerFactory(() => textToSpeech);
  }
}