import 'package:flutter/material.dart';

import 'package:restaurant_tour/design_system/atoms/atoms.dart';
import 'package:restaurant_tour/design_system/foundations/foundations.dart';
import 'package:restaurant_tour/design_system/tokens/tokens.dart';

class StatusOpen extends StatelessWidget {
  const StatusOpen({
    super.key,
    required this.isOpenNow,
  });

  final bool isOpenNow;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DsText(
          isOpenNow ? 'Open now' : 'Closed',
          fontStyle: FontStyle.italic,
        ),
        const SizedBox(width: DsSizes.xxs),
        Icon(
          Icons.circle,
          size: DsSizes.md,
          color: isOpenNow ? AppColors.success : AppColors.error,
        ),
      ],
    );
  }
}
