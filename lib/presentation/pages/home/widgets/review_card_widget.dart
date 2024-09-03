import 'package:flutter/material.dart';
import 'package:restaurant_tour/presentation/core/styles/text_styles.dart';
import 'package:restaurant_tour/presentation/core/widgets/star_rating_indicator.dart';

class ReviewCardWidget extends StatelessWidget {
  final String reviewText;
  final int rating;
  final String imageUrl;
  final String userName;
  final bool removeBottomDivider;

  const ReviewCardWidget({
    Key? key,
    required this.reviewText,
    required this.rating,
    required this.imageUrl,
    required this.userName,
    required this.removeBottomDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StarRatingIndicator(rating: rating.round()),
        const SizedBox(height: 12),
        Text(
          reviewText,
          style: TextStyles.reviewCardBodyTextStyle,
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            ClipOval(
                child: Image.network(
              imageUrl,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 40,
                  height: 40,
                  color: Colors.grey,
                );
              },
            )),
            const SizedBox(width: 12),
            Text(userName, style: TextStyles.reviewCardUserTextStyle),
          ],
        ),
        const SizedBox(height: 16),
        if (!removeBottomDivider) ...[
          Divider(color: Colors.grey[300], thickness: 1),
          const SizedBox(height: 16),
        ]
      ],
    );
  }
}
