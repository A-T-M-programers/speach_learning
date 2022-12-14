import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Process_Class/ChangeThemeState.dart';
import 'Profile/bloc/ChangeThemeBloc.dart';
import 'Read/bloc/Bloc_Controler_Read.dart';
import 'SplashScreen/UI/Splash_Screen.dart';
import 'SplashScreen/bloc/blocSplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      // ignore: prefer_const_literals_to_create_immutables, prefer_const_constructors
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations', // <-- change the path of the translation files
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
        ],
        child:BlocBuilder(
        bloc: changeThemeBloc,
    builder: (BuildContext context, ChangeThemeState state) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: state.themeData,
          // ignore: prefer_const_constructors
          home: Splash_Screen(),
        );}));
  }
}
