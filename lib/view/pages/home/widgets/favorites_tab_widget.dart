import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/view/cubit/favorite/favorite.dart';

import '../../favorites/favorites_page.dart';

class FavoritesTabWidget extends StatefulWidget {
  const FavoritesTabWidget({super.key});

  @override
  State<FavoritesTabWidget> createState() => _FavoritesTabWidgetState();
}

class _FavoritesTabWidgetState extends State<FavoritesTabWidget> {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          switch (state.status) {
            case FavoriteStatus.initial:
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.inbox,
                    size: 48,
                  ),
                  Text(
                    'You have not added any favorite resaturants!',
                  ),
                ],
              );
            case FavoriteStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case FavoriteStatus.success || FavoriteStatus.removed:
              return FavoritesListBuilder(
                restaurants: state.favorites,
              );
            default:
              return const SizedBox.shrink();
          }
        },
      );
}
