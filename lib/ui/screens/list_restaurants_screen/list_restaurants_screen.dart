import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prototype_constrained_box/prototype_constrained_box.dart';
import 'package:restaurant_tour/main.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/ui/screens/list_restaurants_screen/state.dart';
import 'package:restaurant_tour/ui/screens/restaurant_details_screen/restaurant_details_screen.dart';
import 'package:restaurant_tour/ui/typography.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_hour_status.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_image.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_price_and_category_info.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_rating.dart';

class ListRestaurantsScreen extends StatelessWidget {
  const ListRestaurantsScreen({
    super.key,
    required this.state,
  });

  final ListRestaurantsScreenState state;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('RestauranTour'),
          bottom: const TabBar(
            tabAlignment: TabAlignment.center,
            labelPadding: EdgeInsets.all(8.0),
            tabs: [
              Text('All Restaurants'),
              Text('My Favorites'),
            ],
          ),
        ),
        body: switch (state) {
          LoadingRestaurants() => _LoadingRestaurants(),
          RestaurantsData(:final restaurants) => _RestaurantsData(restaurants: restaurants),
          RestaurantsError(:final exception) => Text('Error: $exception'),
        },
      ),
    );
  }
}

final class _LoadingRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

final class _RestaurantsData extends StatelessWidget {
  const _RestaurantsData({
    required this.restaurants,
  });

  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantTourCubit, List<String>>(
      builder: (context, state) {
        final filteredRestaurants = [
          for (final restaurant in restaurants)
            if (state.contains(restaurant.id)) restaurant,
        ];
        
        return TabBarView(
          children: [
            _RestaurantsList(restaurants: restaurants),
            _RestaurantsList(restaurants: filteredRestaurants),
          ],
        );
      },
    );
  }
}

final class _RestaurantsList extends StatelessWidget {
  const _RestaurantsList({
    required this.restaurants,
  });

  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    // The figma specifies 12.0, but there's already a perceived padding from
    // the card, so we compensate it.
    const verticalPadding = 4.0;

    return ListView.separated(
      padding: EdgeInsets.fromLTRB(
        12.0,
        verticalPadding * 2.0,
        12.0,
        verticalPadding * 2.0 + MediaQuery.of(context).padding.bottom,
      ),
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        return _RestaurantCard(restaurant: restaurants[index]);
      },
      separatorBuilder: (context, index) => const SizedBox(height: verticalPadding),
    );
  }
}

final class _RestaurantCard extends StatelessWidget {
  const _RestaurantCard({
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RestaurantDetailsScreen(
                restaurant: restaurant,
                onFavorite: () => context.read<RestaurantTourCubit>().toggleFavorite(restaurant.id),
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox.square(
                dimension: 88.0,
                child: RestaurantImage(
                  restaurant: restaurant,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PrototypeConstrainedBox.tightFor(
                      height: true,
                      prototype: const Text(
                        'First line\nSecond line',
                        style: AppTextStyles.loraSubtitle1,
                      ),
                      child: Text(
                        restaurant.name,
                        style: AppTextStyles.loraSubtitle1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    RestaurantPriceAndCategoryInfo(restaurant: restaurant),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        RestaurantRating(restaurant: restaurant),
                        const Spacer(),
                        RestaurantHourStatus(restaurant: restaurant),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
