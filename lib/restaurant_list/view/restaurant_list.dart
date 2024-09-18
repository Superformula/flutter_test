import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/favorite_restaurants_list/favorite_restaurant_list.dart';
import 'package:restaurant_tour/restaurant_detail/restaurant_detail.dart';
import 'package:restaurant_tour/restaurant_list/restaurant_list.dart';
import 'package:restaurant_ui/restaurant_ui.dart';

class RestaurantListView extends StatelessWidget {
  const RestaurantListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestaurantListBloc, RestaurantListState>(
      listener: (context, state) {
        if (state is RestaurantDetail) {
          // Store bloc references before the async operation
          final restaurantListBloc = context.read<RestaurantListBloc>();
          final favoriteRestaurantsBloc =
              context.read<FavoriteRestaurantsBloc>();

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantDetailView(
                restaurant: state.restaurant,
              ),
            ),
          ).then(
            (_) {
              // Use the stored bloc references
              restaurantListBloc.add(const FetchRestaurantList());
              favoriteRestaurantsBloc.add(const FetchFavoriteRestaurants());
            },
          );
        }
      },
      builder: (context, state) {
        final state = context.select((RestaurantListBloc bloc) => bloc.state);
        if (state is RestaurantListLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is RestaurantListError) {
          return const Text('error');
        }
        if (state is RestaurantListData) {
          final restaurants = state.restaurants;
          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];
              return RestaurantCard(
                tag: restaurant.id ?? '',
                title: restaurant.name ?? '',
                photoUrl: restaurant.heroImage,
                isOpen: restaurant.isOpen,
                price: restaurant.price ?? '',
                rating: restaurant.rating ?? 0.0,
                category: restaurant.displayCategory,
                onTap: () => context
                    .read<RestaurantListBloc>()
                    .add(GoToRestaurantDetail(restaurant: restaurant)),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
