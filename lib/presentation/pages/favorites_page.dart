import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/core/utils/typography.dart';
import 'package:restaurant_tour/presentation/controllers/favorites/favorites_cubit.dart';
import 'package:restaurant_tour/presentation/widgets/restaurants_list.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();
    context.read<FavoritesCubit>().getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FavoritesLoaded) {
          return RestaurantsList(restaurants: state.favorites);
        }
        if (state is FavoritesEmpty) {
          return const Center(
            child: Text(
              'There is no favorites restaurants',
              style: AppTextStyles.loraRegularTitle,
            ),
          );
        }
        return const Center(
          child: Text(
            'Failed to fetch restaurants',
            style: AppTextStyles.loraRegularTitle,
          ),
        );
      },
    );
  }
}
