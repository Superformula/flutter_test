import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

import '../../../navigator.dart';
import '../../../typography.dart';

class RestaurantCard extends StatelessWidget {
  final String photo;
  final String name;
  final String price;
  final num rating;
  final bool isOpenNow;

  const RestaurantCard({
    super.key,
    required this.photo,
    required this.name,
    required this.price,
    required this.rating,
    required this.isOpenNow,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        elevation: 1,
        child: InkWell(
          onTap: () => {
            NavAdapter.goToNamed(
              '/restaurant_details',
              context,
            ),
          },
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl: photo,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.loraRegularHeadline,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.ltr,
                    ),
                    Text(price),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        StarRating(rating: rating.toDouble()),
                        Text(isOpenNow ? 'Open Now' : 'Closed'),
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
