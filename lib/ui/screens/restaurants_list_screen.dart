import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_tour/data/models/restaurant_data.dart';
import 'package:restaurant_tour/typography.dart';
import 'package:restaurant_tour/ui/widgets/rating.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_availability.dart';
import 'package:shimmer/shimmer.dart';

import 'restaurant_detail_screen.dart';

@visibleForTesting
final class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  final RestaurantData restaurant;

  @override
  Widget build(BuildContext context) {
    // TODO: fix - maybe list tile?
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
            settings: const RouteSettings(name: 'restaurant-details'),
            builder: (context) => RestaurantDetailScreen(restaurant: restaurant),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (restaurant.photoUrl case final photoUrl?) //
                CachedNetworkImage(
                  imageUrl: photoUrl,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      height: 88,
                      width: 88,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: imageProvider,
                        ),
                      ),
                    );
                  },
                  progressIndicatorBuilder: (context, url, progress) {
                    return Shimmer.fromColors(
                      enabled: true,
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: const SizedBox.square(dimension: 88),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return Container(
                      width: 88,
                      height: 88,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset('assets/png/no_wifi.png'),
                    );
                  },
                ),
              const Gap(12),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: AppTextStyles.loraRegularTitle,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(4),
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
                    const Gap(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Ratings(
                          count: restaurant.rating.toInt(),
                        ),
                        // extract
                        RestaurantAvailability(isRestaurantOpen: restaurant.isOpen),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final class RestaurantsList extends StatelessWidget {
  const RestaurantsList({
    super.key,
    required this.restaurants,
  });

  final List<RestaurantData> restaurants;

  @override
  Widget build(BuildContext context) {

    
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: restaurants.length,
      itemBuilder: (context, index) => RestaurantCard(restaurant: restaurants[index]),
      separatorBuilder: (BuildContext context, int index) => const Gap(12),
    );
  }
}
