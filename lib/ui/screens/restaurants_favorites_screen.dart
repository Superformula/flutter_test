import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/controllers/favorite_restaurant_view_controller.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_list.dart';

final class FavoriteRestaurantsScreen extends StatefulWidget {
  const FavoriteRestaurantsScreen({
    super.key,
    required this.viewController,
    required this.onSelectFavorite,
    required this.onLoadSingleFavorite,
  });

  final FavoriteRestaurantViewController viewController;
  final OnSelectFavoriteCallback onSelectFavorite;
  final OnLoadSingleFavorite onLoadSingleFavorite;

  @override
  State<FavoriteRestaurantsScreen> createState() => _FavoriteRestaurantsScreenState();
}

class _FavoriteRestaurantsScreenState extends State<FavoriteRestaurantsScreen> with AutomaticKeepAliveClientMixin {
  late final viewController = widget.viewController;

  @override
  void initState() {
    super.initState();
    viewController.getFavoriteRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<FavoriteRestaurantViewController, FavoriteRestaurantViewModel>(
      bloc: viewController,
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          child: switch (state) {
            FavoriteRestaurantViewModelLoading() => const Center(child: CircularProgressIndicator()),
            FavoriteRestaurantViewModelData(favorites: final restaurants) => RestaurantsList(
                restaurants: restaurants,
                onSelectFavorite: widget.onSelectFavorite,
                onLoadSingleFavorite: widget.onLoadSingleFavorite,
              ),
            _ => const Center(child: Text('TODO')), // TODO: fix
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
