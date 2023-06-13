import 'package:flutter/material.dart';

final ThemeData kLightTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData(
    inputDecorationTheme:const InputDecorationTheme(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white54))),
    toggleButtonsTheme:const ToggleButtonsThemeData(color: Colors.black54,fillColor: Colors.black54),
    scaffoldBackgroundColor: const Color(0xffeeece4),
    appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(255, 161, 161, 161),iconTheme: IconThemeData(color: Colors.white)),
    textTheme: const TextTheme(headlineLarge: TextStyle(color: Colors.black26),headlineMedium: TextStyle(color: Colors.white),headlineSmall: TextStyle(color: Colors.black54),displaySmall: TextStyle(color: Colors.black),displayMedium: TextStyle(color: Colors.white),displayLarge: TextStyle(color: Color(0xff673a3a))/*,headline4: TextStyle(color: Color(0xff673a3a)),headline5: TextStyle(color: Colors.black),headline6: TextStyle(color: Colors.white)*/),
    cardColor: const Color.fromARGB(190, 224, 224, 224),
    shadowColor: Colors.white54,
  );
  return base.copyWith(
      // Add any other property here
      );
}

final ThemeData kDarkTheme = _buildDarkTheme();

ThemeData _buildDarkTheme() {
  final ThemeData base = ThemeData(
      inputDecorationTheme:const InputDecorationTheme(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black54))),
      toggleButtonsTheme:const ToggleButtonsThemeData(color: Colors.white70,fillColor: Colors.white70),
      scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(255, 35, 35, 35),iconTheme: IconThemeData(color: Colors.white70)),
    textTheme: const TextTheme(headlineLarge: TextStyle(color: Colors.white38),headlineMedium: TextStyle(color: Colors.white70),headlineSmall: TextStyle(color: Colors.white70),displaySmall: TextStyle(color: Colors.black),displayMedium: TextStyle(color: Colors.black),displayLarge: TextStyle(color: Colors.white)/*,headline4: TextStyle(color: Colors.white),headline5: TextStyle(color: Colors.black),headline6: TextStyle(color: Colors.black)*/),
    cardColor: const Color.fromARGB(255, 87, 87, 87),
    shadowColor: Colors.black12

  );
  return base.copyWith(
      // Add any other property here
      );
}
