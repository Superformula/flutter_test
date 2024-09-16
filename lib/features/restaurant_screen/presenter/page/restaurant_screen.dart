import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/core/helpers/hive_helper.dart';
import 'package:restaurant_tour/core/models/restaurant.dart';
import 'package:restaurant_tour/features/restaurant_screen/presenter/bloc/restaurant_bloc.dart';
import 'package:restaurant_tour/features/restaurant_screen/presenter/page/widgets/raiting_area.dart';
import 'package:restaurant_tour/features/restaurant_screen/presenter/page/widgets/restaurant_details_area.dart';
import 'package:restaurant_tour/features/restaurant_screen/presenter/page/widgets/reviews_area.dart';

import 'widgets/custom_app_bar.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RestaurantBloc>(
      create: (context) => RestaurantBloc(
        hiveHelper: HiveHelper(),
      ),
      child: Builder(
        builder: (context) {
          context.read<RestaurantBloc>().add(
                CheckFavoriteEvent(restaurant: restaurant),
              );
          return _Page(restaurant: restaurant);
        },
      ),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: restaurant.name!, restaurant: restaurant),
      body: _Body(restaurant: restaurant),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'restaurant-image-${restaurant.id}',
            child: Image.network(
              restaurant.photos!.first,
              fit: BoxFit.cover,
              width: width,
              height: width,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            child: Column(
              children: [
                RestaurantDetailsArea(restaurant: restaurant),
                RatingArea(
                  rating: restaurant.rating.toString(),
                ),
                ReviewsArea(reviews: restaurant.reviews),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
