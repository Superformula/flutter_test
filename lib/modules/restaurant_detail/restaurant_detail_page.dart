import 'package:flutter/material.dart';

import 'package:restaurant_tour/core/models/restaurant.dart';
import 'package:restaurant_tour/design_system/design_system.dart';
import 'package:restaurant_tour/modules/restaurant_detail/widgets/review_list.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Content();
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    Restaurant? restaurant;
    if (args != null) {
      restaurant = args as Restaurant;
    }

    return Scaffold(
      appBar: AppBar(
        title: DsText(
          restaurant?.name ?? 'No name',
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
              child: DsImageNetwork(
                urlImage: restaurant?.heroImage,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(DsSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DsText(restaurant?.price ?? '---'),
                      StatusOpen(isOpenNow: restaurant?.isOpen ?? false),
                    ],
                  ),
                  const SizedBox(height: DsSizes.md),
                  const Divider(),
                  const SizedBox(height: DsSizes.md),
                  const DsText('Address'),
                  DsText(
                    restaurant?.location?.formattedAddress ?? 'No address',
                    isBold: true,
                  ),
                  const SizedBox(height: DsSizes.md),
                  const Divider(),
                  const SizedBox(height: DsSizes.md),
                  const DsText('Overral Rating'),
                  Row(
                    children: [
                      DsText(
                        (restaurant?.rating ?? 0).toString(),
                        textVariant: TextVariant.title,
                        isBold: true,
                      ),
                      const Icon(
                        Icons.star,
                        color: AppColors.stars,
                      ),
                    ],
                  ),
                  const SizedBox(height: DsSizes.md),
                  const Divider(),
                  DsText('${restaurant?.reviews?.length ?? 0} reviews'),
                  ReviewList(reviews: restaurant?.reviews ?? []),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
