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
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                    offset: Offset(0, 1),
                    blurRadius: 5,
                    spreadRadius: 0,
                  ),
                ],
              ),
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
                            style: Theme.of(context).textTheme.titleMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${restaurant.price ?? ''} ${restaurant.categories?.first.title ?? ''}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: 8),
                          _buildRatingAndStatus(restaurant, context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String? url) {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(8), // Rounded corners with radius of 8
      child: url != null
          ? Image.network(
              url,
              width: 88,
              height: 88,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return _placeholderImage();
              },
            )
          : _placeholderImage(),
    );
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

  Widget _buildRatingAndStatus(Restaurant restaurant, BuildContext context) {
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
            Text(restaurant.isOpen ? 'Open' : 'Closed',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontStyle: FontStyle.italic)),
            const SizedBox(width: 4),
            Icon(
              Icons.circle,
              size: 12,
              color: restaurant.isOpen ? Colors.green : Colors.red,
            ),
          ],
        ),
      ],
    );
  }
}
