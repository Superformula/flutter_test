import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/features/restaurants/restaurant_list/restaurant_list.dart';

class RestaurantListContent extends StatelessWidget {
  const RestaurantListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantListCubit, RestaurantListState>(
      builder: (context, state) {
        return switch (state) {
          RestaurantListInitial() ||
          RestaurantListLoading() =>
            const RestaurantsLoadingListContent(),
          RestaurantListError() => RestaurantListErrorContent(
              errorMesssage: state.errorMessage,
            ),
          RestaurantListLoaded() => state.restaurants.isNotEmpty
              ? RestaurantsList(restaurantsStateLoaded: state)
              : const Center(
                  child: RestaurantListErrorContent(
                    errorMesssage: 'No restaurants available',
                  ),
                ),
        };
      },
    );
  }
}
