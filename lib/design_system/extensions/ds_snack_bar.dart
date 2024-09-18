import 'package:flutter/material.dart';

import 'package:restaurant_tour/design_system/design_system.dart';

enum SnackBarType {
  success(
    backgroundColor: AppColors.success,
    textColor: DsColors.white,
  ),
  error(
    backgroundColor: AppColors.error,
    textColor: DsColors.white,
  );

  const SnackBarType({
    required this.backgroundColor,
    required this.textColor,
  });

  final Color backgroundColor;
  final Color textColor;
}

extension SnackBarExtension on BuildContext {
  void showDsSnackBar({
    required String message,
    required SnackBarType type,
    bool? showCloseIcon,
    SnackBarBehavior? behavior,
    Duration? duration,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        showCloseIcon: showCloseIcon,
        closeIconColor: DsColors.white,
        behavior: behavior ?? SnackBarBehavior.fixed,
        backgroundColor: type.backgroundColor,
        duration: duration ?? const Duration(milliseconds: 4000),
        content: Text(
          message,
          style: TextStyle(
            color: type.textColor,
          ),
        ),
      ),
    );
  }
}
