import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_tour/app/app.dart';
import 'package:restaurant_tour/features/restaurants/restaurant_detail/screen/restaurant_detail_screen.dart';
import 'package:restaurant_tour/features/restaurants/restaurant_list/widgets/restaurant_available_status_widget.dart';
import 'package:restaurant_tour/features/restaurants/restaurant_list/widgets/start_rating_widget.dart';

class RestaurantListItemWidget extends StatelessWidget {
  const RestaurantListItemWidget({required this.restaurant, super.key});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RestaurantDetailScreen.routeName, extra: restaurant);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(bottom: 12.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Hero(
                tag: restaurant.id!,
                child: CachedNetworkImage(
                  height: 88,
                  width: 88,
                  fit: BoxFit.cover,
                  imageUrl: restaurant.heroImage,
                ),
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 48.0,
                    child: Text(
                      restaurant.name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 20,
                    child: Text.rich(
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: restaurant.price ?? '\$',
                          ),
                          TextSpan(
                            text: ' ${restaurant.displayCategory}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StartRatingWidget(
                        rating: restaurant.rating?.toInt() ?? 0,
                      ),
                      RestaurantAvailableStatusWidget(
                        isOpen: restaurant.isOpen,
                      ),
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
