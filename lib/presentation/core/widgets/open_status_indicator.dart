import 'package:flutter/material.dart';

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
        Text(
          isOpen ? 'Open now' : 'Closed',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isOpen ? Colors.green : Colors.red,
          ),
        ),
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
