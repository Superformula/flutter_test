import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/presentation/favorites/favorites_restaurants_bloc.dart';
import 'package:restaurant_tour/presentation/restaurants/restaurants_bloc.dart';
import 'package:restaurant_tour/view/widgets/address_widget.dart';
import 'package:restaurant_tour/view/widgets/favorite_button_widget.dart';
import 'package:restaurant_tour/view/widgets/overall_rating_widget.dart';
import 'package:restaurant_tour/view/widgets/restaurant_category_price_widget.dart';
import 'package:restaurant_tour/view/widgets/restaurant_hero_widget.dart';
import 'package:restaurant_tour/view/widgets/restaurant_open_widget.dart';
import 'package:restaurant_tour/view/widgets/review_list_widget.dart';

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
          FavoriteButtonWidget(
            callback: (isFavorite) {
              GetIt.I.get<FavoritesRestaurantsBloc>().add((isFavorite)
                  ? AddFavoriteRestaurant(widget.restaurant)
                  : RemoveFavoriteRestaurant(widget.restaurant));

              GetIt.I.get<RestaurantsBloc>().add(LoadRestaurants());
            },
            isFavorite: widget.restaurant.isFavorite,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RestaurantHeroWidget(
              imageUrl: widget.restaurant.photos?.first,
              tag: widget.restaurant.id,
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
                      RestaurantCategoryPriceWidget(
                          price: widget.restaurant.price,
                          category: widget.restaurant.categories?.first.title),
                      RestaurantOpenWidget(widget.restaurant.isOpen)
                    ],
                  ),
                  const Gap(16),
                  const Divider(),
                  AddressWidget(
                      address: widget.restaurant.location?.formattedAddress),
                  const Divider(),
                  OverallRatingWidget(rating: widget.restaurant.rating),
                  const Divider(),
                  ReviewListWidget(reviews: widget.restaurant.reviews)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
