import 'package:flutter/material.dart';
import 'package:speach_learning/ThemeApp.dart';

class ChangeThemeState {
  final ThemeData themeData;
  static late bool isDark;

  ChangeThemeState({required this.themeData});

  factory ChangeThemeState.lightTheme() {
    isDark = false;
    return ChangeThemeState(themeData: kLightTheme);
  }

  factory ChangeThemeState.darkTheme() {
    isDark = true;
    return ChangeThemeState(themeData: kDarkTheme);
  }
}