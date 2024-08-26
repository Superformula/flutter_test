import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/cubit/restaurant_cubit.dart';
import 'package:restaurant_tour/models/restaurant.dart';

class RestaurantDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Restaurant restaurant;

  const RestaurantDetailAppBar({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final isFavorite = context
        .watch<RestaurantCubit>()
        .state
        .favoriteRestaurants
        .contains(restaurant.id);
    return AppBar(
      title: Text(restaurant.name ?? ''),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 13.0),
          child: IconButton(
            icon: isFavorite
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border_outlined),
            onPressed: () => context
                .read<RestaurantCubit>()
                .favoriteAResturant(restaurant.id!),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
