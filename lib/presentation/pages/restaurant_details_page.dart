import 'package:flutter/material.dart';
import 'package:restaurant_tour/core/utils/typography.dart';
import 'package:restaurant_tour/data/models/restaurant.dart';
import 'package:restaurant_tour/presentation/widgets/restaurant_details/address_section.dart';
import 'package:restaurant_tour/presentation/widgets/restaurant_details/general_info_section.dart';
import 'package:restaurant_tour/presentation/widgets/restaurant_details/overall_rating_section.dart';
import 'package:restaurant_tour/presentation/widgets/restaurant_details/reviews_section.dart';

class RestaurantDetailsPage extends StatefulWidget {
  const RestaurantDetailsPage({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  State<RestaurantDetailsPage> createState() => _RestaurantDetailsPageState();
}

class _RestaurantDetailsPageState extends State<RestaurantDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final restaurant = widget.restaurant;
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name ?? ''),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              // Add to favorites
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              key: Key(restaurant.heroImage),
              tag: restaurant.heroImage,
              transitionOnUserGestures: true,
              child: Image.network(
                restaurant.heroImage,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            GeneralInfoSection(restaurant: restaurant),
            const SizedBox(
              height: 24,
            ),
            AddressSection(restaurant: restaurant),
            OverallRatingSection(restaurant: restaurant),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                '${restaurant.reviews?.length} Reviews',
                style: AppTextStyles.openRegularTitle,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ReviewsSection(reviews: restaurant.reviews ?? []),
          ],
        ),
      ),
    );
  }
}
