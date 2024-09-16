import 'package:flutter/material.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';
import 'package:restaurant_tour/ui/foundations/typography.dart';
import 'package:restaurant_tour/ui/pages/detail_restaurant/widgets/detail_info_widget.dart';
import 'package:restaurant_tour/ui/pages/detail_restaurant/widgets/fav_btn_widget.dart';
import 'package:restaurant_tour/ui/tokens/colors.dart';
import 'package:restaurant_tour/ui/widgets/divider_widget.dart';
import 'package:restaurant_tour/ui/widgets/image_widget.dart';

class RestaurantDetailsPage extends StatelessWidget {
  final RestaurantEntity? restaurant;
  const RestaurantDetailsPage({super.key, this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OsColors.bgColor,
      appBar: AppBar(
        title: Text(
          restaurant!.name,
          style: AppTextStyles.loraRegularTitle,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: OsColors.light,
        actions: [
          FavoriteBtnWidget(
            restaurant: restaurant!,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageWidget(
              id: restaurant!.id,
              imageUrl: restaurant!.photos.first,
              height: 361,
              withd: double.infinity,
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  DetailInfoWidget(
                    price: restaurant!.price,
                    category: restaurant!.categories.first.title,
                    isOpen: restaurant!.hours.isNotEmpty && restaurant!.hours.first.isOpenNow,
                    address: restaurant!.location.formattedAddress,
                    rating: restaurant!.rating,
                  ),
                  const DividerWidget(),
                  const SizedBox(height: 16.0),
                  // const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
