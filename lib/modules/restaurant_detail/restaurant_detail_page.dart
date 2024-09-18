import 'package:flutter/material.dart';

import 'package:restaurant_tour/design_system/design_system.dart';
import 'package:restaurant_tour/modules/restaurant_detail/widgets/review_list.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DsText(
          'Nombre del restaurante',
          textVariant: TextVariant.subTitle,
          isBold: true,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.4,
              width: double.infinity,
              color: Colors.grey,
              child: const DsImageNetwork(),
            ),
            const Padding(
              padding: EdgeInsets.all(DsSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DsText('\$500 Italian'),
                      StatusOpen(isOpenNow: true),
                    ],
                  ),
                  SizedBox(height: DsSizes.md),
                  Divider(),
                  SizedBox(height: DsSizes.md),
                  DsText('Address'),
                  DsText(
                    '102 Lakeside Ave',
                    isBold: true,
                  ),
                  DsText('Seattle, WA 98122', isBold: true),
                  SizedBox(height: DsSizes.md),
                  Divider(),
                  SizedBox(height: DsSizes.md),
                  DsText('Overral Rating'),
                  DsText(
                    '4.6',
                    textVariant: TextVariant.title,
                    isBold: true,
                  ),
                  SizedBox(height: DsSizes.md),
                  Divider(),
                  DsText('42 reviews'),
                  ReviewList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
