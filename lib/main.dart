import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speach_learning/PhraseUI/bloc/BlocShowCheckBox.dart';
import 'package:speach_learning/Presentation/Home/Bloc/BlocHome.dart';
import 'package:speach_learning/Presentation/Home/UI/home_page.dart';
import 'package:speach_learning/Presentation/Profile/controler/ProfileBloc.dart';
import 'package:speach_learning/Presentation/SplashScreen/controler/blocSplashScreen.dart';
import 'package:speach_learning/core/global/themeApp/ThemeApp.dart';
import 'package:speach_learning/core/services/services_locator.dart';
import 'Presentation/Home/controler/home_bloc.dart';
import 'Presentation/Home/controler/home_event.dart';
import 'Presentation/LogIn/controler/log_in_bloc.dart';
import 'Presentation/Profile/controler/ProfileState.dart';
import 'Presentation/SplashScreen/UI/Splash_Screen.dart';
import 'Read/bloc/Bloc_Controler_Read.dart';
import 'core/utils/enums.dart';

void main() async {
  ServicesLocator().init();
  ServicesLocator().initParticipants();
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
        child: MyApp()),
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
          BlocProvider<Bloc_Change_Lan>(
            create: (BuildContext context) => Bloc_Change_Lan(),
          ),
          BlocProvider<BlocSelectLevel>(
            create: (BuildContext context) => BlocSelectLevel(),
          ),
          BlocProvider<BlocPhraseManage>(
              create: (BuildContext context) => BlocPhraseManage()),
          BlocProvider(create: (BuildContext context) {
            return sl<LogInBloc>()..add(GetParticipantIdEvent());
          }),
          BlocProvider(create: (BuildContext context) {
            return sl<ProfileParticipantBloc>();
          }),
          BlocProvider(create: (BuildContext context) {
            return sl<HomeBloc>()..add(GetAllSectionsEvent());
          })
        ],
        child: BlocBuilder<ProfileParticipantBloc, ParticipantState>(
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
    return BlocBuilder<LogInBloc, LogInState>(buildWhen: (previos, current) {
      if (previos != current) {
        if (previos.requestState == current.requestState) {
          return false;
        } else {
          return true;
        }
      } else {
        return false;
      }
    }, builder: (context, state) {
      switch (state.requestState) {
        case RequestState.loading:
          return Container(
              alignment: Alignment.center,
              height: 50,
              width: 50,
              child: const CircularProgressIndicator(
                color: Colors.white54,
              ));
        case RequestState.loaded:
          if (state.participantsId != 0) {
            context.read<HomeBloc>().add(GetParticipantDomainEvent(id: state.participantsId));
            return home_page(idParticipant: state.participantsId,);
          } else {
            return Splash_Screen();
          }
        case RequestState.error:
          return Center(
              child: Text(
            state.message,
            style:
                TextStyle(color: Theme.of(context).textTheme.headline2!.color),
          ));
      }
    });
  }
}
