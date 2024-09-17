import 'package:flutter/material.dart';

import 'package:restaurant_ui/src/rating_view.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    required this.title,
    required this.isOpen,
    required this.price,
    required this.rating,
    required this.categories,
    required this.photoUrl,
    this.onTap,
    super.key,
  });

  final String title;
  final bool isOpen;
  final String photoUrl;
  final String price;
  final double rating;
  final List<String> categories;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              _RoundedNetworkImage(photoUrl: photoUrl),
              Column(
                children: [
                  Text(title),
                  Row(
                    children: [
                      RatingView(rating: rating),
                      const Text('open'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoundedNetworkImage extends StatelessWidget {
  const _RoundedNetworkImage({
    required this.photoUrl,
  });
  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image(
        height: 80,
        width: 80,
        image: NetworkImage(photoUrl),
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Icon(
              Icons.error,
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }
}
