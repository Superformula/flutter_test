import 'package:flutter/material.dart';
import 'package:restaurant_tour/core/utils/typography.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/presentation/pages/restaurant_details_page.dart';
import 'package:restaurant_tour/presentation/widgets/is_open_widget.dart';
import 'package:restaurant_tour/presentation/widgets/ratings.dart';

class RestaurantsCard extends StatelessWidget {
  const RestaurantsCard({required this.restaurant, super.key});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RestaurantDetailsPage(
              restaurant: restaurant,
            ),
          ),
        );
      },
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                key: Key(restaurant.heroImage),
                transitionOnUserGestures: true,
                tag: restaurant.heroImage,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    restaurant.heroImage,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            restaurant.name ?? '',
                            maxLines: 2,
                            style: AppTextStyles.loraRegularTitle,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          '${restaurant.price}',
                          style: AppTextStyles.openRegularText,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          restaurant.categories?.first.alias ?? '',
                          style: AppTextStyles.openRegularText,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Ratings(
                          rating: restaurant.rating ?? 0,
                        ),
                        IsOpenWidget(isOpen: restaurant.isOpen),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
