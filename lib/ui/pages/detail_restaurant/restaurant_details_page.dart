import 'package:flutter/material.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';
import 'package:restaurant_tour/ui/foundations/typography.dart';
import 'package:restaurant_tour/ui/pages/detail_restaurant/widgets/detail_info_widget.dart';
import 'package:restaurant_tour/ui/pages/detail_restaurant/widgets/fav_btn_widget.dart';
import 'package:restaurant_tour/ui/pages/detail_restaurant/widgets/review_list_widget.dart';
import 'package:restaurant_tour/ui/tokens/colors.dart';
import 'package:restaurant_tour/ui/widgets/image_widget.dart';

class RestaurantDetailsPage extends StatelessWidget {
  final RestaurantEntity? restaurant;
  const RestaurantDetailsPage({super.key, this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OsColors.bgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        shadowColor: OsColors.shadowColor,
        surfaceTintColor: OsColors.bgColor,
        title: Text(
          restaurant!.name,
          style: AppTextStyles.loraRegularTitle,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: OsColors.light,
        actions: [FavoriteBtnWidget(restaurant: restaurant!)],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ImageWidget(
              id: restaurant!.id,
              imageUrl: restaurant!.photos.first,
              height: 361,
              withd: double.infinity,
            ),
          ),
          _restaurantInfo(),
          ReviewListWidget(
            restaurant: restaurant!,
          ),
        ],
      ),
    );
  }

  Widget _restaurantInfo() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Column(
          children: [
            DetailInfoWidget(
              price: restaurant!.price,
              category: restaurant!.categories.first.title,
              isOpen: restaurant!.hours.isNotEmpty && restaurant!.hours.first.isOpenNow,
              address: restaurant!.location.formattedAddress,
              rating: restaurant!.rating,
            ),
          ],
        ),
      ),
    );
  }
}
