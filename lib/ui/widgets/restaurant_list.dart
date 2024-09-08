// TODO: find better place for this callback
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_tour/models/restaurant_data.dart';
import 'package:restaurant_tour/typography.dart';
import 'package:restaurant_tour/ui/screens/restaurant_detail_screen.dart';
import 'package:restaurant_tour/ui/widgets/rating.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_availability.dart';
import 'package:shimmer/shimmer.dart';

typedef OnSelectFavoriteCallback = Future<void> Function(RestaurantData, bool);

final class RestaurantsList extends StatefulWidget {
  const RestaurantsList({
    super.key,
    required this.restaurants,
    required this.onSelectFavorite,
  });

  final List<RestaurantData> restaurants;
  final OnSelectFavoriteCallback onSelectFavorite;

  @override
  State<RestaurantsList> createState() => _RestaurantsListState();
}

class _RestaurantsListState extends State<RestaurantsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: widget.restaurants.length,
      itemBuilder: (context, index) {
        return RestaurantCard(
          restaurant: widget.restaurants[index],
          onSelectFavorite: widget.onSelectFavorite,
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Gap(12),
    );
  }
}

final class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.restaurant,
    required this.onSelectFavorite,
  });

  final RestaurantData restaurant;
  final OnSelectFavoriteCallback onSelectFavorite;

  @override
  Widget build(BuildContext context) {
    // TODO: fix - maybe list tile?
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
            settings: const RouteSettings(name: 'restaurant-details'),
            builder: (context) {
              return RestaurantDetailScreen(
                restaurant: restaurant,
                onSelectFavorite: onSelectFavorite,
              );
            },
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
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image(
                        image: imageProvider,
                        width: 88,
                        height: 88,
                        fit: BoxFit.cover,
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
