import 'package:flutter/material.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/presentation/view/widgets/rating_widget.dart';
import 'package:ui_kit/presentation/font_style/typography.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed('/restaurant/details', arguments: restaurant);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicWidth(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ///TODO add real image when request beck to work
                Hero(
                  tag: 'network:image',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: "https://picsum.photos/250?image=9",
                      placeholder: (context, url) => const SizedBox(
                          width: 80,
                          height: 80,
                          child: Center(
                            child: CircularProgressIndicator(),
                          )),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),

                const SizedBox(
                  width: 12,
                ),

                IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        restaurant.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "${restaurant.price} ${restaurant.categories?.first.title ?? ''}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      IntrinsicWidth(
                        child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: RatingWidget(
                                rate: restaurant.rating,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Text(
                                  restaurant.status,
                                  style: AppTextStyles.openRegularItalic,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.circle,
                                  color: restaurant.statusColor,
                                  size: 8,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
