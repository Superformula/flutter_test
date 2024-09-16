import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:restaurant_tour/home/models/restaurant.dart';

import '../../../navigator.dart';
import '../../../typography.dart';

class RestaurantCard extends StatelessWidget {
  final String photo;
  final String name;
  final String price;
  final num rating;
  final bool isOpenNow;
  final String category;
  final Restaurant? data;

  const RestaurantCard({
    super.key,
    required this.photo,
    required this.name,
    required this.price,
    required this.rating,
    required this.isOpenNow,
    required this.category,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => {
            NavAdapter.goToNamed(
              '/restaurant_details',
              context,
              data: {
                'restaurant': data,
              },
            ),
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: CachedNetworkImage(
                    imageUrl: photo,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      constraints: const BoxConstraints(minHeight: 48),
                      child: Text(
                        name,
                        style: AppTextStyles.loraRegularHeadline,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Text(
                      '$price $category',
                      style: AppTextStyles.openRegularText,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        StarRating(
                          rating: rating.toDouble(),
                          size: 18,
                          color: Colors.amber,
                        ),
                        const Spacer(),
                        Text(
                          isOpenNow ? 'Open Now' : 'Closed',
                          style: AppTextStyles.openRegularItalic,
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.circle,
                          color: isOpenNow ? Colors.green : Colors.red,
                          size: 8,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
