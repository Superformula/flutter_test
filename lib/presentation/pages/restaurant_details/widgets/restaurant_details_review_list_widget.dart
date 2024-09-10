import 'package:flutter/material.dart';
import 'package:restaurant_tour/presentation/pages/restaurant_details/widgets/restaurant_details_review_widget.dart';
import '../../../../models/restaurant.dart';

class RestaurantDetailsReviewListWidget extends StatelessWidget {
  final List<Review> reviews;

  const RestaurantDetailsReviewListWidget({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: reviews.length,
      separatorBuilder: (BuildContext context, int index) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Divider(),
      ),
      itemBuilder: (context, index) {
        return RestaurantDetailsReviewsWidget(review: reviews[index]);
      },
    );
  }
}
