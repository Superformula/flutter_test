import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({required this.address, super.key});
  final String? address;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(16),
        const Text('Address'),
        const Gap(16),
        Text(
          address ?? 'Address info',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontFamily: 'OpenSans', fontWeight: FontWeight.w600),
        ),
        const Gap(16),
      ],
    );
  }
}
