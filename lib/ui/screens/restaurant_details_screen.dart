import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/cubit.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/ui/typography.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_hour_status.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_image.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_price_and_category_info.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_rating.dart';

final class RestaurantDetailsScreen extends StatelessWidget {
  const RestaurantDetailsScreen({
    super.key,
    required this.restaurant,
    required this.onFavorite,
  });

  final Restaurant restaurant;
  final VoidCallback onFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
        actions: [
          Builder(
            builder: (context) {
              final bloc = context.watch<RestaurantTourCubit>();

              return IconButton(
                icon: AnimatedCrossFade(
                  firstChild: const Icon(Icons.favorite),
                  secondChild: const Icon(Icons.favorite_outline),
                  crossFadeState: bloc.favorited(restaurant.id) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  firstCurve: Curves.easeInOut,
                  secondCurve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 150),
                ), //
                onPressed: onFavorite,
              );
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 361.0,
              child: RestaurantImage(
                restaurant: restaurant,
                heroTag: restaurant.id,
              ),
            ),
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: const EdgeInsets.all(24.0),
              sliver: SliverMainAxisGroup(
                slivers: [
                  SliverToBoxAdapter(
                    child: _BasicInfo(restaurant: restaurant),
                  ),
                  const SliverToBoxAdapter(
                    child: Divider(height: 49.0),
                  ),
                  SliverToBoxAdapter(
                    child: _AddressSection(address: restaurant.location.formattedAddress),
                  ),
                  const SliverToBoxAdapter(
                    child: Divider(height: 49.0),
                  ),
                  if (restaurant.rating case final rating?) ...[
                    SliverToBoxAdapter(
                      child: _OverallRating(rating: rating),
                    ),
                    const SliverToBoxAdapter(
                      child: Divider(height: 49.0),
                    ),
                  ],
                  SliverToBoxAdapter(
                    child: Text(
                      '${restaurant.reviews.length} Reviews',
                      style: AppTextStyles.openCaption,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 16.0),
                  ),
                  SliverList.separated(
                    itemCount: restaurant.reviews.length,
                    itemBuilder: (context, index) => _Review(review: restaurant.reviews[index]),
                    separatorBuilder: (context, index) => const Divider(height: 33.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final class _BasicInfo extends StatelessWidget {
  const _BasicInfo({
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RestaurantPriceAndCategoryInfo(restaurant: restaurant),
        const Spacer(),
        RestaurantHourStatus(restaurant: restaurant),
      ],
    );
  }
}

final class _AddressSection extends StatelessWidget {
  const _AddressSection({
    required this.address,
  });

  final String address;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Address',
          style: AppTextStyles.openCaption,
        ),
        const SizedBox(height: 24.0),
        Text(
          address,
          style: AppTextStyles.openSemiBold,
        ),
      ],
    );
  }
}

final class _OverallRating extends StatelessWidget {
  const _OverallRating({
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Overall Rating',
          style: AppTextStyles.openCaption,
        ),
        const SizedBox(height: 24.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              4.6.toStringAsFixed(1),
              style: const TextStyle(
                fontFamily: 'Lora',
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
                height: 36.0 / 28.0,
              ),
            ),
            const SizedBox(width: 2.0),
            Transform.translate(
              offset: const Offset(0.0, -7.0),
              child: const RestaurantRatingStar(),
            ),
          ],
        ),
      ],
    );
  }
}

final class _Review extends StatelessWidget {
  const _Review({
    required this.review,
  });

  final Review review;

  @override
  Widget build(BuildContext context) {
    final ImageProvider image = switch (review.user.imageUrl) {
      final url? => NetworkImage(url),
      null => const AssetImage('assets/images/no_user_image.jpg'),
    };

    return Column(
      children: [
        RestaurantReviewRating(review: review),
        const SizedBox(height: 8.0),
        Text(
          review.text,
          style: AppTextStyles.openBody1,
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: image,
            ),
            const SizedBox(width: 8.0),
            Text(
              review.user.name,
              style: AppTextStyles.openCaption,
            ),
          ],
        ),
      ],
    );
  }
}
