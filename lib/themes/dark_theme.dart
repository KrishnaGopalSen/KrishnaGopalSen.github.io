import 'package:flutter/material.dart';

class DarkTheme {

  static ThemeData theme = ThemeData(

    brightness: Brightness.dark,

    primaryColor: Colors.green,

    scaffoldBackgroundColor:
    const Color(0xff121212),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),

    elevatedButtonTheme:
    ElevatedButtonThemeData(

      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

    ),

    inputDecorationTheme:
    InputDecorationTheme(

      border: OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(12),
      ),

    ),

  );
}