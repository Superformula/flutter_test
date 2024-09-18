import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RestaurantOpenWidget extends StatelessWidget {
  const RestaurantOpenWidget(this.isOpen, {super.key});
  final bool isOpen;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          isOpen ? 'Open Now' : 'Closed',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontStyle: FontStyle.italic),
        ),
        const Gap(6),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Icon(
            Icons.circle,
            size: 8,
            color: isOpen ? Colors.green : Colors.red,
          ),
        )
      ],
    );
  }
}
