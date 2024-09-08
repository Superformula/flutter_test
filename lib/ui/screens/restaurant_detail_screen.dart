import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_tour/data/models/restaurant_data.dart';
import 'package:restaurant_tour/typography.dart';
import 'package:restaurant_tour/ui/widgets/rating.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_availability.dart';

final class RestaurantDetailScreen extends StatefulWidget {
  const RestaurantDetailScreen({
    super.key,
    required this.restaurant,
  });

  final RestaurantData restaurant;

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

final class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  static const divider = Divider(
    color: Color(0xffeeeeee),
    height: 1,
    thickness: 1,
    indent: 24,
    endIndent: 24,
  );

  @override
  Widget build(BuildContext context) {
    final restaurant = widget.restaurant;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          restaurant.name,
          style: AppTextStyles.loraRegularHeadline,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image here
              // extract this
              Center(
                child: Image.asset(
                  'assets/png/hero.png',
                  fit: BoxFit.fitWidth,
                  scale: 0.5,
                ),
              ),
              const Gap(24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    DefaultTextStyle(
                      style: AppTextStyles.openRegularText,
                      child: Row(
                        children: [
                          Text(restaurant.price ),
                          const Gap(4),
                          if (restaurant.category case final category?) Text(category),
                        ],
                      ),
                    ),
                    const Spacer(),
                    RestaurantAvailability(isRestaurantOpen: restaurant.isOpen),
                  ],
                ),
              ),
              const Gap(24),
              divider,
              if (restaurant.address case final address?) //
                RestaurantAddress(address: address),
              const Gap(24),
              divider,
              RestaurantOverallRating(rating: restaurant.rating),
              const Gap(24),
              divider,
              const Gap(24),

              // TODO: fix
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  '42 reviews',
                  style: AppTextStyles.openRegularText,
                ),
              ),
              const Gap(24),
              // list view-like
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: UserReviewCard(),
              ),
              const Gap(24),
            ],
          ),
        ),
      ),
    );
  }
}

@visibleForTesting
final class RestaurantOverallRating extends StatelessWidget {
  const RestaurantOverallRating({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(24),
          const Text(
            'Overall Rating',
            style: AppTextStyles.openRegularText,
          ),
          const Gap(16),
          // TODO: fix
          Row(
            children: [
              Text(
                rating.toString(),
                style: AppTextStyles.loraRegularHeadline.copyWith(
                  fontSize: 28,
                ),
              ),
              const Gap(4),
              const Ratings(
                size: Size.square(12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

@visibleForTesting
final class RestaurantAddress extends StatelessWidget {
  const RestaurantAddress({
    super.key,
    required this.address,
  });

  final String address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Gap(24),
          const Text(
            'Address',
            style: AppTextStyles.openRegularText,
          ),
          const Gap(24),
          // TODO: fix
          Text(
            address,
            style: AppTextStyles.openRegularTitleSemiBold,
          ),
        ],
      ),
    );
  }
}

@visibleForTesting
final class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final rating = 5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Ratings(count: rating),
        const Gap(8),
        //TODO: fix
        const Text('user review data long text'),
        const Gap(8),

        //TODO: fix
        const Row(
          children: [
            CircleAvatar(
              child: ColoredBox(color: Colors.red),
            ),
            Gap(8),
            Text('User name'),
          ],
        ),
      ],
    );
  }
}
