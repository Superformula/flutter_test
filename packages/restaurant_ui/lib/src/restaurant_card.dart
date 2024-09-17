import 'package:flutter/material.dart';
import 'package:restaurant_ui/restaurant_ui.dart';

/// {@template restaurant_card}
/// A reusable card widget that displays restaurant details including
/// a photo, title, price, rating, category, and its open status.
///
/// It includes a gesture detector to handle tap events for user interaction.
/// {@endtemplate}
class RestaurantCard extends StatelessWidget {
  /// {@macro restaurant_card}
  const RestaurantCard({
    required this.title,
    required this.isOpen,
    required this.price,
    required this.rating,
    required this.category,
    required this.photoUrl,
    required this.tag,
    this.onTap,
    super.key,
  });

  /// The title of the restaurant.
  final String title;

  /// Unique tag used for [Hero] widget transition.
  final String tag;

  /// Indicates whether the restaurant is open.
  final bool isOpen;

  /// URL of the restaurant's photo.
  final String photoUrl;

  /// The price level of the restaurant.
  final String price;

  /// The restaurant's rating, typically out of 5.
  final double rating;

  /// The category of the restaurant (e.g., "Italian", "Mexican").
  final String category;

  /// Callback function triggered when the card is tapped.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Hero(
                tag: tag,
                child: RestaurantNetworkImage(photoUrl: photoUrl),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.openRegularHeadline,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$price $category',
                      style: AppTextStyles.openRegularText,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingView(rating: rating),
                        RestaurantStatus(isOpen: isOpen),
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

/// {@template restaurant_network_image}
/// A widget that displays an image from a given URL with rounded corners.
///
/// If the image is loading or fails to load, appropriate widgets (like a
/// loading spinner or error icon) are shown.
/// {@endtemplate}
class RestaurantNetworkImage extends StatelessWidget {
  /// {@macro restaurant_network_image}
  const RestaurantNetworkImage({
    required this.photoUrl,
    super.key,
    this.radius = 8,
    this.height = 80,
    this.width = 80,
    this.fit = BoxFit.cover,
  });

  /// The URL of the image to display.
  final String photoUrl;

  /// The border radius to apply to the image.
  final double radius;

  /// The height of the image.
  final double height;

  /// The width of the image.
  final double width;

  /// How the image should be inscribed into the box.
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image(
        height: height,
        width: width,
        image: NetworkImage(photoUrl),
        fit: fit,
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
