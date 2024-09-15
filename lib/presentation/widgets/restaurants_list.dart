import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/presentation/controllers/restaurants/restaurants_cubit.dart';
import 'package:restaurant_tour/presentation/widgets/restaurants_card.dart';

class RestaurantsList extends StatefulWidget {
  const RestaurantsList({super.key, required this.restaurants});

  final List<Restaurant> restaurants;

  @override
  State<RestaurantsList> createState() => _RestaurantsListState();
}

class _RestaurantsListState extends State<RestaurantsList> {
  final ScrollController _scrollController = ScrollController();

  @override
  initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<RestaurantsCubit>().getNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<RestaurantsCubit>().getRestaurants(
              forceFetch: true,
            );
      },
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = widget.restaurants[index];
          return RestaurantsCard(restaurant: restaurant);
        },
      ),
    );
  }
}
