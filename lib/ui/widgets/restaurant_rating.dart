import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_tour/models/restaurant.dart';

final class RestaurantRating extends StatelessWidget {
  const RestaurantRating({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final starsCount = restaurant.rating?.round() ?? 0;

    assert(starsCount >= 0 && starsCount <= 5);

    return Row(
      children: [
        for (int i = 0; i < starsCount; i++) const RestaurantRatingStar(),
      ],
    );
  }
}

final class RestaurantReviewRating extends StatelessWidget {
  const RestaurantReviewRating({
    super.key,
    required this.review,
  });

  final Review review;

  @override
  Widget build(BuildContext context) {
    final starsCount = review.rating;

    assert(starsCount >= 0 && starsCount <= 5);

    return Row(
      children: [
        for (int i = 0; i < starsCount; i++) const RestaurantRatingStar(),
      ],
    );
  }
}

final class RestaurantRatingStar extends StatelessWidget {
  const RestaurantRatingStar({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/star.svg',
      width: 12.0,
      height: 12.0,
    );
  }
}
