import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:restaurant_tour/themes/typography.dart';

import '../../utils/utils.dart';

class Comment extends StatelessWidget {
  final String photo;
  final String userName;
  final int rating;
  final String text;
  const Comment({
    super.key,
    required this.photo,
    required this.userName,
    required this.rating,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            StarRating(
              rating: rating.toDouble(),
              color: Colors.amber,
              size: 14,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.openRegularTitle,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            SizedBox(
              height: 32,
              width: 32,
              child: CircleAvatar(
                backgroundImage: Utils.getImageProvider(photo),
                radius: 24,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              userName,
              style: AppTextStyles.openRegularTitle,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 8.0,
            right: 16,
            bottom: 8,
          ),
          child: Divider(),
        ),
      ],
    );
  }
}
