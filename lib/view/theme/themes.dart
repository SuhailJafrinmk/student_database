import 'package:flutter/material.dart';
import 'package:student_database/view/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorsApp.tertiaryColor,
      ),
      scaffoldBackgroundColor: ColorsApp.primaryColor,
      appBarTheme: const AppBarTheme(
        elevation: 20,
        backgroundColor: ColorsApp.tertiaryColor,
        toolbarHeight: 70,
        titleTextStyle: TextStyle(
          color: ColorsApp.textColor,
        ),
      ),
      cardTheme: const CardTheme(
        color: ColorsApp.secondaryColor,
      ));
}
