import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_tour/home/presentation/widgets/comment.dart';
import 'package:restaurant_tour/home/models/restaurant.dart';

import '../../../themes/typography.dart';
import '../widgets/custom_divider.dart';
import '../widgets/header.dart';

class RestaurantDetails extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantDetails({
    required this.restaurant,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        title: HeaderHome(
          text: restaurant.name!,
          isDetailsPage: true,
          restaurantId: restaurant.id!,
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: restaurant.photos!.first,
              height: 360,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: 8,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${restaurant.price} ${restaurant.categories?.first.title!}',
                    style: AppTextStyles.openRegularText,
                  ),
                  const Spacer(),
                  Text(
                    restaurant.isOpen ? 'Open Now' : 'Closed',
                    style: AppTextStyles.openRegularItalic,
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.circle,
                    color: restaurant.isOpen ? Colors.green : Colors.red,
                    size: 8,
                  ),
                ],
              ),
            ),
            const CustomDivider(),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Address',
                style: AppTextStyles.openRegularTitle,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                restaurant.location!.formattedAddress!,
                style: AppTextStyles.openRegularTitleSemiBold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const CustomDivider(),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Overall Rating',
                style: AppTextStyles.openRegularTitle,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Text(
                    restaurant.rating.toString(),
                    style: AppTextStyles.loraRegularHeadline.copyWith(
                      fontSize: 32,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            const CustomDivider(),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                '${restaurant.reviews!.length} reviews',
                style: AppTextStyles.openRegularTitle,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                bottom: 16,
              ),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: restaurant.reviews!.length,
                itemBuilder: (_, index) => Comment(
                  photo: restaurant.reviews![index].user!.imageUrl ?? '',
                  userName: restaurant.reviews![index].user!.name ?? '',
                  text: restaurant.reviews![index].text ?? '',
                  rating: restaurant.reviews![index].rating ?? 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
