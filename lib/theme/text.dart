import 'package:flutter/material.dart';

class ThemeText {
  static const textTheming = TextTheme(
    displayLarge: TextStyle(
        fontSize: 14,
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w600,
        height: 1.5),
    displayMedium: TextStyle(fontSize: 14, fontFamily: 'Open Sans'),
    displaySmall: TextStyle(
      fontSize: 12,
      fontFamily: 'Open Sans',
      fontStyle: FontStyle.italic,
    ),
    bodyMedium: TextStyle(fontSize: 16, height: 1.5),
    bodySmall: TextStyle(
      fontSize: 12,
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w400,
    ),
    headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
    headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
  );
}

const spacingXL = 24.0;
const spacingM = 16.0;
const spacingSM = 8.0;
