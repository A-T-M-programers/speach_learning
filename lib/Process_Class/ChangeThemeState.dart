import 'package:flutter/material.dart';
import 'package:speach_learning/ThemeApp.dart';

class ChangeThemeState {
  final ThemeData themeData;

  ChangeThemeState({required this.themeData});

  factory ChangeThemeState.lightTheme() {
    return ChangeThemeState(themeData: kLightTheme);
  }

  factory ChangeThemeState.darkTheme() {
    return ChangeThemeState(themeData: kDarkTheme);
  }
}