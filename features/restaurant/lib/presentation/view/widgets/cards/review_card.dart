import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/presentation/view/widgets/rating_widget.dart';
import 'package:ui_kit/presentation/font_style/typography.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({required this.review, super.key});
  final Review review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingWidget(rate: review.rating.toDouble()),
        const SizedBox(
          height: 8,
        ),
        Text(
          review.text ?? "",
          style: AppTextStyles.openRegularHeadline,
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            ClipOval(
              child: review.user.imageUrl == null
                  ? Container(
                      color: Colors.red.withOpacity(0.2),
                      width: 40.0,
                      height: 40.0,
                      child: Center(
                        child: Text(review.user.name.initials,
                            style: AppTextStyles.openRegularText),
                      ),
                    )
                  : CachedNetworkImage(
                      imageUrl: review.user.imageUrl!,
                      height: 40,
                      width: 40,
                      placeholder: (context, url) => const SizedBox(
                          width: 40,
                          height: 40,
                          child: Center(
                            child: CircularProgressIndicator(),
                          )),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(review.user.name.fullName)
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Divider(),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
