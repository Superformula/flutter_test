import 'package:flutter/material.dart';
import 'package:restaurant_tour/models/restaurant.dart';

class RestaurantTile extends StatelessWidget {
  final Restaurant restaurant;
  final VoidCallback onTap;

  RestaurantTile({required this.restaurant, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                _buildImage(restaurant.photos?.first),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${restaurant.price ?? ''} ${restaurant.categories?.first.title ?? ''}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildRatingAndStatus(restaurant),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String? url) {
    return url != null
        ? Image.network(
      url,
      width: 88,
      height: 88,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return _placeholderImage();
      },
    )
        : _placeholderImage();
  }

  Widget _placeholderImage() {
    return Container(
      width: 88,
      height: 88,
      color: Colors.grey[300],
      child: const Icon(
        Icons.image_not_supported,
        size: 40,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildRatingAndStatus(Restaurant restaurant) {
    return Row(
      children: [
        Row(
          children: List.generate(
            restaurant.rating!.toInt(),
                (index) => const Icon(
              Icons.star,
              size: 16,
              color: Colors.amber,
            ),
          ),
        ),
        const Spacer(),
        Row(
          children: [
            Icon(
              Icons.circle,
              size: 12,
              color: restaurant.isOpen ? Colors.green : Colors.red,
            ),
            const SizedBox(width: 4),
            Text(
              restaurant.isOpen ? 'Open' : 'Closed',
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ],
    );
  }
}