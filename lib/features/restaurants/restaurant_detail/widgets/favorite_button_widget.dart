import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/app/app.dart';

class FavoriteButtonWidget extends StatelessWidget {
  const FavoriteButtonWidget({required this.restaurant, super.key});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final isFavoriteRestaurant =
            context.read<FavoriteCubit>().isFavorite(restaurant);
        return InkWell(
          onTap: () {
            context.read<FavoriteCubit>().toggleFavorite(restaurant);
          },
          child: isFavoriteRestaurant
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
        );
      },
    );
  }
}
