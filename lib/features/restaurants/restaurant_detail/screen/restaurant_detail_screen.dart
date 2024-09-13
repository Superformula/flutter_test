import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/app/app.dart';
import 'package:restaurant_tour/features/restaurants/restaurant_detail/content/restaurant_detail_content.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({required this.restaurant, super.key});

  final Restaurant restaurant;

  static const String routeName = 'restaurantDetailScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<FavoriteCubit>(),
      child: RestaurantDetailContent(restaurant: restaurant),
    );
  }
}
