import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_tour/models/restaurant_data.dart';
import 'package:restaurant_tour/typography.dart';
import 'package:restaurant_tour/ui/widgets/rating.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_availability.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intersperse/intersperse.dart';

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
              if (restaurant.photoUrl case final photoUrl?) //
                CachedNetworkImage(
                  imageUrl: photoUrl,
                  imageBuilder: (context, imageProvider) {
                    return Image(image: imageProvider);
                  },
                  progressIndicatorBuilder: (context, url, progress) {
                    return Shimmer.fromColors(
                      enabled: true,
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: const SizedBox(height: 360),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return Container(
                      width: 360,
                      height: 360,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset('assets/png/no_wifi.png'),
                    );
                  },
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
                          Text(restaurant.price),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  '${restaurant.reviews.length} reviews',
                  style: AppTextStyles.openRegularText,
                ),
              ),
              const Gap(24),
              // list view-like
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: intersperse(
                    const Gap(24),
                    [
                      for (final review in restaurant.reviews) UserReviewCard(review: review),
                    ],
                  ).toList(growable: false),
                ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
  const UserReviewCard({
    super.key,
    required this.review,
  });

  final RestaurantReviewData review;

  String userNameInitials(String name) {
    final parts = name.split(' ');
    return parts.map((part) => part[0].toUpperCase()).join();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Ratings(count: review.rating.toInt()),
        const Gap(8),
        Text(
          review.text,
          style: AppTextStyles.openRegularText.copyWith(fontSize: 16),
        ),
        const Gap(8),
        Row(
          children: [
            if (review.user.imageUrl case final userImageUrl?) ...[
              CachedNetworkImage(
                imageUrl: userImageUrl,
                imageBuilder: (context, imageProvider) {
                  return CircleAvatar(
                    foregroundImage: imageProvider,
                  );
                },
              ),
            ] else
              CircleAvatar(
                backgroundColor: Colors.grey.shade500,
                child: Center(
                  child: Text(
                    userNameInitials(review.user.name),
                    style: AppTextStyles.openRegularTitleSemiBold,
                  ),
                ),
              ),
            const Gap(8),
            Text(review.user.name),
          ],
        ),
      ],
    );
  }
}
