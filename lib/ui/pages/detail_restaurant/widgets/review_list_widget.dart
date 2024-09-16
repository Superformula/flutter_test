import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_tour/config/constants/constants.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';
import 'package:restaurant_tour/ui/foundations/typography.dart';
import 'package:restaurant_tour/ui/tokens/colors.dart';
import 'package:restaurant_tour/ui/widgets/divider_widget.dart';
import 'package:restaurant_tour/ui/widgets/rating_widget.dart';

class ReviewListWidget extends StatelessWidget {
  final RestaurantEntity restaurant;
  const ReviewListWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final review = restaurant.reviews[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: _buildReviewCard(review),
          );
        },
        childCount: restaurant.reviews.length,
      ),
    );
  }

  Widget _buildReviewCard(Review review) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: review == restaurant.reviews.first,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text('${restaurant.reviews.length} ${AppConstants.reviews}', style: AppTextStyles.openRegularText),
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            RatingWidget(rating: review.rating),
          ],
        ),
        const SizedBox(height: 8.0),
        Text(
          review.text,
          style: AppTextStyles.openRegularText,
        ),
        const SizedBox(height: 12.0),
        Row(
          children: [
            CircleAvatar(
              radius: 24.0,
              backgroundColor: OsColors.shadowColor,
              child: CachedNetworkImage(
                imageUrl: review.user.imageUrl,
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  radius: 24,
                  backgroundImage: imageProvider,
                ),
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: OsColors.light,
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              review.user.name,
              style: AppTextStyles.openRegularText,
            ),
          ],
        ),
        const DividerWidget(),
      ],
    );
  }
}
