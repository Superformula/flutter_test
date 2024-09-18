import 'package:flutter/material.dart';

import 'package:restaurant_tour/design_system/foundations/foundations.dart';
import 'package:restaurant_tour/design_system/tokens/tokens.dart';

enum TextVariant {
  /// fontSize: 18
  title(fontSize: 18),

  /// fontSize: 16
  subTitle(fontSize: 16),

  /// fontSize: 14
  medium(fontSize: 14),

  /// fontSize: 12
  caption(fontSize: 12),

  /// fontSize: 10
  small(fontSize: 10);

  const TextVariant({required this.fontSize});

  final double fontSize;
}

class DsText extends StatelessWidget {
  const DsText({
    super.key,
    required this.text,
    required this.textVariant,
    this.isBold,
    this.fontFamily,
    this.textAlign,
    this.color,
  });

  final String text;
  final TextVariant textVariant;
  final bool? isBold;
  final String? fontFamily;
  final TextAlign? textAlign;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return _BasicText(
      text: text,
      fontSize: textVariant.fontSize,
      fontWeight: isBold == true ? FontWeight.w700 : FontWeight.w400,
      color: color ?? DsColors.black,
      fontFamily: fontFamily ?? AppFonts.primary,
      textAlign: textAlign,
    );
  }
}

class _BasicText extends StatelessWidget {
  const _BasicText({
    required this.text,
    this.textAlign,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    required this.fontFamily,
  });

  final String text;
  final TextAlign? textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
