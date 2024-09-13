import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_tour/app/app.dart';
import 'package:restaurant_tour/features/restaurants/restaurant_detail/restaurant_detail.dart';
import 'package:restaurant_tour/features/restaurants/restaurant_list/restaurant_list.dart';

class ReviewListWidget extends StatelessWidget {
  const ReviewListWidget({required this.restaurant, super.key});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final review = restaurant.reviews![index];
          return Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StartRatingWidget(rating: review.rating ?? 0),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  review.text ?? 'No description',
                  maxLines: 4,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.grey[200],
                      child: CachedNetworkImage(
                        imageUrl: review.user?.imageUrl ?? '',
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: 24,
                          backgroundImage: imageProvider,
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      review.user?.name ?? 'No user name',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                if (index < (restaurant.reviews?.length ?? 0) - 1)
                  const DetailDivider(),
              ],
            ),
          );
        },
        childCount: restaurant.reviews?.length ?? 0,
      ),
    );
  }
}
