import 'package:flutter/material.dart';
import 'package:restaurant_ui/restaurant_ui.dart';

class RestaurantStatus extends StatelessWidget {
  const RestaurantStatus({required this.isOpen, super.key});

  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    final title = isOpen ? 'Open now' : 'Closed';
    final iconColor = isOpen ? Colors.green : Colors.red;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: AppTextStyles.openRegularItalic),
        const SizedBox(width: 4),
        Icon(Icons.circle, size: 8, color: iconColor),
      ],
    );
  }
}
