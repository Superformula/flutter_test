import 'package:flutter/material.dart';

/// A utility class that defines common text styles used throughout the app.
///
/// The class provides static constants for different fonts like **Lora** and
/// **Open Sans** with various styles such as regular, bold, italic, etc.
/// These styles can be easily reused across the app to maintain consistency.
class AppTextStyles {
  ////----- Lora -----//

  /// A bold headline style using the **Lora** font.
  ///
  /// - Font weight: 700 (Bold)
  /// - Font size: 18
  static const loraRegularHeadline = TextStyle(
    fontFamily: 'Lora',
    fontWeight: FontWeight.w700,
    fontSize: 18,
  );

  /// A medium title style using the **Lora** font.
  ///
  /// - Font weight: 500 (Medium)
  /// - Font size: 16
  static const loraRegularTitle = TextStyle(
    fontFamily: 'Lora',
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  //----- Open Sans -----//

  /// A regular headline style using the **Open Sans** font.
  ///
  /// - Font weight: 400 (Regular)
  /// - Font size: 16
  /// - Color: Black
  static const openRegularHeadline = TextStyle(
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Colors.black,
  );

  /// A semi-bold title style using the **Open Sans** font.
  ///
  /// - Font weight: 600 (Semi-Bold)
  /// - Font size: 14
  /// - Color: Black
  static const openRegularTitleSemiBold = TextStyle(
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: Colors.black,
  );

  /// A regular title style using the **Open Sans** font.
  ///
  /// - Font weight: 400 (Regular)
  /// - Font size: 14
  /// - Color: Black
  static const openRegularTitle = TextStyle(
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Colors.black,
  );

  /// A regular text style using the **Open Sans** font for general text.
  ///
  /// - Font weight: 400 (Regular)
  /// - Font size: 12
  /// - Color: Black
  static const openRegularText = TextStyle(
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: Colors.black,
  );

  /// A regular italic text style using the **Open Sans** font.
  ///
  /// - Font weight: 400 (Regular)
  /// - Font style: Italic
  /// - Font size: 12
  /// - Color: Black
  static const openRegularItalic = TextStyle(
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    fontSize: 12,
    color: Colors.black,
  );
}
