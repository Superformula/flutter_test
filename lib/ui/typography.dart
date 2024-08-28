import 'package:flutter/material.dart';

abstract final class AppTextStyles {
  // Lora
  static const loraHeading6 = TextStyle(
    fontFamily: 'Lora',
    fontWeight: FontWeight.w700,
    fontSize: 18.0,
    height: 24.0 / 18.0,
    color: Colors.black,
  );

  static const loraSubtitle1 = TextStyle(
    fontFamily: 'Lora',
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    height: 24.0 / 16.0,
  );

  // Open sans
  static const openBody1 = TextStyle(
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    height: 24.0 / 16.0,
    color: Colors.black,
  );

  static const openSemiBold = TextStyle(
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    height: 24.0 / 14.0,
    color: Colors.black,
  );

  static const openRegularTitle = TextStyle(
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    color: Colors.black,
  );

  static const openCaption = TextStyle(
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    height: 20.0 / 12.0,
    color: Colors.black,
  );

  static const openOverline = TextStyle(
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    fontSize: 12.0,
    height: 1.0,
    color: Colors.black,
  );
}
