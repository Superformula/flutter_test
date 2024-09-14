import 'package:flutter/material.dart';
import 'package:restaurant_tour/core/utils/typography.dart';

class IsOpenWidget extends StatelessWidget {
  const IsOpenWidget({required this.isOpen, super.key});

  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          isOpen ? 'Open now' : 'Closed',
          style: AppTextStyles.openRegularItalic,
        ),
        const SizedBox(width: 4),
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: isOpen ? Colors.green : Colors.red,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
