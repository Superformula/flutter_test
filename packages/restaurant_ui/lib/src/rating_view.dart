import 'package:flutter/material.dart';

/// {@template rating_view}
/// A widget that displays a star-based rating system for a restaurant.
///
/// The rating is displayed using a row of star icons, where the number of stars
/// is based on the truncated rating value.
/// {@endtemplate}
class RatingView extends StatelessWidget {
  /// {@macro rating_view}
  const RatingView({required this.rating, super.key});

  /// The rating value, which will be truncated to determine how many stars
  /// are displayed.
  final double rating;

  @override
  Widget build(BuildContext context) {
    // Truncates the rating value to an integer for the star display.
    final stars = rating.truncate();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.filled(
        stars,
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 16,
        ),
      ),
    );
  }
}
