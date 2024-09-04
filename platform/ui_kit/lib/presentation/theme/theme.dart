import 'package:flutter/material.dart';
import 'package:ui_kit/presentation/font_style/typography.dart';

abstract class UiKitTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: Colors.black,
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: Colors.black),
      textTheme: const TextTheme(
        headlineMedium: AppTextStyles.loraRegularHeadline,
        headlineSmall: AppTextStyles.openRegularTitleSemiBold,
        titleMedium: AppTextStyles.loraRegularTitle,
        bodyMedium: AppTextStyles.openRegularText,

        // Defina outros estilos conforme necessário
      ),
    );
  }
}
