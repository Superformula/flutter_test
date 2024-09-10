import 'package:flutter/material.dart';
import '../../../../core/config/strings.dart';
import '../../../../models/restaurant.dart';
import '../../../../typography.dart';
import '../../restaurant_list/widgets/restaurant_list_categories_widget.dart';
import '../../restaurant_list/widgets/restaurant_list_rating_icons_widget.dart';

class RestaurantDetailsReviewsWidget extends StatelessWidget {
  final Review review;

  const RestaurantDetailsReviewsWidget({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RestaurantListRatingIconsWidget(rating: review.rating?.round() ?? 0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(review.text ?? 'No comment'),
          ),
          Row(
            children: [
              review.user!.imageUrl != null
              ? ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(20),
                  child: Image.network(
                    review.user!.imageUrl!,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              )
              : const Icon(
                Icons.person,
                size: 40,
              ),
              const SizedBox(width: 10,),
              Text(
                review.user?.name ?? 'Anonymous',
                style: AppTextStyles.openRegularText,
              ),
            ],
          )
        ],
      ),
    );
  }
}
