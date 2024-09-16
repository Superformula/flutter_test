import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/view/widgets/restaurant_open.dart';
import 'package:restaurant_tour/view/widgets/restaurant_star_rating.dart';
import 'package:restaurant_tour/view/widgets/review_tile.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage(this.restaurant, {super.key});
  final Restaurant restaurant;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name ?? 'Restaurant Name'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: restaurant.id ?? 'restaurant_id',
              child: Image.network(
                height: 375,
                restaurant.photos?.first ?? 'https://picsum.photos/375/361',
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 24.0, top: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            restaurant.price ?? "\$\$",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Gap(4),
                          Text(
                            restaurant.categories?.first.title ?? "",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      RestaurantOpen(restaurant.isOpen)
                    ],
                  ),
                  const Gap(16),
                  const Divider(),
                  const Gap(16),
                  const Text('Address'),
                  const Gap(16),
                  Text(
                    restaurant.location?.formattedAddress ?? 'Address info',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontFamily: 'OpenSans', fontWeight: FontWeight.w600),
                  ),
                  const Gap(16),
                  const Divider(),
                  _buildOverallRating(context),
                  const Divider(),
                  _buildReviewSection(context)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildReviewSection(BuildContext context) {
    return (restaurant.reviews != null)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(16),
              Text(
                '${restaurant.reviews!.length} Reviews',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Gap(16),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ReviewTile(restaurant.reviews![index]);
                  },
                  separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Divider(),
                      ),
                  itemCount: restaurant.reviews!.length),
            ],
          )
        : const Text('This restaurant has no reviews');
  }

  Widget _buildOverallRating(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(16),
        const Text('Overall Rating'),
        const Gap(16),
        Row(
          children: [
            Text(restaurant.rating.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontFamily: 'Lora', fontWeight: FontWeight.bold)),
            const Padding(
              padding: const EdgeInsets.only(left: 2, top: 16.0),
              child: const RestaurantStarRating(1),
            ),
          ],
        ),
        const Gap(16)
      ],
    );
  }
}
