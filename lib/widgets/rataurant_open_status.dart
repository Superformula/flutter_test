import 'package:flutter/material.dart';

class OpenStatusWidget extends StatelessWidget {
  const OpenStatusWidget({super.key, required this.isOpen});
  final bool isOpen;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          isOpen ? 'Open Now' : 'Closed Now',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(
          width: 8,
        ),
        Icon(
          Icons.circle,
          size: 8.0,
          color: isOpen ? Colors.green : Colors.red,
        )
      ],
    );
  }
}
