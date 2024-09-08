import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_tour/viewmodels/favorites_viewmodel.dart';
import 'package:restaurant_tour/viewmodels/yelp_detail_viewmodel.dart';
import 'package:restaurant_tour/views/restaurant_tile.dart';
import 'package:restaurant_tour/views/yelp_detailview.dart';

class FavoritesView extends StatefulWidget {
  @override
  _FavoritesViewState createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<FavoritesViewModel>();
      viewModel.fetchFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (viewModel.favoriteRestaurants.isEmpty) {
          return Center(
            child: Text(
              'No Favorites Yet',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
            itemCount: viewModel.favoriteRestaurants.length,
            itemBuilder: (context, index) {
              final restaurant = viewModel.favoriteRestaurants[index];
              final detailViewModel = Provider.of<YelpDetailViewModel>(
                  context, listen: false);
              return RestaurantTile(
                restaurant: restaurant,
                onTap: () {
                  if (MediaQuery
                      .of(context)
                      .size
                      .width < 600) {
                    // Mobile: Push to a new screen with a new provider for YelpDetailViewModel
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChangeNotifierProvider(
                              create: (_) =>
                              YelpDetailViewModel()
                                ..selectRestaurant(restaurant),
                              child: YelpDetailView(),
                            ),
                      ),
                    );
                  } else {
                    // Split-view: Update the selected restaurant
                    detailViewModel.selectRestaurant(restaurant);
                  }
                },
              );
            },
        );
      },
    );
  }
}