import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 16,
                itemPadding: const EdgeInsets.symmetric(horizontal: 2),
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (value) {
                  print(value);
                },
              ),
              const SizedBox(height: 8),
              const Text(
                'Const class cannot remove fields: Library:package:restaurant_tour/modules/home/widgets/image_network_loading.dart Class: ImageNetworkLoading. Try performing a hot restart instead.',
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  Text('User name'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
