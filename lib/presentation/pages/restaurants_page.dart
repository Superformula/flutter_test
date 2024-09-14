import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/presentation/controllers/restaurants/restaurants_cubit.dart';
import 'package:restaurant_tour/presentation/widgets/restaurants_list.dart';

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
          return RestaurantsList(restaurants: state.restaurants);
        }
        return const Center(
          child: Text('Failed to fetch restaurants'),
        );
      },
    );
  }
}
