import 'package:flutter/material.dart';
import 'package:restaurant_ui/restaurant_ui.dart';

/// {@template restaurant_status}
/// A widget that displays the current status of a restaurant (open or closed).
/// It shows a text ('Open now' or 'Closed') and a colored icon (green for open,
/// red for closed).
/// {@endtemplate}
class RestaurantStatus extends StatelessWidget {
  /// {@macro restaurant_status}
  const RestaurantStatus({required this.isOpen, super.key});

  /// Whether the restaurant is currently open or not.
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
