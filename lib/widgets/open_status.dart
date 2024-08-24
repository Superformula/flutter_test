import 'package:flutter/material.dart';

class OpenStatus extends StatelessWidget {
  const OpenStatus({super.key, required this.isOpen});
  final bool isOpen;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          isOpen ? 'Open Now' : 'Closed Now',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        SizedBox(
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
