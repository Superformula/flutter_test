import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    colorSchemeSeed: Colors.black,
    fontFamily: 'OpenSans',
    cardTheme: const CardTheme(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Lora',
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12.0,
        color: Colors.black,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 1,
      titleTextStyle: TextStyle(
        fontFamily: 'Lora',
        fontWeight: FontWeight.w700,
        fontSize: 18.0,
        color: Colors.black,
      ),
    ),
    indicatorColor: Colors.black,
    tabBarTheme: const TabBarTheme(
      tabAlignment: TabAlignment.center,
      indicatorColor: Colors.black,
      labelStyle: TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
      ),
      dividerColor: Colors.transparent,
      labelColor: Colors.black,
      unselectedLabelColor: Color(0xFF606060),
      unselectedLabelStyle: TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
      ),
    ),
  );
}
