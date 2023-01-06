import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Process_Class/ChangeThemeState.dart';
import 'Profile/bloc/ChangeThemeBloc.dart';
import 'Read/bloc/Bloc_Controler_Read.dart';
import 'SplashScreen/UI/Splash_Screen.dart';
import 'SplashScreen/bloc/blocSplashScreen.dart';

void main() {
  runApp(const MyApp());
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
        ],
        child:BlocBuilder(
        bloc: changeThemeBloc,
    builder: (BuildContext context, ChangeThemeState state) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: state.themeData,
          // ignore: prefer_const_constructors
          home: Splash_Screen(),
        );}));
  }
}
