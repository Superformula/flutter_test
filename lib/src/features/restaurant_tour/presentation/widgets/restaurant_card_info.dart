import 'package:flutter/material.dart';
import 'package:restaurant_tour/typography.dart';

class RestaurantCardInfo extends StatelessWidget {
  const RestaurantCardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 235,
          child: Text(
            'Restaurant Name Goes Here And Wrap 2 Lines',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.loraRegularTitle,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          '\$\$\$\$ Italian',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.openRegularText,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              2,
              (index) => const Icon(
                Icons.star,
                color: Color(0xffffb800),
              ),
            ),
            const Spacer(),
            const SizedBox(
              child: Text(
                'Open Now',
                style: AppTextStyles.openRegularItalic,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.circle,
                color: Colors.green,
                size: 12.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
