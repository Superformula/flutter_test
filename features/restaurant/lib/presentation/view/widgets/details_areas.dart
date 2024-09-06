import 'package:flutter/material.dart';

class DetailsArea extends StatelessWidget {
  const DetailsArea({super.key, required this.title, required this.content});
  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const SizedBox(
          height: 24,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 24,
        ),
        content,
        const SizedBox(
          height: 24,
        )
      ],
    );
  }
}
