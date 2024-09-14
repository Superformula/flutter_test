import 'package:flutter/material.dart';

import '../../typography.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1F000000),
              offset: Offset(0, 1),
              blurRadius: 5,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 88,
              width: 88,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 12),
            const Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Restaurant Name Goes Here And Wraps 2 Lines', style: AppTextStyles.loraRegularTitle),
                  SizedBox(height: 4),
                  Text('\$\$\$\$ Italian', style: AppTextStyles.openRegularText),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _Stars(5),
                      _Status(true),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Stars extends StatelessWidget {
  final int _quantity;

  const _Stars(this._quantity);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < _quantity; i++) const _StarIcon(),
      ],
    );
  }
}

class _StarIcon extends StatelessWidget {
  const _StarIcon();

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.star, color: Color(0xFFFFB800), size: 12);
  }
}

class _Status extends StatelessWidget {
  final bool _isOpen;

  const _Status(this._isOpen);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(_isOpen ? 'Open now' : 'Closed', style: AppTextStyles.openRegularItalic),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: SizedBox(
            height: 8,
            width: 8,
            child: CircleAvatar(backgroundColor: _isOpen ? const Color(0XFF5CD313) : const Color(0XFFEA5E5E)),
          ),
        ),
      ],
    );
  }
}
