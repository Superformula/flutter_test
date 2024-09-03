import 'package:flutter/material.dart';
import 'package:restaurant_tour/presentation/core/styles/text_styles.dart';

class OpenStatusIndicator extends StatelessWidget {
  final bool isOpen;

  const OpenStatusIndicator({
    Key? key,
    required this.isOpen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(isOpen ? 'Open now' : 'Closed',
            style: TextStyles.restaurantCardStatusTextStyle),
        const SizedBox(width: 4),
        Icon(
          Icons.circle,
          color: isOpen ? Colors.green : Colors.red,
          size: 12,
        ),
      ],
    );
  }
}
