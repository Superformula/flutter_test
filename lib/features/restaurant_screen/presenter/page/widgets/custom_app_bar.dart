import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_tour/core/models/restaurant.dart';
import 'package:restaurant_tour/features/restaurant_screen/presenter/bloc/restaurant_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.restaurant,
  });

  final String title;
  final Restaurant restaurant;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ],
      ),
      leading: BackButton(
        color: Colors.black,
        onPressed: () {
          context.pop(!isFavorite);
        },
      ),
      actions: [
        BlocBuilder<RestaurantBloc, RestaurantState>(
          builder: (context, state) {
            if (state is AppBarLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is VerifiedState) {
              isFavorite = state.isFavorite;
              return IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.black,
                ),
                onPressed: () {
                  if (!isFavorite) {
                    context
                        .read<RestaurantBloc>()
                        .add(AddFavoriteEvent(restaurantId: restaurant.id!));
                  } else {
                    context
                        .read<RestaurantBloc>()
                        .add(RemoveFavoriteEvent(restaurantId: restaurant.id!));
                  }
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
