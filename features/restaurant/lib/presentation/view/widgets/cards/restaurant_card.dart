import 'package:flutter/material.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/presentation/routes/params/route_details_params.dart';
import 'package:restaurant/presentation/view/widgets/rating_widget.dart';
import 'package:ui_kit/presentation/font_style/typography.dart';
import 'package:cached_network_image/cached_network_image.dart';

typedef RefreshCallback = Function;

class RestaurantCard extends StatelessWidget {
  const RestaurantCard(
      {super.key,
      required this.restaurant,
      required this.index,
      this.refreshCallback});
  final Restaurant restaurant;
  final RefreshCallback? refreshCallback;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: "RestaurantCard:$index",
      child: GestureDetector(
        onTap: () async {
          final mustRefresh = await Navigator.of(context).pushNamed(
              '/restaurant/details',
              arguments: RouteDetailsParams(
                  restaurant: restaurant,
                  mustRefreshWhenPop: refreshCallback != null));
          if (mustRefresh != null && mustRefresh == true) {
            refreshCallback?.call();
          }
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Hero(
                  tag: restaurant.id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: restaurant.heroImage.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: restaurant.heroImage,
                              placeholder: (context, url) => const SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  )),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            )
                          : const Icon(Icons.error),
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
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.65,
                        child: Text(
                          restaurant.name,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        restaurant.priceWithCategory,
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
