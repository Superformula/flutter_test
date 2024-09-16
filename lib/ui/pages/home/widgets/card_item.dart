import 'package:flutter/material.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';
import 'package:restaurant_tour/ui/ui.dart';
import 'package:restaurant_tour/ui/widgets/availability_widget.dart';
import 'package:restaurant_tour/ui/widgets/image_widget.dart';
import 'package:restaurant_tour/ui/widgets/rating_widget.dart';

/// [Molecule] A customizable action card with Illustration, title description, star rating, hour text
class CardItem extends StatelessWidget {
  final RestaurantEntity restaurant;
  final bool isRestaurantOpen;
  const CardItem({super.key, required this.restaurant, required this.isRestaurantOpen});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: OsColors.light,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: OsColors.shadowColor,
            blurRadius: 5.0,
            offset: Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _getBody(),
        ),
      ),
    );
  }

  List<Widget> _getBody() {
    return [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          restaurant.photos.isNotEmpty
              ? ImageWidget(
                  imageUrl: restaurant.photos.first,
                )
              : const Icon(Icons.image_not_supported, size: 88),
        ],
      ),
      const SizedBox(width: 12.0),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant.name,
              style: AppTextStyles.loraRegularSubTitle1,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      restaurant.price,
                      style: AppTextStyles.openRegularText,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      restaurant.categories.isNotEmpty ? restaurant.categories.first.title : '',
                      style: AppTextStyles.openRegularText,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RatingWidget(
                      rating: restaurant.rating.toInt(),
                    ),
                    const Spacer(),
                    AvailabilityWidget(isRestaurantOpen: isRestaurantOpen),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ];
  }
}
