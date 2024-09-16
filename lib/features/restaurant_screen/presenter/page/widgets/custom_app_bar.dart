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
    return AppBar(
      leading: BackButton(
        onPressed: () {
          context.pop();
        },
      ),
      title: Text(title),
      actions: [
        BlocBuilder<RestaurantBloc, RestaurantState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const CircularProgressIndicator();
            } else if (state is VerifiedState) {
              return IconButton(
                icon: Icon(
                  state.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: state.isFavorite ? Colors.red : null,
                ),
                onPressed: () {
                  if (!state.isFavorite) {
                    context.read<RestaurantBloc>().add(
                      AddFavoriteEvent(restaurantId: restaurant.id!),
                    );
                    context.read<RestaurantBloc>().add(
                      CheckFavoriteEvent(restaurant: restaurant),
                    );
                  } else {
                    context.read<RestaurantBloc>().add(
                      RemoveFavoriteEvent(restaurantId: restaurant.id!),
                    );
                    context.read<RestaurantBloc>().add(
                      CheckFavoriteEvent(restaurant: restaurant),
                    );
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
