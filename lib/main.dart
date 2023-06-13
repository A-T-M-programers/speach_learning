import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/Presentation/PhraseUI/controler/phrase_bloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileBloc.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileEvent.dart';
import 'package:speach_learning/Presentation/Read/controler/read_bloc.dart';
import 'package:speach_learning/Presentation/Read/controler/voice_bloc.dart';
import 'package:speach_learning/Presentation/Route/UI/route.dart';
import 'package:speach_learning/Presentation/Route/controler/route_page_bloc.dart';
import 'package:speach_learning/Presentation/SplashScreen/controler/blocSplashScreen.dart';
import 'package:speach_learning/core/global/themeApp/ThemeApp.dart';
import 'package:speach_learning/core/services/services_locator.dart';
import 'Presentation/Home/controler/home_bloc.dart';
import 'Presentation/LoadingPage/Ui/loading_page.dart';
import 'Presentation/LogIn/controler/log_in_bloc.dart';
import 'Presentation/PhraseUI/bloc/BlocShowCheckBox.dart';
import 'Presentation/Profile/controler/ProfileState.dart';
import 'Presentation/SplashScreen/UI/Splash_Screen.dart';
import 'core/error/ui_error.dart';
import 'core/utils/enums.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator servicesLocator = ServicesLocator();
  servicesLocator.init();
  servicesLocator.initParticipants();
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
          BlocProvider<BlocShowCheckBox>(
            create: (BuildContext context) => BlocShowCheckBox(),
          ),
          BlocProvider(create: (BuildContext context) {
            return sl<LogInBloc>()..add(const CheckIsSuccessLogInEvent())..add(const GetTokenEvent("voca@test.com", "password"))..add(GetParticipantIdEvent());
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
            return sl<RoutePageBloc>()..add(const TransitionRoutePageEvent(BottomSheetOption.home));
          }),
          BlocProvider(create: (BuildContext context) {
            return sl<ReadBloc>();
          }),
          BlocProvider(create: (BuildContext context) {
            return sl<VoiceBloc>();
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
        buildWhen: (previos, current) => previos != current,
    builder: (context, state) {
      switch (state.requestState) {
        case RequestState.loading:
          return const LoadingPage();
        case RequestState.loaded:
          if (state.participantsId != 0 && state.token.isNotEmpty && state.isCheckSuccessLogIn == "Ok") {
            context.read<RoutePageBloc>().add(GetParticipantEvent(id: state.participantsId, key: "Route"));
            return RoutePage(idParticipant: state.participantsId,);
          } else if(!state.token.isNotEmpty && state.participantsId != 0 && state.isCheckSuccessLogIn == "Ok"){
            return const LoadingPage();
          }else if(state.isCheckSuccessLogIn == ""){
            return const LoadingPage();
          } else if(state.isCheckSuccessLogIn != "Ok" && state.isCheckSuccessLogIn != ""){
            return UiError(
                message: state.isCheckSuccessLogIn,
                retry: (){
                  context.read<LogInBloc>().add(const CheckIsSuccessLogInEvent());
                },
                close: () {
                  if(Platform.isAndroid) {
                    SystemNavigator.pop();
                  }else if(Platform.isIOS){
                    exit(0);
                  }
                });
          }else{
            return Splash_Screen();
          }
        case RequestState.error:
          return UiError(
            message: "err_network",
            retry: (){
              context.read<LogInBloc>().add(const GetTokenEvent("voca@test.com", "password"));
              context.read<LogInBloc>().add(GetParticipantIdEvent());
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
