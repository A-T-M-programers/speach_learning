import 'package:flutter/material.dart';

final ThemeData kLightTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData(
    scaffoldBackgroundColor: const Color(0xffeeece4),
    appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(255,136, 133, 121),iconTheme: IconThemeData(color: Colors.white)),
    textTheme: TextTheme(headline1: TextStyle(color: Colors.white),headline2: TextStyle(color: Colors.black54),headline3: TextStyle(color: Colors.black26),headline4: TextStyle(color: const Color(0xff673a3a))),
    cardColor: Color.fromARGB(255,136, 133, 121),
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
    textTheme: TextTheme(headline1: TextStyle(color: Colors.white70),headline2: TextStyle(color: Colors.white70),headline3: TextStyle(color: Colors.white38),headline4: TextStyle(color: Colors.white)),
    cardColor: Color.fromARGB(255,57, 57, 57),
    shadowColor: Colors.black12

  );
  return base.copyWith(
      // Add any other property here
      );
}
