import 'package:flutter/material.dart';

final ThemeData kLightTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData(
    scaffoldBackgroundColor: const Color(0xffeeece4),
    appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(255,136, 133, 121),iconTheme: IconThemeData(color: Colors.white)),
    textTheme: const TextTheme(headline1: TextStyle(color: Colors.white),headline2: TextStyle(color: Colors.black54),headline3: TextStyle(color: Colors.black26),headline4: TextStyle(color: Color(0xff673a3a)),headline5: TextStyle(color: Colors.black),headline6: TextStyle(color: Colors.white)),
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
    scaffoldBackgroundColor: Colors.grey,
    appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(255,57, 57, 57),iconTheme: IconThemeData(color: Colors.white70)),
    textTheme: const TextTheme(headline1: TextStyle(color: Colors.white70),headline2: TextStyle(color: Colors.white70),headline3: TextStyle(color: Colors.white38),headline4: TextStyle(color: Colors.white),headline5: TextStyle(color: Colors.black),headline6: TextStyle(color: Colors.black)),
    cardColor: const Color.fromARGB(255, 87, 87, 87),
    shadowColor: Colors.black12

  );
  return base.copyWith(
      // Add any other property here
      );
}
