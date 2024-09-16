import 'package:flutter/material.dart';
import 'package:restaurant_tour/typography.dart';

class HeaderHome extends StatelessWidget {
  final String text;
  final bool isDetailsPage;
  const HeaderHome({
    required this.text,
    this.isDetailsPage = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(text, style: AppTextStyles.loraRegularHeadline),
            ],
          ),
        ),
        if (isDetailsPage) ...[
          const Icon(
            Icons.favorite,
          ),
        ],
      ],
    );
  }
}
