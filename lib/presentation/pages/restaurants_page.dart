import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/presentation/controllers/cubit/restaurants_cubit.dart';
import 'package:restaurant_tour/presentation/widgets/restaurants_card.dart';

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({super.key});

  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  @override
  void initState() {
    super.initState();
    context.read<RestaurantsCubit>().getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantsCubit, RestaurantsCubitState>(
      builder: (context, state) {
        if (state is RestaurantsCubitLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RestaurantsCubitLoaded) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...state.restaurants.map(
                    (restaurant) => RestaurantsCard(restaurant: restaurant),
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(
          child: Text('Failed to fetch restaurants'),
        );
      },
    );
  }
}
