import 'package:flutter/material.dart';
import 'typography.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.loraRegularHeadline,
        titleLarge: AppTextStyles.openRegularHeadline,
        titleMedium: AppTextStyles.openRegularTitleSemiBold,
        titleSmall: AppTextStyles.openRegularTitle,
        bodyLarge: AppTextStyles.openRegularText,
        bodyMedium: AppTextStyles.openRegularItalic,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: AppTextStyles.openRegularTitleSemiBold,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: AppTextStyles.loraRegularHeadline,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      tabBarTheme: const TabBarTheme(
        labelStyle: AppTextStyles.openRegularTitleSemiBold,
        unselectedLabelStyle: AppTextStyles.openRegularTitle,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.black,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.green,
        disabledColor: Colors.red,
        labelStyle: AppTextStyles.openRegularText.copyWith(color: Colors.white),
        secondaryLabelStyle:
            AppTextStyles.openRegularText.copyWith(color: Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      ),
    );
  }
}
