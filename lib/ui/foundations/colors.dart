import 'package:flutter/material.dart';
import './../ui.dart';

/// A class that consolidates foundation color definitions for the app.
class AppColorsFundation {
  AppColorsFundation._(); // Private constructor to prevent instantiation.

  //Background Colors

  /// The background color used for light themes
  static const Color bgWhite = OsColors.light;

  /// The primary color
  static const Color primaryColor = OsColors.primaryColor;

  /// The secondary color
  static const Color secondaryColor = OsColors.secondaryColor;

  /// The primary color
  static const MaterialColor primaryColorMat = Colors.red;

  // Button colors
  /// The primary button color
  static const Color colorButtonPrimary = OsColors.primaryColor;

  /// The primary button color
  static const Color colorBorderButtonPrimary = OsColors.light;

  /// The secondary button color
  static const Color colorButtonSecondary = OsColors.light;

  /// The background color for warning elements.
  static const Color starBgColor = OsColors.star;

  /// The background color for success elements.
  static const Color succcessBgColor = OsColors.statusSuccess;

  /// The background color for danger elements.
  static const Color dangerBgColor = OsColors.statusError;

  /// The background color for error elements.
  static const Color errorBgColor = OsColors.statusError;

  /// The background color for body Text Color.
  static const Color bodyTextColor = OsColors.bodyTextColor;

  /// The background color for ligh Text Color.
  static const Color lightTextColor = OsColors.lightTextColor;
}
