import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:speach_learning/Data/DataSource/participant_locale_file.dart';
import 'package:speach_learning/Data/DataSource/participant_remote_datasourc.dart';
import 'package:speach_learning/Data/DataSource/participants_domain_remote_datasource.dart';
import 'package:speach_learning/Data/DataSource/sections_remote_datasourse.dart';
import 'package:speach_learning/Data/Repository/participant_domain_repository.dart';
import 'package:speach_learning/Data/Repository/participant_repository.dart';
import 'package:speach_learning/Data/Repository/section_repository.dart';
import 'package:speach_learning/Domain/Entity/Dialects.dart';
import 'package:speach_learning/Domain/Entity/Lang.dart';
import 'package:speach_learning/Domain/Repository/repository_domain_participant_domain.dart';
import 'package:speach_learning/Domain/Repository/repository_domain_section.dart';
import 'package:speach_learning/Domain/Repository/repository_participant.dart';
import 'package:speach_learning/Domain/UseCase/get_all_sections_usecase.dart';
import 'package:speach_learning/Domain/UseCase/get_participant_domain.dart';
import 'package:speach_learning/Domain/UseCase/participant_usecase.dart';
import 'package:speach_learning/Presentation/Home/controler/home_bloc.dart';
import 'package:speach_learning/Presentation/LogIn/controler/log_in_bloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileBloc.dart';
import 'package:speach_learning/core/utils/enums.dart';
import 'package:speach_learning/core/utils/google_auth.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init(){
    /// Bloc
    sl.registerFactory(() => HomeBloc(sl(),sl(),sl()));
    sl.registerFactory(() => ProfileParticipantBloc(sl()));
    sl.registerFactory(() => LogInBloc(sl()));

    /// Use Case
    sl.registerLazySingleton(() => GetAllSectionsUseCase(sl()));
    sl.registerLazySingleton(() => GetParticipantDomainUseCase(sl()));
    sl.registerLazySingleton(() => ParticipantUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseSectionsRepository>(() => SectionsRepository(sl()));
    sl.registerLazySingleton<BaseParticipantDomainRepository>(() => ParticipantDomainRepository(sl()));
    sl.registerLazySingleton<BaseParticipantRepository>(() => ParticipantRepository(sl(),sl()));

    /// Data Source
    sl.registerLazySingleton<BaseSectionsRemoteDataSource>(() => SectionsRemoteDataSource());
    sl.registerLazySingleton<BaseParticipantDomainDataSource>(() => ParticipantDomainRemoteDataSource());
    sl.registerLazySingleton<BaseParticipantRemoteDataSource>(() => ParticipantRemoteDataSource(sl()));

    /// Local File
    sl.registerLazySingleton<BaseParticipantLocalFile>(() => ParticipantLocaleFile());
  }
  void initParticipants(){
    /// init google gmail
    sl.registerFactory(() => GoogleSignIn());

    /// init GoogleAuth
    sl.registerFactory(() => GoogleAuth(sl()));
  }
}