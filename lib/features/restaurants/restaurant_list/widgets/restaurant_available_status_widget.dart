import 'package:flutter/material.dart';

class RestaurantAvailableStatusWidget extends StatelessWidget {
  const RestaurantAvailableStatusWidget({required this.isOpen, super.key});

  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          isOpen ? 'Open Now' : 'Closed',
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: Color(isOpen ? 0xff5CD313 : 0xffEA5E5E),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ],
    );
  }
}
