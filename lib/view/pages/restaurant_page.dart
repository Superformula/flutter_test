import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/presentation/favorites/favorites_restaurants_bloc.dart';
import 'package:restaurant_tour/presentation/restaurants/restaurants_bloc.dart';
import 'package:restaurant_tour/view/widgets/restaurant_open.dart';
import 'package:restaurant_tour/view/widgets/restaurant_star_rating.dart';
import 'package:restaurant_tour/view/widgets/review_tile.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({
    super.key,
    required this.restaurant,
  });
  final Restaurant restaurant;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  late bool isFavoriteState = false;
  @override
  void initState() {
    isFavoriteState = widget.restaurant.isFavorite ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant.name ?? 'Restaurant Name'),
        actions: [
          IconButton(
              onPressed: () {
                GetIt.I.get<FavoritesRestaurantsBloc>().add((isFavoriteState)
                    ? RemoveFavoriteRestaurant(widget.restaurant)
                    : AddFavoriteRestaurant(widget.restaurant));

                GetIt.I.get<RestaurantsBloc>().add(LoadRestaurants());

                setState(() {
                  isFavoriteState = !isFavoriteState;
                });
              },
              icon: (isFavoriteState)
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_outline))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: widget.restaurant.id ?? 'restaurant_id',
              child: Image.network(
                height: 375,
                widget.restaurant.photos?.first ??
                    'https://picsum.photos/375/361',
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
                            widget.restaurant.price ?? "\$\$",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Gap(4),
                          Text(
                            widget.restaurant.categories?.first.title ?? "",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      RestaurantOpen(widget.restaurant.isOpen)
                    ],
                  ),
                  const Gap(16),
                  const Divider(),
                  const Gap(16),
                  const Text('Address'),
                  const Gap(16),
                  Text(
                    widget.restaurant.location?.formattedAddress ??
                        'Address info',
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
    return (widget.restaurant.reviews != null)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(16),
              Text(
                '${widget.restaurant.reviews!.length} Reviews',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Gap(16),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ReviewTile(widget.restaurant.reviews![index]);
                  },
                  separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Divider(),
                      ),
                  itemCount: widget.restaurant.reviews!.length),
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
            Text(widget.restaurant.rating.toString(),
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
