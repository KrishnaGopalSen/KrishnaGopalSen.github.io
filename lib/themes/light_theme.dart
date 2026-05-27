import 'package:flutter/material.dart';

class LightTheme {

  static ThemeData theme = ThemeData(

    brightness: Brightness.light,

    primaryColor: Colors.blue,

    scaffoldBackgroundColor: Colors.white,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),

    elevatedButtonTheme:
    ElevatedButtonThemeData(

      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
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