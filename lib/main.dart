import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/PhraseUI/controler/phrase_bloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileBloc.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/Presentation/Route/UI/route.dart';
import 'package:speach_learning/Presentation/Route/controler/route_page_bloc.dart';
import 'package:speach_learning/Presentation/SplashScreen/controler/blocSplashScreen.dart';
import 'package:speach_learning/core/global/themeApp/ThemeApp.dart';
import 'package:speach_learning/core/services/services_locator.dart';
import 'Presentation/Home/controler/home_bloc.dart';
import 'Presentation/Home/controler/home_event.dart';
import 'Presentation/LoadingPage/Ui/loading_page.dart';
import 'Presentation/LogIn/controler/log_in_bloc.dart';
import 'Presentation/PhraseUI/bloc/BlocShowCheckBox.dart';
import 'Presentation/Profile/controler/ProfileState.dart';
import 'Presentation/Read/bloc/Bloc_Controler_Read.dart';
import 'Presentation/SplashScreen/UI/Splash_Screen.dart';
import 'core/error/ui_error.dart';
import 'core/utils/enums.dart';

void main() async {
  ServicesLocator servicesLocator = ServicesLocator();
  servicesLocator.init();
  servicesLocator.initParticipants();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        // ignore: prefer_const_literals_to_create_immutables, prefer_const_constructors
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        // <-- change the path of the translation files
        // ignore: prefer_const_constructors
        fallbackLocale: Locale('en'),
        // ignore: prefer_const_constructors
        child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<blocSplashScreen>(
            create: (BuildContext context) => blocSplashScreen(),
          ),
          BlocProvider<Bloc_Controler>(
            create: (BuildContext context) => Bloc_Controler(),
          ),
          BlocProvider<Bloc_increment>(
            create: (BuildContext context) => Bloc_increment(),
          ),
          BlocProvider<Bloc_chang_color_Word>(
            create: (BuildContext context) => Bloc_chang_color_Word(),
          ),
          BlocProvider<Bloc_chang_display_circuler>(
            create: (BuildContext context) => Bloc_chang_display_circuler(),
          ),
          BlocProvider<Bloc_change_Language>(
            create: (BuildContext context) => Bloc_change_Language(),
          ),
          BlocProvider<Bloc_changeStateBottomSheet>(
            create: (BuildContext context) => Bloc_changeStateBottomSheet(),
          ),
          BlocProvider<Bloc_CheckLevel>(
            create: (BuildContext context) => Bloc_CheckLevel(),
          ),
          BlocProvider<BlocShowCheckBox>(
            create: (BuildContext context) => BlocShowCheckBox(),
          ),
          BlocProvider<BlocUpdateShowListPhrase>(
            create: (BuildContext context) => BlocUpdateShowListPhrase([]),
          ),
          BlocProvider<BlocPhraseManage>(
              create: (BuildContext context) => BlocPhraseManage()),
          BlocProvider(create: (BuildContext context) {
            return sl<LogInBloc>()..add(GetParticipantIdEvent());
          }),
          BlocProvider(create: (BuildContext context) {
            return sl<ProfileBloc>();
          }),
          BlocProvider(create: (BuildContext context) {
            return sl<HomeBloc>();
          }),
          BlocProvider(create: (BuildContext context) {
            return sl<PhraseBloc>();
          }),
          BlocProvider(create: (BuildContext context) {
            return sl<RoutePageBloc>();
          }),
          BlocProvider(create: (BuildContext context) {
            return sl<ReadBloc>();
          })
        ],
        child: BlocBuilder<ProfileBloc, ParticipantState>(
          buildWhen: (previos,current) => previos.requestState != current.requestState,
          builder: (context, state) {
            return MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                theme: state.themeData ?? kLightTheme,
                // ignore: prefer_const_constructors
                home: const CheckAnyPage());
          },
        ));
  }
}

class CheckAnyPage extends StatelessWidget {
  const CheckAnyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogInBloc, LogInState>(
        buildWhen: (previos, current) => previos.requestState != current.requestState,
    builder: (context, state) {
      switch (state.requestState) {
        case RequestState.loading:
          return const LoadingPage();
        case RequestState.loaded:
          if (state.participantsId != 0) {
            context.read<RoutePageBloc>().add( const TransitionRoutePageEvent(BottomSheetOption.home));
            return RoutePage(idParticipant: state.participantsId,);
          } else {
            return Splash_Screen();
          }
        case RequestState.error:
          return UiError(
            message: "err_Network",
            retry: (){
              context.read<LogInBloc>().add(GetParticipantIdEvent());
              context.read<HomeBloc>().add(GetAllSectionsEvent(idParticipant: state.participantsId));
              context.read<HomeBloc>().add(GetParticipantDomainEvent(id: state.participantsId));
            },
            close: () {
              if(Platform.isAndroid) {
                SystemNavigator.pop();
              }else if(Platform.isIOS){
                exit(0);
              }
            });
      }
    });
  }
}
