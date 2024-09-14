import 'package:flutter/material.dart';
import 'package:restaurant_tour/core/utils/typography.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Address',
            style: AppTextStyles.openRegularText,
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            restaurant.location?.formattedAddress ?? '',
            style: AppTextStyles.openRegularTitleSemiBold,
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Divider(),
        ),
      ],
    );
  }
}
