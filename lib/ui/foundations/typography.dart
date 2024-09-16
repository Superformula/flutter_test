import 'package:flutter/material.dart';
import './../ui.dart';

class AppTextStyles {
  AppTextStyles._(); // Private constructor to prevent instantiation.
  ////----- Lora -----//
  static const loraRegularHeadline = TextStyle(
    fontFamily: AppTypography.familyLora,
    fontWeight: FontWeight.w700,
    fontSize: AppTypography.body,
  );
  static const loraRegularTitle = TextStyle(
    fontFamily: AppTypography.familyLora,
    fontWeight: FontWeight.w700,
    fontSize: AppTypography.h5,
  );

  static const loraRegularTitle2 = TextStyle(
    fontFamily: AppTypography.familyLora,
    fontWeight: FontWeight.w700,
    fontSize: AppTypography.h4,
  );

  static const loraRegularSubTitle1 = TextStyle(
    fontFamily: AppTypography.familyLora,
    fontWeight: FontWeight.w500,
    fontSize: AppTypography.h6,
  );

  //----- Open Sans -----//
  static const openRegularHeadline = TextStyle(
    fontFamily: AppTypography.familyOpenSans,
    fontWeight: FontWeight.w400,
    fontSize: AppTypography.h6,
    color: AppColorsFundation.bodyTextColor,
  );
  static const openRegularTitleSemiBold = TextStyle(
    fontFamily: AppTypography.familyOpenSans,
    fontWeight: FontWeight.w600,
    fontSize: AppTypography.title,
    color: AppColorsFundation.bodyTextColor,
  );
  static const openRegularLightSemiBold = TextStyle(
    fontFamily: AppTypography.familyOpenSans,
    fontWeight: FontWeight.w600,
    fontSize: AppTypography.title,
    color: AppColorsFundation.lightTextColor,
  );
  static const openRegularTitle = TextStyle(
    fontFamily: AppTypography.familyOpenSans,
    fontWeight: FontWeight.w400,
    fontSize: AppTypography.title,
    color: AppColorsFundation.bodyTextColor,
  );
  static const openRegularText = TextStyle(
    fontFamily: AppTypography.familyOpenSans,
    fontWeight: FontWeight.w400,
    fontSize: AppTypography.body,
    color: AppColorsFundation.bodyTextColor,
  );

  static const openRegularItalic = TextStyle(
    fontFamily: AppTypography.familyOpenSans,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    fontSize: AppTypography.body,
    color: AppColorsFundation.bodyTextColor,
  );
}
