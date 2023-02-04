import 'package:flutter/material.dart';
import 'package:my_calendar/constant/colors.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    backgroundColor: kBackgroundColor,
    scaffoldBackgroundColor: kBackgroundColor,
    appBarTheme: const AppBarTheme(backgroundColor: kBackgroundColor),
    primaryColor: kPrimaryColor,
    brightness: Brightness.dark,
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            textStyle: const TextStyle(color: Colors.white),
            primary: Colors.white)),
  );
}
