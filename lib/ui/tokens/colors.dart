import 'package:flutter/material.dart';

class OsColors {
  OsColors._(); // Private constructor to prevent instantiation.

  /// The primary light color of the app
  static const light = Color(0xFFFFFFFF);

  ///The primary brand color the app
  static const primaryColor = Color(0xFFFFFFFF);

  ///The secondary brand color the app
  static const secondaryColor = Color(0xFF000000);

  /// The color used to indicate an error state.
  static const statusError = Color.fromARGB(255, 191, 48, 48);

  /// The color used to indicate a success state.
  static const statusSuccess = Color(0xFF5CD313);

  /// The color used to indicate a star
  static const star = Color(0xFFFFB800);

  /// The color for body text content
  static const Color bodyTextColor = Color(0xFF000000);

  /// The color for primary text
  static const lightTextColor = Color(0xFF606060);

  ///The color for shadow card
  static const shadowColor = Color(0x33A8B5C4);

  ///The color for bg
  static const bgColor = Color(0xFFfafafa);
}
